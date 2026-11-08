/**
 * Extra fork in the ring: n philosophers and n + 1 forks, philosopher i uses forks i and i + 1,
 * so philosophers n - 1 and 0 do not share a fork. Naive order (left, then right) but the waiting
 * graph is a path, not a cycle, so there is no deadlock.
 */
class ExtraForkTable extends Table {
    private final Fork[] forks;

    ExtraForkTable(int n) {
        super(n);
        forks = forks(n + 1);
    }

    @Override
    int forkCount() {
        return n + 1;
    }

    @Override
    int right(int i) {
        return i + 1;
    }

    @Override
    void acquire(int i) throws InterruptedException {
        forks[left(i)].take();
        forks[right(i)].take();
    }

    @Override
    void release(int i) {
        forks[right(i)].put();
        forks[left(i)].put();
    }
}
