/**
 * Own solution: resource ordering. Every philosopher takes the fork with the lower number
 * first, so the last one (forks n-1 and 0) takes the right fork first. No central monitor.
 */
class AsymmetricTable extends Table {
    private final Fork[] forks;

    AsymmetricTable(int n) {
        super(n);
        forks = forks(n);
    }

    @Override
    void acquire(int i) throws InterruptedException {
        forks[Math.min(left(i), right(i))].take();
        forks[Math.max(left(i), right(i))].take();
    }

    @Override
    void release(int i) {
        forks[Math.max(left(i), right(i))].put();
        forks[Math.min(left(i), right(i))].put();
    }
}
