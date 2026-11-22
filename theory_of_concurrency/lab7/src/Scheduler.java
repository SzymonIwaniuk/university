import java.util.ArrayDeque;

/**
 * Scheduler: its own thread, the only one that touches the servant. A request whose guard fails
 * goes to the waiting queue of its type instead of back to the activation queue, so the scheduler
 * never spins and requests of one type are executed in arrival order.
 */
class Scheduler extends Thread {
    private final ActivationQueue queue;
    private final ArrayDeque<MethodRequest> waitingPuts = new ArrayDeque<>();
    private final ArrayDeque<MethodRequest> waitingTakes = new ArrayDeque<>();
    private volatile boolean running = true;

    Scheduler(ActivationQueue queue) {
        this.queue = queue;
    }

    void shutdown() {
        running = false;
        interrupt();
    }

    @Override
    public void run() {
        try {
            while (running) {
                // a call may have made the head of a waiting queue executable
                if (!waitingPuts.isEmpty() && waitingPuts.peekFirst().guard()) {
                    waitingPuts.pollFirst().call();
                } else if (!waitingTakes.isEmpty() && waitingTakes.peekFirst().guard()) {
                    waitingTakes.pollFirst().call();
                } else {
                    MethodRequest r = queue.dequeue();
                    ArrayDeque<MethodRequest> waiting = r instanceof PutRequest ? waitingPuts : waitingTakes;
                    if (waiting.isEmpty() && r.guard()) r.call();
                    else waiting.addLast(r); // keep FIFO behind earlier requests of this type
                }
            }
        } catch (InterruptedException e) {
            // shutdown
        }
    }
}
