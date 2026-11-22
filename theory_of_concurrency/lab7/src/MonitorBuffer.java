/** Baseline: the same bounded buffer as a Java monitor. */
class MonitorBuffer {
    private final Servant buffer;

    MonitorBuffer(int capacity, long costNs) {
        buffer = new Servant(capacity, costNs);
    }

    synchronized void put(int value) throws InterruptedException {
        while (buffer.isFull()) wait();
        buffer.put(value);
        notifyAll();
    }

    synchronized int take() throws InterruptedException {
        while (buffer.isEmpty()) wait();
        int v = buffer.take();
        notifyAll();
        return v;
    }
}
