import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.ThreadPoolExecutor;

/** Factory for the executors compared in the lab: create(name, n). */
final class Executors2 {
    static final String[] NAMES = {"single", "fixed", "cached", "workstealing", "virtual"};

    private Executors2() {}

    /** True if the executor takes the thread count as a parameter. */
    static boolean parametrized(String name) {
        return name.equals("fixed") || name.equals("workstealing");
    }

    static ExecutorService create(String name, int n) {
        return switch (name) {
            case "single" -> Executors.newSingleThreadExecutor();
            case "fixed" -> Executors.newFixedThreadPool(n);
            case "cached" -> Executors.newCachedThreadPool();
            case "workstealing" -> Executors.newWorkStealingPool(n);
            case "virtual" -> Executors.newVirtualThreadPerTaskExecutor();
            default -> throw new IllegalArgumentException(name);
        };
    }

    /** Largest number of worker threads the pool had (0 if the executor does not report it). */
    static int largestPool(ExecutorService ex) {
        if (ex instanceof ThreadPoolExecutor t) return t.getLargestPoolSize();
        if (ex instanceof ForkJoinPool f) return f.getPoolSize();
        return 0;
    }
}
