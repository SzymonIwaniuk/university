/** Servant: the bounded buffer itself, no synchronization. Runs only in the scheduler thread. */
class Servant {
    private final int[] data;
    private final long costNs; // cost of one put/take (e.g. copying a large object)
    private int head = 0, size = 0;

    Servant(int capacity, long costNs) {
        data = new int[capacity];
        this.costNs = costNs;
    }

    void put(int value) {
        Work.spin(costNs);
        data[(head + size) % data.length] = value;
        size++;
    }

    int take() {
        Work.spin(costNs);
        int value = data[head];
        head = (head + 1) % data.length;
        size--;
        return value;
    }

    boolean isFull() {
        return size == data.length;
    }

    boolean isEmpty() {
        return size == 0;
    }
}
