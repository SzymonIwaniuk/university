import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.SplittableRandom;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.locks.LockSupport;

/**
 * Two experiments, results in csv/:
 * rw.csv   - readers-writers, time and waiting times for 10-100 readers and 1-10 writers,
 * list.csv - fine-grained vs one-lock list, throughput for different operation costs and thread counts.
 */
public class Main {
    static final long US = 1_000L, MS = 1_000_000L;
    static final String[] RW_IMPLS = {"sem", "fair", "cond"};
    static final int READ_OPS = 20, WRITE_OPS = 20;
    static final long READ_NS = 200 * US, WRITE_NS = 200 * US, THINK_NS = MS;
    static final String[] LIST_IMPLS = {"coarse", "fine"};
    static final long[] COSTS_NS = {0, 100, 1_000, 10_000};
    static final int[] LIST_OPS = {40_000, 20_000, 4_000, 800}; // total operations for each cost
    static final int[] LIST_THREADS = {1, 2, 4, 8};
    static final int KEYS = 100;
    static final int REPS = 3;

    static void pause(SplittableRandom rnd, long meanNs) {
        long end = System.nanoTime() + rnd.nextLong(2 * meanNs);
        long left;
        while ((left = end - System.nanoTime()) > 0) LockSupport.parkNanos(left);
    }

    /** Starts the tasks together, waits for them and rethrows the first exception. */
    static long runAll(List<Runnable> tasks) throws InterruptedException {
        CountDownLatch start = new CountDownLatch(1);
        AtomicReference<Throwable> error = new AtomicReference<>();
        List<Thread> threads = new ArrayList<>();
        for (Runnable task : tasks) {
            Thread t = new Thread(() -> {
                try {
                    start.await();
                    task.run();
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            });
            t.setUncaughtExceptionHandler((th, e) -> error.compareAndSet(null, e));
            threads.add(t);
            t.start();
        }
        long t0 = System.nanoTime();
        start.countDown();
        for (Thread t : threads) {
            t.join(60_000);
            if (t.isAlive()) throw new IllegalStateException("thread did not finish (deadlock?)");
        }
        long elapsed = System.nanoTime() - t0;
        if (error.get() != null) throw new IllegalStateException(error.get());
        return elapsed;
    }

    interface Body {
        void run() throws InterruptedException;
    }

    static Runnable task(Body body) {
        return () -> {
            try {
                body.run();
            } catch (InterruptedException e) {
                throw new IllegalStateException(e);
            }
        };
    }

    record RwResult(long timeNs, double readerWaitUs, double writerWaitUs, double writerMaxWaitUs) {}

    static RwResult runRw(String impl, int readers, int writers, long seed) throws InterruptedException {
        ReadingRoom room = ReadingRoom.create(impl);
        AtomicInteger readersIn = new AtomicInteger(), writersIn = new AtomicInteger();
        long[] waitSum = new long[readers + writers], waitMax = new long[readers + writers];
        List<Runnable> tasks = new ArrayList<>();
        for (int t = 0; t < readers + writers; t++) {
            boolean reader = t < readers;
            int id = t;
            SplittableRandom rnd = new SplittableRandom(seed * 1_000 + t);
            tasks.add(task(() -> {
                for (int op = 0; op < (reader ? READ_OPS : WRITE_OPS); op++) {
                    pause(rnd, THINK_NS);
                    long t0 = System.nanoTime();
                    if (reader) room.startRead(); else room.startWrite();
                    long w = System.nanoTime() - t0;
                    waitSum[id] += w;
                    waitMax[id] = Math.max(waitMax[id], w);
                    if (reader) {
                        readersIn.incrementAndGet();
                        if (writersIn.get() > 0) throw new IllegalStateException("reader and writer inside");
                        pause(rnd, READ_NS);
                        readersIn.decrementAndGet();
                        room.endRead();
                    } else {
                        if (writersIn.incrementAndGet() > 1 || readersIn.get() > 0)
                            throw new IllegalStateException("writer not alone");
                        pause(rnd, WRITE_NS);
                        writersIn.decrementAndGet();
                        room.endWrite();
                    }
                }
            }));
        }
        long time = runAll(tasks);
        double rw = 0, ww = 0, wmax = 0;
        for (int t = 0; t < readers + writers; t++) {
            if (t < readers) rw += waitSum[t];
            else {
                ww += waitSum[t];
                wmax = Math.max(wmax, waitMax[t]);
            }
        }
        return new RwResult(time, rw / 1e3 / ((double) readers * READ_OPS), ww / 1e3 / ((double) writers * WRITE_OPS), wmax / 1e3);
    }

    static long runList(String impl, long costNs, int threads, int totalOps, long seed) throws InterruptedException {
        ConcurrentList list = ConcurrentList.create(impl, 0);
        for (int k = 0; k < KEYS; k++) list.add(k);
        ConcurrentList measured = ConcurrentList.create(impl, costNs);
        for (int k = 0; k < KEYS; k++) measured.add(k);
        AtomicInteger adds = new AtomicInteger(), removed = new AtomicInteger();
        List<Runnable> tasks = new ArrayList<>();
        for (int t = 0; t < threads; t++) {
            SplittableRandom rnd = new SplittableRandom(seed * 1_000 + t);
            tasks.add(() -> {
                for (int op = 0; op < totalOps / threads; op++) {
                    Integer key = rnd.nextInt(KEYS);
                    int r = rnd.nextInt(100);
                    if (r < 60) measured.contains(key);
                    else if (r < 80) {
                        measured.add(key);
                        adds.incrementAndGet();
                    } else if (measured.remove(key)) removed.incrementAndGet();
                }
            });
        }
        long time = runAll(tasks);
        if (measured.size() != KEYS + adds.get() - removed.get())
            throw new IllegalStateException(impl + ": size " + measured.size() + " != " + (KEYS + adds.get() - removed.get()));
        return time;
    }

    public static void main(String[] args) throws IOException, InterruptedException {
        String out = args.length > 0 ? args[0] : "csv";

        // JIT warm-up, results discarded
        for (int i = 0; i < 3; i++) {
            for (String impl : RW_IMPLS) runRw(impl, 50, 5, i);
            for (String impl : LIST_IMPLS) runList(impl, 0, 4, 20_000, i);
        }

        try (PrintWriter w = new PrintWriter(new FileWriter(out + "/rw.csv"))) {
            w.println("impl,readers,writers,rep,time_ms,reader_wait_us,writer_wait_us,writer_max_wait_us");
            for (int readers = 10; readers <= 100; readers += 10)
                for (int writers = 1; writers <= 10; writers++)
                    for (String impl : RW_IMPLS)
                        for (int r = 0; r < REPS; r++) {
                            RwResult res = runRw(impl, readers, writers, r);
                            w.printf("%s,%d,%d,%d,%.3f,%.3f,%.3f,%.3f%n", impl, readers, writers, r, res.timeNs() / 1e6,
                                    res.readerWaitUs(), res.writerWaitUs(), res.writerMaxWaitUs());
                            System.out.printf("rw %-4s R=%-3d W=%-2d rep %d: %7.1f ms, reader wait %8.1f us, writer wait %8.1f us%n",
                                    impl, readers, writers, r, res.timeNs() / 1e6, res.readerWaitUs(), res.writerWaitUs());
                        }
        }

        try (PrintWriter w = new PrintWriter(new FileWriter(out + "/list.csv"))) {
            w.println("impl,cost_ns,threads,ops,rep,time_ms,throughput");
            for (int c = 0; c < COSTS_NS.length; c++)
                for (int threads : LIST_THREADS)
                    for (String impl : LIST_IMPLS)
                        for (int r = 0; r < REPS; r++) {
                            long ns = runList(impl, COSTS_NS[c], threads, LIST_OPS[c], r);
                            int ops = LIST_OPS[c] / threads * threads;
                            w.printf("%s,%d,%d,%d,%d,%.3f,%.1f%n", impl, COSTS_NS[c], threads, ops, r, ns / 1e6, ops / (ns / 1e9));
                            System.out.printf("list %-6s cost=%-5d T=%d rep %d: %8.1f ms, %10.0f ops/s%n",
                                    impl, COSTS_NS[c], threads, r, ns / 1e6, ops / (ns / 1e9));
                        }
        }
    }
}
