/** c) Naive fork order guarded by a waiter that admits at most n - 1 philosophers. */
class WaiterTable extends Table {
    private final Fork[] forks;
    private final Waiter waiter;

    WaiterTable(int n) {
        super(n);
        forks = forks(n);
        waiter = new Waiter(n - 1);
    }

    @Override
    void acquire(int i) throws InterruptedException {
        waiter.enter();
        forks[left(i)].take();
        forks[right(i)].take();
    }

    @Override
    void release(int i) {
        forks[right(i)].put();
        forks[left(i)].put();
        waiter.leave();
    }
}
