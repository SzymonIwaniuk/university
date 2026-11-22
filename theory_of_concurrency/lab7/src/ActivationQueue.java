import java.util.ArrayDeque;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/** Activation Queue: FIFO of method requests, clients enqueue, the scheduler dequeues. */
class ActivationQueue {
    private final ArrayDeque<MethodRequest> queue = new ArrayDeque<>();
    private final ReentrantLock lock = new ReentrantLock();
    private final Condition notEmpty = lock.newCondition();

    void enqueue(MethodRequest r) {
        lock.lock();
        try {
            queue.addLast(r);
            notEmpty.signal();
        } finally {
            lock.unlock();
        }
    }

    MethodRequest dequeue() throws InterruptedException {
        lock.lock();
        try {
            while (queue.isEmpty()) notEmpty.await();
            return queue.pollFirst();
        } finally {
            lock.unlock();
        }
    }
}
