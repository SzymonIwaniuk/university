import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.LongAdder;
import javax.imageio.ImageIO;

/**
 * Benchmark of the Mandelbrot computation on different executors.
 * Experiments: scaling (executor x threads x MAX_ITER), granularity (task shape), load (per-thread busy time).
 * Writes csv/times.csv, csv/load.csv, csv/loadthreads.csv and the image of the set.
 * Every run checks the image against the sequential reference.
 */
public class Main {
    static final int[] MAX_ITER = {500, 1000, 2000, 5000, 10000};
    static final int[] THREADS = {1, 2, 4, 6, 8, 10, 12, 16};
    static final String[] SHAPES = {"rows:1", "rows:4", "rows:16", "rows:64", "tile:8", "tile:32", "perthread"};
    static final int[] GRAN_THREADS = {4, 10};
    static final int GRAN_ITER = 2000;
    static final int REPS = 3;

    static final Map<Integer, int[]> REF = new HashMap<>();

    static int[] reference(int maxIter) {
        return REF.computeIfAbsent(maxIter, it -> {
            Mandelbrot m = new Mandelbrot(it);
            m.computeSequential();
            return m.iters;
        });
    }

    static void shutdown(ExecutorService ex) throws InterruptedException {
        ex.shutdown();
        if (!ex.awaitTermination(10, TimeUnit.SECONDS)) throw new AssertionError("executor did not terminate");
    }

    static void check(Mandelbrot m) {
        if (!Arrays.equals(m.iters, reference(m.maxIter))) throw new AssertionError("image differs from the reference");
    }

    /** Pool creation, task submission and waiting for all Futures. Returns elapsed ns; pool[0] = largest pool size. */
    static long run(String exec, int n, int maxIter, String shape, int[] pool) throws InterruptedException {
        Mandelbrot m = new Mandelbrot(maxIter);
        List<Mandelbrot.Region> regions = Mandelbrot.regions(shape, n);
        long t0 = System.nanoTime();
        ExecutorService ex = Executors2.create(exec, n);
        m.compute(ex, regions);
        long t = System.nanoTime() - t0;
        pool[0] = Executors2.largestPool(ex);
        shutdown(ex);
        check(m);
        return t;
    }

    static long runSequential(int maxIter) {
        Mandelbrot m = new Mandelbrot(maxIter);
        long t0 = System.nanoTime();
        m.computeSequential();
        long t = System.nanoTime() - t0;
        check(m);
        return t;
    }

    /** Busy time (ns) of every worker thread, padded with zeros to n threads, plus wall time in wall[0]. */
    static double[] runLoad(String exec, int n, int maxIter, String shape, long[] wall) throws InterruptedException {
        Mandelbrot m = new Mandelbrot(maxIter);
        List<Mandelbrot.Region> regions = Mandelbrot.regions(shape, n);
        Map<Thread, LongAdder> busy = new ConcurrentHashMap<>();
        long t0 = System.nanoTime();
        ExecutorService ex = Executors2.create(exec, n);
        List<Future<Void>> futures = new ArrayList<>();
        for (Mandelbrot.Region r : regions) {
            Callable<Void> task = () -> {
                long s = System.nanoTime();
                m.compute(r);
                busy.computeIfAbsent(Thread.currentThread(), k -> new LongAdder()).add(System.nanoTime() - s);
                return null;
            };
            futures.add(ex.submit(task));
        }
        for (Future<Void> f : futures) {
            try {
                f.get();
            } catch (ExecutionException e) {
                throw new RuntimeException("task failed", e.getCause());
            }
        }
        wall[0] = System.nanoTime() - t0;
        shutdown(ex);
        check(m);
        double[] v = new double[Math.max(n, busy.size())];
        int i = 0;
        for (LongAdder a : busy.values()) v[i++] = a.sum();
        Arrays.sort(v);
        for (int a = 0, b = v.length - 1; a < b; a++, b--) { double t = v[a]; v[a] = v[b]; v[b] = t; }
        return v;
    }

    static double jain(double[] x) {
        double s = 0, s2 = 0;
        for (double v : x) { s += v; s2 += v * v; }
        return s * s / (x.length * s2);
    }

    /** Colour stops: t in [0,1] -> RGB, from deep blue (fast escape) through white to gold (near the set). */
    static final double[] STOP_T = {0.0, 0.35, 0.65, 0.88, 1.0};
    static final int[][] STOP_RGB = {{0, 0, 60}, {0, 20, 150}, {50, 130, 255}, {255, 255, 255}, {255, 190, 50}};

    static int color(int escapeIter) {
        if (escapeIter < 0) return 0;                       // inside the set
        double t = 1 - Math.exp(-escapeIter / 28.0);
        int i = 0;
        while (i < STOP_T.length - 2 && t > STOP_T[i + 1]) i++;
        double f = (t - STOP_T[i]) / (STOP_T[i + 1] - STOP_T[i]);
        int rgb = 0;
        for (int k = 0; k < 3; k++)
            rgb = (rgb << 8) | (int) (STOP_RGB[i][k] + f * (STOP_RGB[i + 1][k] - STOP_RGB[i][k]));
        return rgb;
    }

    /** Image for the report: the same computation as in the benchmark (fixed pool, 1 row per task, MAX_ITER = 570). */
    static void writeImage(String path) throws Exception {
        Mandelbrot m = new Mandelbrot(570);
        ExecutorService ex = Executors2.create("fixed", 10);
        m.compute(ex, Mandelbrot.regions("rows:1", 10));
        shutdown(ex);
        check(m);
        BufferedImage img = new BufferedImage(Mandelbrot.WIDTH, Mandelbrot.HEIGHT, BufferedImage.TYPE_INT_RGB);
        for (int y = 0; y < Mandelbrot.HEIGHT; y++)
            for (int x = 0; x < Mandelbrot.WIDTH; x++) {
                int left = m.iters[y * Mandelbrot.WIDTH + x];
                img.setRGB(x, y, color(left == 0 ? -1 : m.maxIter - left));
            }
        ImageIO.write(img, "png", new File(path));
    }

    static void emit(PrintWriter w, String experiment, String exec, int n, int maxIter, String shape, int rep, long ns, int pool) {
        String line = String.join(",", experiment, exec, Integer.toString(n), Integer.toString(maxIter), shape,
                Integer.toString(rep), String.format(java.util.Locale.ROOT, "%.3f", ns / 1e6), Integer.toString(pool));
        w.println(line);
        System.out.println(line);
    }

    public static void main(String[] args) throws Exception {
        String dir = args.length > 0 ? args[0] : "csv";
        new File(dir).mkdirs();
        if (args.length > 1) writeImage(args[1]);
        Thread.setDefaultUncaughtExceptionHandler((t, e) -> {
            e.printStackTrace();
            System.exit(1);
        });

        // JIT warm-up: every executor, small and large iteration count
        int[] pool = new int[1];
        for (int i = 0; i < 5; i++) {
            runSequential(500);
            for (String name : Executors2.NAMES) run(name, 4, 500, "rows:1", pool);
        }
        for (int it : MAX_ITER) reference(it);
        System.out.println("# warm-up done");

        try (PrintWriter w = new PrintWriter(dir + "/times.csv")) {
            w.println("experiment,executor,threads,max_iter,shape,rep,time_ms,pool_size");
            for (int it : MAX_ITER) {
                for (int rep = 0; rep < REPS; rep++) emit(w, "scaling", "sequential", 1, it, "-", rep, runSequential(it), 1);
                for (String name : Executors2.NAMES) {
                    int[] ns = Executors2.parametrized(name) ? THREADS : new int[]{1};
                    for (int n : ns)
                        for (int rep = 0; rep < REPS; rep++)
                            emit(w, "scaling", name, n, it, "rows:1", rep, run(name, n, it, "rows:1", pool), pool[0]);
                }
            }
            for (String name : new String[]{"fixed", "workstealing"})
                for (int n : GRAN_THREADS)
                    for (String shape : SHAPES)
                        for (int rep = 0; rep < REPS; rep++)
                            emit(w, "granularity", name, n, GRAN_ITER, shape, rep, run(name, n, GRAN_ITER, shape, pool), pool[0]);
        }

        try (PrintWriter w = new PrintWriter(dir + "/load.csv"); PrintWriter wt = new PrintWriter(dir + "/loadthreads.csv")) {
            w.println("executor,threads,max_iter,shape,rep,wall_ms,jain,max_over_mean");
            wt.println("executor,threads,shape,rank,busy_ms");
            int n = 10;
            for (String name : new String[]{"fixed", "workstealing"})
                for (String shape : new String[]{"perthread", "rows:16", "rows:1"})
                    for (int rep = 0; rep < REPS; rep++) {
                        long[] wall = new long[1];
                        double[] busy = runLoad(name, n, GRAN_ITER, shape, wall);
                        double mean = Arrays.stream(busy, 0, n).sum() / n;
                        String line = String.format(java.util.Locale.ROOT, "%s,%d,%d,%s,%d,%.3f,%.4f,%.4f",
                                name, n, GRAN_ITER, shape, rep, wall[0] / 1e6, jain(Arrays.copyOf(busy, n)), busy[0] / mean);
                        w.println(line);
                        System.out.println("load," + line);
                        if (rep == 0)
                            for (int r = 0; r < n; r++)
                                wt.println(String.format(java.util.Locale.ROOT, "%s,%d,%s,%d,%.3f", name, n, shape, r, busy[r] / 1e6));
                    }
        }
        System.out.println("# done");
    }
}
