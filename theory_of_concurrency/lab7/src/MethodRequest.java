/** Method Request: call context passed from the proxy to the scheduler. */
abstract class MethodRequest {
    protected final Servant servant;

    MethodRequest(Servant servant) {
        this.servant = servant;
    }

    /** Synchronization condition, checked by the scheduler before call(). */
    abstract boolean guard();

    abstract void call();
}

class PutRequest extends MethodRequest {
    private final int value;
    final Future<Void> future = new Future<>();

    PutRequest(Servant servant, int value) {
        super(servant);
        this.value = value;
    }

    @Override
    boolean guard() {
        return !servant.isFull();
    }

    @Override
    void call() {
        servant.put(value);
        future.set(null);
    }
}

class TakeRequest extends MethodRequest {
    final Future<Integer> future = new Future<>();

    TakeRequest(Servant servant) {
        super(servant);
    }

    @Override
    boolean guard() {
        return !servant.isEmpty();
    }

    @Override
    void call() {
        future.set(servant.take());
    }
}
