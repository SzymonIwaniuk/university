import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/**
 * Condition variables. A new reader waits while a writer is waiting, and a writer that leaves
 * lets in all readers waiting at that moment, so neither readers nor writers starve.
 */
class ConditionRW extends ReadingRoom {
    private final ReentrantLock lock = new ReentrantLock();
    private final Condition okToRead = lock.newCondition();
    private final Condition okToWrite = lock.newCondition();
    private int readers = 0, waitingReaders = 0, waitingWriters = 0;
    private boolean writing = false;
    private long readTurn = 0; // changes when a writer admits the waiting readers

    @Override
    void startRead() throws InterruptedException {
        lock.lock();
        try {
            if (writing || waitingWriters > 0) {
                waitingReaders++;
                long turn = readTurn;
                while (turn == readTurn) okToRead.await();
                return; // the writer already counted us in readers
            }
            readers++;
        } finally {
            lock.unlock();
        }
    }

    @Override
    void endRead() {
        lock.lock();
        try {
            if (--readers == 0 && waitingWriters > 0) okToWrite.signal();
        } finally {
            lock.unlock();
        }
    }

    @Override
    void startWrite() throws InterruptedException {
        lock.lock();
        try {
            waitingWriters++;
            while (writing || readers > 0) okToWrite.await();
            waitingWriters--;
            writing = true;
        } finally {
            lock.unlock();
        }
    }

    @Override
    void endWrite() {
        lock.lock();
        try {
            writing = false;
            if (waitingReaders > 0) { // admit the whole group of waiting readers
                readers += waitingReaders;
                waitingReaders = 0;
                readTurn++;
                okToRead.signalAll();
            } else {
                okToWrite.signal();
            }
        } finally {
            lock.unlock();
        }
    }
}
