import java.io.File;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.concurrent.ExecutorService;

/**
 * Correctness checks, independent of the benchmark. Writes csv/verify.csv:
 * 1. every executor x task shape x thread count gives exactly the sequential image,
 * 2. the kernel gives the known area of the set (1.5066) and trivial points behave as expected,
 * 3. the image check detects a data race (original code style: pixel temporaries kept in shared fields).
 */
public class Verify {
    /** Racy variant: temporaries are fields of the shared object, like in the original single-threaded code. */
    static class RacyMandelbrot extends Mandelbrot {
        double zx, zy, cX, cY, tmp;

        RacyMandelbrot(int maxIter) {
            super(maxIter);
        }

        @Override
        int pixel(int x, int y) {
            zx = zy = 0;
            cX = (x - 400) / ZOOM;
            cY = (y - 300) / ZOOM;
            int iter = maxIter;
            while (zx * zx + zy * zy < 4 && iter > 0) {
                tmp = zx * zx - zy * zy + cX;
                zy = 2.0 * zx * zy + cY;
                zx = tmp;
                iter--;
            }
            return iter;
        }
    }

    public static void main(String[] args) throws Exception {
        String dir = args.length > 0 ? args[0] : "csv";
        new File(dir).mkdirs();
        try (PrintWriter w = new PrintWriter(dir + "/verify.csv")) {
            w.println("check,detail,value");

            // 1. all executors, shapes, thread counts, several repetitions
            int maxIter = 300, reps = 3, runs = 0;
            int[] ref = Main.reference(maxIter);
            String[] shapes = {"rows:1", "rows:7", "rows:64", "tile:8", "tile:50", "perthread"};
            for (String name : Executors2.NAMES)
                for (int n : Executors2.parametrized(name) ? new int[]{1, 3, 7, 16} : new int[]{1})
                    for (String shape : shapes)
                        for (int r = 0; r < reps; r++) {
                            Mandelbrot m = new Mandelbrot(maxIter);
                            ExecutorService ex = Executors2.create(name, n);
                            m.compute(ex, Mandelbrot.regions(shape, n));
                            Main.shutdown(ex);
                            if (!Arrays.equals(m.iters, ref)) throw new AssertionError(name + " " + n + " " + shape);
                            runs++;
                        }
            w.println("executors,runs_equal_to_sequential," + runs);

            // 2. kernel: area of the set and trivial points
            for (int it : new int[]{570, 5000}) {
                Mandelbrot m = new Mandelbrot(it);
                m.computeSequential();
                long inside = Arrays.stream(m.iters).filter(v -> v == 0).count();
                w.println("area," + it + "," + String.format(java.util.Locale.ROOT, "%.4f", inside / (Mandelbrot.ZOOM * Mandelbrot.ZOOM)));
            }
            Mandelbrot m = new Mandelbrot(570);
            w.println("point,c=0_left_iterations," + m.pixel(400, 300));
            w.println("point,corner_left_iterations," + m.pixel(0, 0));

            // 3. the check must catch a race
            int racyRuns = 30, differing = 0, maxDiff = 0;
            int[] ref570 = Main.reference(570);
            for (int r = 0; r < racyRuns; r++) {
                RacyMandelbrot rm = new RacyMandelbrot(570);
                ExecutorService ex = Executors2.create("fixed", 8);
                rm.compute(ex, Mandelbrot.regions("rows:1", 8));
                Main.shutdown(ex);
                int diff = 0;
                for (int i = 0; i < ref570.length; i++) if (rm.iters[i] != ref570[i]) diff++;
                if (diff > 0) differing++;
                maxDiff = Math.max(maxDiff, diff);
            }
            w.println("racy,runs," + racyRuns);
            w.println("racy,runs_with_different_image," + differing);
            w.println("racy,max_different_pixels," + maxDiff);
        }
        System.out.println(new String(java.nio.file.Files.readAllBytes(new File(dir + "/verify.csv").toPath())));
    }
}
