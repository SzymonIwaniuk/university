import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/**
 * Four conditions: only the first producer (consumer) in line waits for space (elements),
 * the rest queue behind it, so a large portion cannot be overtaken by smaller ones.
 */
class FairBuffer extends Buffer {
    private final ReentrantLock lock = new ReentrantLock();
    private final Condition firstProducer = lock.newCondition();
    private final Condition otherProducers = lock.newCondition();
    private final Condition firstConsumer = lock.newCondition();
    private final Condition otherConsumers = lock.newCondition();
    private boolean producerFirst = false;
    private boolean consumerFirst = false;

    FairBuffer(int capacity, long total) {
        super(capacity, total);
    }

    @Override
    boolean put(int want) throws InterruptedException {
        lock.lock();
        try {
            while (producerFirst) otherProducers.await();
            producerFirst = true;
            try {
                while (true) {
                    if (toProduce == 0) return false;
                    int n = (int) Math.min(want, toProduce);
                    if (free() >= n) {
                        insert(n);
                        firstConsumer.signal();
                        return true;
                    }
                    firstProducer.await();
                }
            } finally {
                producerFirst = false;
                otherProducers.signal();
            }
        } finally {
            lock.unlock();
        }
    }

    @Override
    boolean take(int want) throws InterruptedException {
        lock.lock();
        try {
            while (consumerFirst) otherConsumers.await();
            consumerFirst = true;
            try {
                while (true) {
                    if (toConsume == 0) return false;
                    int n = (int) Math.min(want, toConsume);
                    if (size >= n) {
                        remove(n);
                        firstProducer.signal();
                        return true;
                    }
                    firstConsumer.await();
                }
            } finally {
                consumerFirst = false;
                otherConsumers.signal();
            }
        } finally {
            lock.unlock();
        }
    }
}
