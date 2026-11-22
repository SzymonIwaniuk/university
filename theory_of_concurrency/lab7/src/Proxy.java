/** Proxy: interface for clients, runs in the client thread, returns futures immediately. */
class Proxy {
    private final Servant servant;
    private final ActivationQueue queue;

    Proxy(Servant servant, ActivationQueue queue) {
        this.servant = servant;
        this.queue = queue;
    }

    Future<Void> put(int value) {
        PutRequest r = new PutRequest(servant, value);
        queue.enqueue(r);
        return r.future;
    }

    Future<Integer> take() {
        TakeRequest r = new TakeRequest(servant);
        queue.enqueue(r);
        return r.future;
    }
}
