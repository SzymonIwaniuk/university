/**
 * Bounded buffer of capacity 2M with a fixed number of elements to pass through it.
 * put/take move min(want, remaining) elements and return false once nothing is left,
 * so every producer and consumer ends without being interrupted.
 */
abstract class Buffer {
    private final int[] data;
    private int head = 0;
    protected int size = 0;
    protected long toProduce;
    protected long toConsume;

    Buffer(int capacity, long total) {
        data = new int[capacity];
        toProduce = total;
        toConsume = total;
    }

    abstract boolean put(int want) throws InterruptedException;

    abstract boolean take(int want) throws InterruptedException;

    protected int free() {
        return data.length - size;
    }

    protected void insert(int n) {
        for (int i = 0; i < n; i++) {
            data[(head + size) % data.length] = 1;
            size++;
        }
        toProduce -= n;
    }

    protected void remove(int n) {
        for (int i = 0; i < n; i++) {
            data[head] = 0;
            head = (head + 1) % data.length;
            size--;
        }
        toConsume -= n;
    }

    static Buffer create(String impl, int capacity, long total) {
        return switch (impl) {
            case "monitor" -> new MonitorBuffer(capacity, total);
            case "lock" -> new LockBuffer(capacity, total);
            case "fair" -> new FairBuffer(capacity, total);
            case "ticket" -> new TicketBuffer(capacity, total);
            default -> throw new IllegalArgumentException(impl);
        };
    }
}
