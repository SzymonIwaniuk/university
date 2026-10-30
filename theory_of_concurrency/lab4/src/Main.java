import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.SplittableRandom;
import java.util.concurrent.CountDownLatch;

/**
 * Runs every implementation for a grid of M, producer and consumer counts and writes
 * csv/times.csv (wall time) and csv/waits.csv (time spent in put/take per portion size).
 */
public class Main {
    static final String[] IMPLS = {"monitor", "lock", "fair", "ticket"};
    static final int[] PORTIONS = {100, 1000, 10000};
    static final int[] THREADS = {1, 2, 4, 8, 16, 32};
    static final int OPS = 20_000;   // expected number of put calls in one run
    static final int REPS = 3;
    static final int BUCKETS = 10;   // portion sizes 1..M split into equal ranges

    /** Wait time histogram of one thread, merged after the run. */
    static final class Stats {
        final long[] count = new long[BUCKETS];
        final long[] sumNs = new long[BUCKETS];
        final long[] maxNs = new long[BUCKETS];

        void record(int bucket, long ns) {
            count[bucket]++;
            sumNs[bucket] += ns;
            maxNs[bucket] = Math.max(maxNs[bucket], ns);
        }

        void merge(Stats o) {
            for (int b = 0; b < BUCKETS; b++) {
                count[b] += o.count[b];
                sumNs[b] += o.sumNs[b];
                maxNs[b] = Math.max(maxNs[b], o.maxNs[b]);
            }
        }
    }

    /** Jain's index of calls per thread: 1 when all threads did the same work, 1/k when one did all. */
    static double jain(Stats[] stats, int from, int to) {
        double sum = 0, sumSq = 0;
        for (int t = from; t < to; t++) {
            long calls = Arrays.stream(stats[t].count).sum();
            sum += calls;
            sumSq += (double) calls * calls;
        }
        return sumSq == 0 ? 1 : sum * sum / ((to - from) * sumSq);
    }

    record Result(long timeNs, Stats producers, Stats consumers, double jainProducers, double jainConsumers) {}

    static Result run(String impl, int m, int producers, int consumers, long seed) throws InterruptedException {
        long total = (long) OPS * (m + 1) / 2;
        Buffer buffer = Buffer.create(impl, 2 * m, total);
        CountDownLatch ready = new CountDownLatch(producers + consumers);
        CountDownLatch start = new CountDownLatch(1);
        List<Thread> threads = new ArrayList<>();
        Stats[] stats = new Stats[producers + consumers];

        for (int t = 0; t < producers + consumers; t++) {
            boolean producer = t < producers;
            Stats s = stats[t] = new Stats();
            SplittableRandom rnd = new SplittableRandom(seed * 1_000 + t);
            threads.add(new Thread(() -> {
                try {
                    ready.countDown();
                    start.await();
                    while (true) {
                        int want = rnd.nextInt(m) + 1;
                        long t0 = System.nanoTime();
                        boolean ok = producer ? buffer.put(want) : buffer.take(want);
                        if (!ok) break;
                        s.record((want - 1) * BUCKETS / m, System.nanoTime() - t0);
                    }
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            }));
        }
        for (Thread th : threads) th.start();
        ready.await();
        long t0 = System.nanoTime();
        start.countDown();
        for (Thread th : threads) th.join();
        long elapsed = System.nanoTime() - t0;

        if (buffer.size != 0 || buffer.toProduce != 0 || buffer.toConsume != 0)
            throw new IllegalStateException(impl + ": buffer not drained");
        Stats p = new Stats(), c = new Stats();
        for (int t = 0; t < stats.length; t++) (t < producers ? p : c).merge(stats[t]);
        return new Result(elapsed, p, c, jain(stats, 0, producers), jain(stats, producers, stats.length));
    }

    static void writeWaits(PrintWriter w, String impl, int m, int producers, int consumers, String role, Stats s) {
        for (int b = 0; b < BUCKETS; b++) {
            if (s.count[b] == 0) continue;
            w.printf("%s,%d,%d,%d,%s,%d,%d,%d,%.3f,%.3f%n", impl, m, producers, consumers, role,
                    b * m / BUCKETS + 1, (b + 1) * m / BUCKETS, s.count[b],
                    s.sumNs[b] / 1e3 / s.count[b], s.maxNs[b] / 1e3);
        }
    }

    public static void main(String[] args) throws IOException, InterruptedException {
        String out = args.length > 0 ? args[0] : "csv";

        // JIT warm-up, results discarded
        for (String impl : IMPLS)
            for (int i = 0; i < 5; i++) run(impl, 1000, 4, 4, i);

        try (PrintWriter times = new PrintWriter(new FileWriter(out + "/times.csv"));
             PrintWriter waits = new PrintWriter(new FileWriter(out + "/waits.csv"))) {
            times.println("impl,M,producers,consumers,rep,time_ms,jain_producers,jain_consumers");
            waits.println("impl,M,producers,consumers,role,portion_lo,portion_hi,count,mean_us,max_us");
            for (int m : PORTIONS)
                for (int p : THREADS)
                    for (int c : THREADS) {
                        for (String impl : IMPLS) {
                            Stats ps = new Stats(), cs = new Stats();
                            double[] ms = new double[REPS];
                            for (int r = 0; r < REPS; r++) {
                                Result res = run(impl, m, p, c, r);
                                ms[r] = res.timeNs() / 1e6;
                                times.printf("%s,%d,%d,%d,%d,%.3f,%.4f,%.4f%n", impl, m, p, c, r, ms[r], res.jainProducers(), res.jainConsumers());
                                ps.merge(res.producers());
                                cs.merge(res.consumers());
                            }
                            writeWaits(waits, impl, m, p, c, "producer", ps);
                            writeWaits(waits, impl, m, p, c, "consumer", cs);
                            Arrays.sort(ms);
                            System.out.printf("M=%-5d p=%-2d c=%-2d %-7s median %8.1f ms%n", m, p, c, impl, ms[REPS / 2]);
                        }
                        times.flush();
                    }
        }
    }
}
