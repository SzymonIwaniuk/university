import java.util.concurrent.atomic.AtomicInteger;

/** a) Symmetric philosophers: left fork first, then right fork. Can deadlock. */
class NaiveTable extends Table {
    private final Fork[] forks;
    // philosophers holding their left fork and not yet the right one
    private final AtomicInteger holdingOne = new AtomicInteger();

    NaiveTable(int n) {
        super(n);
        forks = forks(n);
    }

    @Override
    void acquire(int i) throws InterruptedException {
        forks[left(i)].take();
        holdingOne.incrementAndGet();
        forks[right(i)].take();
        holdingOne.decrementAndGet();
    }

    @Override
    void release(int i) {
        forks[right(i)].put();
        forks[left(i)].put();
    }

    /** All n philosophers hold one fork each and wait for the other: nobody can ever continue. */
    @Override
    boolean deadlocked() {
        return holdingOne.get() == n;
    }
}
