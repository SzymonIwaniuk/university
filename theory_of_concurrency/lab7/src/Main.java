import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;

/**
 * Passes ITEMS elements from p producers to p consumers through the Active Object buffer ("ao")
 * or a monitor buffer ("monitor"). Every client does its own work per element and every buffer
 * operation costs SERVANT_US.
 * Writes csv/times.csv.
 */
public class Main {
    static final int ITEMS = 20_000;
    static final int[] THREADS = {1, 2, 4, 8};
    static final int[] CAPACITIES = {1, 10, 100};
    static final long[] WORK_US = {0, 10, 100};
    static final long[] SERVANT_US = {0, 10};
    static final int REPS = 3;

    interface Client {
        void run(int id) throws InterruptedException;
    }

    /** Returns elapsed ns, checks that every element was taken exactly once (count and sum). */
    static long run(String impl, int p, int capacity, long workNs, long servantNs) throws InterruptedException {
        int perThread = ITEMS / p;
        AtomicLong takenSum = new AtomicLong(), takenCount = new AtomicLong();
        Scheduler scheduler = null;
        Client producer, consumer;
        if (impl.equals("ao")) {
            ActivationQueue queue = new ActivationQueue();
            Proxy proxy = new Proxy(new Servant(capacity, servantNs), queue);
            scheduler = new Scheduler(queue);
            scheduler.start();
            producer = id -> {
                for (int i = 0; i < perThread; i++) {
                    Future<Void> f = proxy.put(id * perThread + i);
                    Work.spin(workNs);            // own work while the request waits
                    f.get();
                }
            };
            consumer = id -> {
                long sum = 0;
                for (int i = 0; i < perThread; i++) {
                    Future<Integer> f = proxy.take();
                    Work.spin(workNs);
                    sum += f.get();
                }
                takenSum.addAndGet(sum);
                takenCount.addAndGet(perThread);
            };
        } else {
            MonitorBuffer buffer = new MonitorBuffer(capacity, servantNs);
            producer = id -> {
                for (int i = 0; i < perThread; i++) {
                    buffer.put(id * perThread + i);
                    Work.spin(workNs);
                }
            };
            consumer = id -> {
                long sum = 0;
                for (int i = 0; i < perThread; i++) {
                    sum += buffer.take();
                    Work.spin(workNs);
                }
                takenSum.addAndGet(sum);
                takenCount.addAndGet(perThread);
            };
        }

        CountDownLatch start = new CountDownLatch(1);
        AtomicReference<Throwable> error = new AtomicReference<>();
        Thread[] threads = new Thread[2 * p];
        for (int t = 0; t < 2 * p; t++) {
            int id = t % p;
            Client c = t < p ? producer : consumer;
            threads[t] = new Thread(() -> {
                try {
                    start.await();
                    c.run(id);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            });
            threads[t].setUncaughtExceptionHandler((th, e) -> error.compareAndSet(null, e));
            threads[t].start();
        }
        long t0 = System.nanoTime();
        start.countDown();
        for (Thread th : threads) {
            th.join(60_000);
            if (th.isAlive()) throw new IllegalStateException(impl + ": client did not finish");
        }
        long elapsed = System.nanoTime() - t0;
        if (scheduler != null) {
            scheduler.shutdown();
            scheduler.join();
        }
        if (error.get() != null) throw new IllegalStateException(impl, error.get());
        long n = (long) perThread * p;
        if (takenCount.get() != n || takenSum.get() != n * (n - 1) / 2)
            throw new IllegalStateException(impl + ": taken " + takenCount + " elements, sum " + takenSum);
        return elapsed;
    }

    public static void main(String[] args) throws IOException, InterruptedException {
        String out = args.length > 0 ? args[0] : "csv";
        for (int i = 0; i < 5; i++) { // JIT warm-up
            run("ao", 4, 10, 0, 0);
            run("monitor", 4, 10, 0, 0);
        }
        try (PrintWriter w = new PrintWriter(new FileWriter(out + "/times.csv"))) {
            w.println("impl,servant_us,threads,capacity,work_us,rep,time_ms");
            for (long servant : SERVANT_US)
            for (long work : WORK_US)
                for (int cap : CAPACITIES)
                    for (int p : THREADS)
                        for (String impl : new String[]{"ao", "monitor"}) {
                            double[] ms = new double[REPS];
                            for (int r = 0; r < REPS; r++) {
                                ms[r] = run(impl, p, cap, work * 1000, servant * 1000) / 1e6;
                                w.printf("%s,%d,%d,%d,%d,%d,%.3f%n", impl, servant, p, cap, work, r, ms[r]);
                            }
                            Arrays.sort(ms);
                            System.out.printf("s=%-2d w=%-3d cap=%-3d p=%d %-7s median %8.1f ms%n", servant, work, cap, p, impl, ms[REPS / 2]);
                            w.flush();
                        }
        }
    }
}
