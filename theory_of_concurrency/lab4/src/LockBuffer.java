import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/** Java Concurrency Utilities: ReentrantLock with separate conditions for producers and consumers. */
class LockBuffer extends Buffer {
    private final ReentrantLock lock = new ReentrantLock();
    private final Condition notFull = lock.newCondition();
    private final Condition notEmpty = lock.newCondition();

    LockBuffer(int capacity, long total) {
        super(capacity, total);
    }

    @Override
    boolean put(int want) throws InterruptedException {
        lock.lock();
        try {
            while (true) {
                if (toProduce == 0) return false;
                int n = (int) Math.min(want, toProduce);
                if (free() >= n) {
                    insert(n);
                    notEmpty.signalAll();
                    if (toProduce == 0) notFull.signalAll(); // let the other producers finish
                    return true;
                }
                notFull.await();
            }
        } finally {
            lock.unlock();
        }
    }

    @Override
    boolean take(int want) throws InterruptedException {
        lock.lock();
        try {
            while (true) {
                if (toConsume == 0) return false;
                int n = (int) Math.min(want, toConsume);
                if (size >= n) {
                    remove(n);
                    notFull.signalAll();
                    if (toConsume == 0) notEmpty.signalAll(); // let the other consumers finish
                    return true;
                }
                notEmpty.await();
            }
        } finally {
            lock.unlock();
        }
    }
}
