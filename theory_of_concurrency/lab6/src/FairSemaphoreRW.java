import java.util.concurrent.Semaphore;

/**
 * SemaphoreRW with a fair turnstile in front: a waiting writer holds the turnstile,
 * so readers that come after it wait behind it and the writer cannot starve.
 */
class FairSemaphoreRW extends ReadingRoom {
    private final Semaphore turnstile = new Semaphore(1, true); // FIFO order of arrival
    private final Semaphore mutex = new Semaphore(1);
    private final Semaphore writeLock = new Semaphore(1);
    private int readCount = 0;

    @Override
    void startRead() throws InterruptedException {
        turnstile.acquire();
        turnstile.release();
        mutex.acquire();
        if (++readCount == 1) writeLock.acquire();
        mutex.release();
    }

    @Override
    void endRead() {
        mutex.acquireUninterruptibly();
        if (--readCount == 0) writeLock.release();
        mutex.release();
    }

    @Override
    void startWrite() throws InterruptedException {
        turnstile.acquire();
        writeLock.acquire();
        turnstile.release();
    }

    @Override
    void endWrite() {
        writeLock.release();
    }
}
