import java.util.concurrent.atomic.AtomicInteger;

/**
 * c) Naive fork order guarded by a waiter that admits at most n - 1 philosophers.
 * A different limit models a waiter configured for another number of philosophers.
 */
class WaiterTable extends Table {
    private final Fork[] forks;
    private final Waiter waiter;
    private final AtomicInteger holdingOne = new AtomicInteger();

    WaiterTable(int n) {
        this(n, n - 1);
    }

    WaiterTable(int n, int limit) {
        super(n);
        forks = forks(n);
        waiter = new Waiter(limit);
    }

    @Override
    void acquire(int i) throws InterruptedException {
        waiter.enter();
        forks[left(i)].take();
        holdingOne.incrementAndGet();
        forks[right(i)].take();
        holdingOne.decrementAndGet();
    }

    @Override
    void release(int i) {
        forks[right(i)].put();
        forks[left(i)].put();
        waiter.leave();
    }

    /** Possible only with limit >= n: everybody holds the left fork. */
    @Override
    boolean deadlocked() {
        return holdingOne.get() == n;
    }
}
