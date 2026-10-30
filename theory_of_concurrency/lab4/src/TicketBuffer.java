import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/**
 * FairBuffer with a ticket queue: each thread takes a number and becomes first only when
 * its number is served, so a thread that grabs the lock right after leaving cannot jump
 * ahead of the threads already waiting.
 */
class TicketBuffer extends Buffer {
    private final ReentrantLock lock = new ReentrantLock();
    private final Condition firstProducer = lock.newCondition();
    private final Condition otherProducers = lock.newCondition();
    private final Condition firstConsumer = lock.newCondition();
    private final Condition otherConsumers = lock.newCondition();
    private long producerTicket = 0, producerServed = 0;
    private long consumerTicket = 0, consumerServed = 0;

    TicketBuffer(int capacity, long total) {
        super(capacity, total);
    }

    @Override
    boolean put(int want) throws InterruptedException {
        lock.lock();
        try {
            long ticket = producerTicket++;
            while (ticket != producerServed) otherProducers.await();
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
                producerServed++;
                otherProducers.signalAll(); // only the owner of the next ticket proceeds
            }
        } finally {
            lock.unlock();
        }
    }

    @Override
    boolean take(int want) throws InterruptedException {
        lock.lock();
        try {
            long ticket = consumerTicket++;
            while (ticket != consumerServed) otherConsumers.await();
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
                consumerServed++;
                otherConsumers.signalAll();
            }
        } finally {
            lock.unlock();
        }
    }
}
