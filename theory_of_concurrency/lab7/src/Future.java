/** Future: placeholder for the result, filled by the scheduler thread, read by the client. */
class Future<T> {
    private T value;
    private boolean done = false;

    synchronized void set(T v) {
        value = v;
        done = true;
        notifyAll();
    }

    synchronized boolean isDone() {
        return done;
    }

    synchronized T get() throws InterruptedException {
        while (!done) wait();
        return value;
    }
}
