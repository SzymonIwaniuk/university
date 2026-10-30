/** Java monitor: synchronized methods, wait() and notifyAll() on a single wait set. */
class MonitorBuffer extends Buffer {
    MonitorBuffer(int capacity, long total) {
        super(capacity, total);
    }

    @Override
    synchronized boolean put(int want) throws InterruptedException {
        while (true) {
            if (toProduce == 0) return false;
            int n = (int) Math.min(want, toProduce);
            if (free() >= n) {
                insert(n);
                notifyAll();
                return true;
            }
            wait();
        }
    }

    @Override
    synchronized boolean take(int want) throws InterruptedException {
        while (true) {
            if (toConsume == 0) return false;
            int n = (int) Math.min(want, toConsume);
            if (size >= n) {
                remove(n);
                notifyAll();
                return true;
            }
            wait();
        }
    }
}
