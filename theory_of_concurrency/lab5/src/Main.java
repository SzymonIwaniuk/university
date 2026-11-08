import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicIntegerArray;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.locks.LockSupport;

/**
 * Three experiments, results in csv/:
 * runs.csv       - deadlock-free solutions, throughput, waiting time and fairness vs n and scenario,
 * deadlock.csv   - naive solution, time until deadlock,
 * starvation.csv - n = 5 with two greedy philosophers, meals of every philosopher.
 */
public class Main {
    static final String[] IMPLS = {"both", "waiter", "asym"};
    static final int[] SIZES = {5, 10, 20, 50, 100};
    static final int[] DEADLOCK_SIZES = {5, 10, 20, 50};
    static final long MS = 1_000_000L;
    /** name, mean thinking time, mean eating time [ns] */
    record Scenario(String name, long thinkNs, long eatNs) {}
    static final Scenario[] SCENARIOS = {
            new Scenario("0/0", 0, 0),
            new Scenario("0/1", 0, MS),
            new Scenario("1/1", MS, MS),
            new Scenario("10/1", 10 * MS, MS),
    };
    static final long RUN_NS = 1000 * MS;
    static final int REPS = 3;
    static final int DEADLOCK_REPS = 20;
    static final long STARVE_NS = 3000 * MS;

    record Result(long timeNs, boolean deadlock, long[] meals, double[] perMeanUs, double[] perMaxUs) {
        long totalMeals() {
            return Arrays.stream(meals).sum();
        }

        double meanWaitUs() {
            double sum = 0;
            for (int i = 0; i < meals.length; i++) sum += perMeanUs[i] * meals[i];
            return totalMeals() == 0 ? 0 : sum / totalMeals();
        }

        double maxWaitUs() {
            return Arrays.stream(perMaxUs).max().orElse(0);
        }

        /** Jain's index of meals: 1 when everybody ate the same number of times, 1/n when one ate. */
        double jain() {
            double sum = 0, sumSq = 0;
            for (long m : meals) {
                sum += m;
                sumSq += (double) m * m;
            }
            return sumSq == 0 ? 0 : sum * sum / (meals.length * sumSq);
        }
    }

    static Result run(String impl, long[] think, long[] eat, long limitNs, long seed) throws InterruptedException {
        int n = think.length;
        Table table = Table.create(impl, n);
        AtomicIntegerArray eating = new AtomicIntegerArray(n);
        AtomicReference<Throwable> error = new AtomicReference<>();
        CountDownLatch start = new CountDownLatch(1);
        Philosopher[] ph = new Philosopher[n];
        for (int i = 0; i < n; i++) {
            ph[i] = new Philosopher(i, table, think[i], eat[i], seed * 1_000 + i, eating, start);
            ph[i].setUncaughtExceptionHandler((t, e) -> error.compareAndSet(null, e));
            ph[i].start();
        }
        long t0 = System.nanoTime();
        start.countDown();
        boolean deadlock = false;
        while (System.nanoTime() - t0 < limitNs) {
            if (table.deadlocked()) {
                deadlock = true;
                break;
            }
            LockSupport.parkNanos(100_000);
        }
        long elapsed = System.nanoTime() - t0;
        for (Philosopher p : ph) p.finish();
        if (deadlock) for (Philosopher p : ph) p.interrupt();
        for (Philosopher p : ph) p.join();
        if (error.get() != null) throw new IllegalStateException(impl, error.get());

        long[] meals = new long[n];
        double[] mean = new double[n], max = new double[n];
        for (int i = 0; i < n; i++) {
            meals[i] = ph[i].meals;
            mean[i] = meals[i] == 0 ? 0 : ph[i].waitSumNs / 1e3 / meals[i];
            max[i] = ph[i].waitMaxNs / 1e3;
        }
        return new Result(elapsed, deadlock, meals, mean, max);
    }

    static long[] same(int n, long v) {
        long[] a = new long[n];
        Arrays.fill(a, v);
        return a;
    }

    public static void main(String[] args) throws IOException, InterruptedException {
        String out = args.length > 0 ? args[0] : "csv";

        // JIT warm-up, results discarded
        for (String impl : IMPLS)
            for (int i = 0; i < 3; i++) run(impl, same(10, 0), same(10, 0), 300 * MS, i);

        try (PrintWriter w = new PrintWriter(new FileWriter(out + "/runs.csv"))) {
            w.println("impl,scenario,n,rep,time_ms,meals,throughput,mean_wait_us,max_wait_us,jain");
            for (Scenario s : SCENARIOS)
                for (int n : SIZES)
                    for (String impl : IMPLS)
                        for (int r = 0; r < REPS; r++) {
                            Result res = run(impl, same(n, s.thinkNs()), same(n, s.eatNs()), RUN_NS, r);
                            if (res.deadlock()) throw new IllegalStateException(impl + " deadlocked");
                            double sec = res.timeNs() / 1e9;
                            w.printf("%s,%s,%d,%d,%.3f,%d,%.1f,%.3f,%.3f,%.4f%n", impl, s.name(), n, r,
                                    res.timeNs() / 1e6, res.totalMeals(), res.totalMeals() / sec,
                                    res.meanWaitUs(), res.maxWaitUs(), res.jain());
                            System.out.printf("%-5s n=%-3d %-6s rep %d: %10.0f meals/s, wait %9.1f us, J=%.3f%n",
                                    s.name(), n, impl, r, res.totalMeals() / sec, res.meanWaitUs(), res.jain());
                        }
        }

        try (PrintWriter w = new PrintWriter(new FileWriter(out + "/deadlock.csv"))) {
            w.println("scenario,n,rep,deadlock,time_ms,meals");
            for (Scenario s : SCENARIOS)
                for (int n : DEADLOCK_SIZES)
                    for (int r = 0; r < DEADLOCK_REPS; r++) {
                        Result res = run("naive", same(n, s.thinkNs()), same(n, s.eatNs()), RUN_NS, r);
                        w.printf("%s,%d,%d,%d,%.3f,%d%n", s.name(), n, r, res.deadlock() ? 1 : 0,
                                res.timeNs() / 1e6, res.totalMeals());
                        System.out.printf("%-5s n=%-3d naive  rep %2d: %s after %8.2f ms, %d meals%n", s.name(), n, r,
                                res.deadlock() ? "DEADLOCK" : "no deadlock", res.timeNs() / 1e6, res.totalMeals());
                    }
        }

        // philosophers 1 and 3 never think and eat 2 ms, the others think 10 ms and eat 1 ms
        long[] think = {10 * MS, 0, 10 * MS, 0, 10 * MS};
        long[] eat = {MS, 2 * MS, MS, 2 * MS, MS};
        try (PrintWriter w = new PrintWriter(new FileWriter(out + "/starvation.csv"))) {
            w.println("impl,rep,philosopher,meals,mean_wait_us,max_wait_us");
            for (String impl : IMPLS)
                for (int r = 0; r < REPS; r++) {
                    Result res = run(impl, think, eat, STARVE_NS, r);
                    for (int i = 0; i < 5; i++)
                        w.printf("%s,%d,%d,%d,%.3f,%.3f%n", impl, r, i, res.meals()[i], res.perMeanUs()[i], res.perMaxUs()[i]);
                    System.out.printf("starvation %-6s rep %d: meals %s%n", impl, r, Arrays.toString(res.meals()));
                }
        }
    }
}
