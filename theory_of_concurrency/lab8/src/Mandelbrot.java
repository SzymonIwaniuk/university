import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;

/**
 * Mandelbrot set on a 800x600 grid (same parameters as the Rosetta Code Java version).
 * The image is an int[] of "remaining iterations" per pixel; tasks write disjoint regions,
 * and Future.get() gives the happens-before edge back to the caller.
 */
class Mandelbrot {
    static final int WIDTH = 800, HEIGHT = 600;
    static final double ZOOM = 150;

    /** Rectangular part of the image computed by one task: [x0,x1) x [y0,y1). */
    record Region(int x0, int x1, int y0, int y1) {}

    final int maxIter;
    final int[] iters = new int[WIDTH * HEIGHT];

    Mandelbrot(int maxIter) {
        this.maxIter = maxIter;
    }

    /** Original pixel kernel: returns the number of iterations left when |z| >= 2 (0 inside the set). */
    int pixel(int x, int y) {
        double zx = 0, zy = 0, tmp;
        double cX = (x - 400) / ZOOM;
        double cY = (y - 300) / ZOOM;
        int iter = maxIter;
        while (zx * zx + zy * zy < 4 && iter > 0) {
            tmp = zx * zx - zy * zy + cX;
            zy = 2.0 * zx * zy + cY;
            zx = tmp;
            iter--;
        }
        return iter;
    }

    void compute(Region r) {
        for (int y = r.y0(); y < r.y1(); y++) {
            for (int x = r.x0(); x < r.x1(); x++) {
                iters[y * WIDTH + x] = pixel(x, y);
            }
        }
    }

    /** Reference: whole image in the calling thread, no executor. */
    void computeSequential() {
        compute(new Region(0, WIDTH, 0, HEIGHT));
    }

    /**
     * Splits the image into tasks. shape: "rows:K" (K image rows per task), "tile:K" (KxK tiles),
     * "perthread" (one block of rows per pool thread, n threads).
     */
    static List<Region> regions(String shape, int n) {
        List<Region> list = new ArrayList<>();
        if (shape.startsWith("tile:")) {
            int k = Integer.parseInt(shape.substring(5));
            for (int y = 0; y < HEIGHT; y += k)
                for (int x = 0; x < WIDTH; x += k)
                    list.add(new Region(x, Math.min(x + k, WIDTH), y, Math.min(y + k, HEIGHT)));
        } else {
            int k = shape.equals("perthread") ? (HEIGHT + n - 1) / n : Integer.parseInt(shape.substring(5));
            for (int y = 0; y < HEIGHT; y += k)
                list.add(new Region(0, WIDTH, y, Math.min(y + k, HEIGHT)));
        }
        return list;
    }

    /** Submits one Callable per region and waits for all Futures; any task failure is rethrown. */
    void compute(ExecutorService executor, List<Region> regions) throws InterruptedException {
        List<Future<Void>> futures = new ArrayList<>(regions.size());
        for (Region r : regions) {
            Callable<Void> task = () -> {
                compute(r);
                return null;
            };
            futures.add(executor.submit(task));
        }
        for (Future<Void> f : futures) {
            try {
                f.get();
            } catch (ExecutionException e) {
                throw new RuntimeException("task failed", e.getCause());
            }
        }
    }
}
