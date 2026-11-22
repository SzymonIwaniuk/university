import java.util.concurrent.Semaphore;

/** Classic semaphore solution with reader preference: writers can starve while readers keep coming. */
class SemaphoreRW extends ReadingRoom {
    private final Semaphore mutex = new Semaphore(1);     // protects readCount
    private final Semaphore writeLock = new Semaphore(1); // held by a writer or by the group of readers
    private int readCount = 0;

    @Override
    void startRead() throws InterruptedException {
        mutex.acquire();
        if (++readCount == 1) writeLock.acquire(); // first reader locks out writers
        mutex.release();
    }

    @Override
    void endRead() {
        mutex.acquireUninterruptibly();
        if (--readCount == 0) writeLock.release(); // last reader lets writers in
        mutex.release();
    }

    @Override
    void startWrite() throws InterruptedException {
        writeLock.acquire();
    }

    @Override
    void endWrite() {
        writeLock.release();
    }
}
