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
    private final AtomicIntegerArray eating; // shared, used to check mutual exclusion
    private final CountDownLatch start;
    private volatile boolean stop = false;
    long meals = 0, waitSumNs = 0, waitMaxNs = 0;

    Philosopher(int id, Table table, long thinkNs, long eatNs, long seed,
                AtomicIntegerArray eating, CountDownLatch start) {
        this.id = id;
        this.table = table;
        this.thinkNs = thinkNs;
        this.eatNs = eatNs;
        this.rnd = new SplittableRandom(seed);
        this.eating = eating;
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
        int n = table.n;
        try {
            start.await();
            while (!stop) {
                pause(thinkNs);                                   // thinking
                long t0 = System.nanoTime();
                table.acquire(id);                                // hungry
                long wait = System.nanoTime() - t0;
                eating.set(id, 1);
                if (eating.get((id + 1) % n) == 1 || eating.get((id + n - 1) % n) == 1)
                    throw new IllegalStateException("neighbours of " + id + " eat at the same time");
                meals++;
                waitSumNs += wait;
                waitMaxNs = Math.max(waitMaxNs, wait);
                pause(eatNs);                                     // eating
                eating.set(id, 0);
                table.release(id);
            }
        } catch (InterruptedException e) {
            // stopped while waiting, only happens after a deadlock
        }
    }
}
