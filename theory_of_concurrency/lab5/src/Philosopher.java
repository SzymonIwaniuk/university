import java.util.SplittableRandom;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicIntegerArray;
import java.util.concurrent.locks.LockSupport;

/**
 * Thinks and eats for random times (uniform on [0, 2 * mean)) until stop is set,
 * recording the number of meals and the time spent waiting for forks.
 */
class Philosopher extends Thread {
    private final int id;
    private final Table table;
    private final long thinkNs, eatNs;
    private final SplittableRandom rnd;
    private final AtomicIntegerArray owner; // owner + 1 of every fork, 0 when free; checks mutual exclusion
    private final CountDownLatch start;
    private volatile boolean stop = false;
    long meals = 0, waitSumNs = 0, waitMaxNs = 0;

    Philosopher(int id, Table table, long thinkNs, long eatNs, long seed,
                AtomicIntegerArray owner, CountDownLatch start) {
        this.id = id;
        this.table = table;
        this.thinkNs = thinkNs;
        this.eatNs = eatNs;
        this.rnd = new SplittableRandom(seed);
        this.owner = owner;
        this.start = start;
    }

    void finish() {
        stop = true;
    }

    private void pause(long meanNs) {
        if (meanNs == 0) return;
        long end = System.nanoTime() + rnd.nextLong(2 * meanNs);
        long left;
        while ((left = end - System.nanoTime()) > 0) LockSupport.parkNanos(left);
    }

    @Override
    public void run() {
        try {
            start.await();
            while (!stop) {
                pause(thinkNs);                                   // thinking
                long t0 = System.nanoTime();
                table.acquire(id);                                // hungry
                long wait = System.nanoTime() - t0;
                int[] forks = table.forksOf(id);
                for (int f : forks)
                    if (!owner.compareAndSet(f, 0, id + 1))
                        throw new IllegalStateException("fork " + f + " used by " + id + " and " + (owner.get(f) - 1));
                meals++;
                waitSumNs += wait;
                waitMaxNs = Math.max(waitMaxNs, wait);
                pause(eatNs);                                     // eating
                for (int f : forks) owner.set(f, 0);
                table.release(id);
            }
        } catch (InterruptedException e) {
            // stopped while waiting, only happens after a deadlock
        }
    }
}
