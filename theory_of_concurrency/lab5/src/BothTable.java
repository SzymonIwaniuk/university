/**
 * b) Both forks taken at once: one monitor for the whole table, a philosopher waits
 * until both forks are free and takes them in one step. No deadlock, but
 * a philosopher whose neighbours eat in turns can starve.
 */
class BothTable extends Table {
    private final boolean[] taken;

    BothTable(int n) {
        super(n);
        taken = new boolean[n];
    }

    @Override
    synchronized void acquire(int i) throws InterruptedException {
        while (taken[left(i)] || taken[right(i)]) wait();
        taken[left(i)] = true;
        taken[right(i)] = true;
    }

    @Override
    synchronized void release(int i) {
        taken[left(i)] = false;
        taken[right(i)] = false;
        notifyAll(); // both neighbours may be waiting
    }
}
