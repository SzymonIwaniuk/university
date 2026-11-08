/**
 * Common base of all solutions. Philosopher i uses fork i (left) and fork (i+1) mod n (right);
 * acquire(i) returns when philosopher i holds both forks, release(i) puts them back.
 */
abstract class Table {
    final int n;
    private int[][] pairs;

    Table(int n) {
        this.n = n;
    }

    /** Number of forks on the table, n unless a configuration adds one. */
    int forkCount() {
        return n;
    }

    /** Forks held by philosopher i while eating (used by the mutual exclusion check). */
    int[] forksOf(int i) {
        if (pairs == null) {
            int[][] p = new int[n][];
            for (int j = 0; j < n; j++) p[j] = new int[]{left(j), right(j)};
            pairs = p;
        }
        return pairs[i];
    }

    int left(int i) {
        return i;
    }

    int right(int i) {
        return (i + 1) % n;
    }

    abstract void acquire(int i) throws InterruptedException;

    abstract void release(int i);

    /** True when the table is certainly in a deadlock (only the naive solution can be). */
    boolean deadlocked() {
        return false;
    }

    static Fork[] forks(int n) {
        Fork[] forks = new Fork[n];
        for (int i = 0; i < n; i++) forks[i] = new Fork();
        return forks;
    }

    static Table create(String impl, int n) {
        return switch (impl) {
            case "naive" -> new NaiveTable(n);
            case "both" -> new BothTable(n);
            case "waiter" -> new WaiterTable(n);
            case "asym" -> new AsymmetricTable(n);
            case "spare" -> new SpareForkTable(n);
            case "ring" -> new ExtraForkTable(n);
            default -> throw new IllegalArgumentException(impl);
        };
    }
}
