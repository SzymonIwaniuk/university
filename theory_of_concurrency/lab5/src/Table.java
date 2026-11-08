/**
 * Common base of all solutions. Philosopher i uses fork i (left) and fork (i+1) mod n (right);
 * acquire(i) returns when philosopher i holds both forks, release(i) puts them back.
 */
abstract class Table {
    final int n;

    Table(int n) {
        this.n = n;
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
            default -> throw new IllegalArgumentException(impl);
        };
    }
}
