/**
 * Extra fork in the middle of the table: naive order (left fork, then right fork), but a philosopher
 * whose right fork is taken may use the spare fork instead. n philosophers hold at most n forks
 * while waiting, there are n + 1, so somebody always gets two and the cycle cannot close.
 * One monitor for the whole table, because a philosopher waits for one of two forks.
 */
class SpareForkTable extends Table {
    private final boolean[] taken; // ring forks 0..n-1, spare fork n
    private final int[][] held;    // forks currently held by every philosopher

    SpareForkTable(int n) {
        super(n);
        taken = new boolean[n + 1];
        held = new int[n][2];
    }

    @Override
    int forkCount() {
        return n + 1;
    }

    @Override
    int[] forksOf(int i) {
        return held[i];
    }

    @Override
    synchronized void acquire(int i) throws InterruptedException {
        while (taken[left(i)]) wait();
        taken[left(i)] = true;
        while (taken[right(i)] && taken[n]) wait();
        int second = taken[right(i)] ? n : right(i);
        taken[second] = true;
        held[i][0] = left(i);
        held[i][1] = second;
    }

    @Override
    synchronized void release(int i) {
        taken[held[i][1]] = false;
        taken[held[i][0]] = false;
        notifyAll();
    }
}
