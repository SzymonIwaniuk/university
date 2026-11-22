/** List of Objects with the three operations from the task; cost simulates an expensive operation on an element. */
abstract class ConcurrentList {
    final long costNs;

    ConcurrentList(long costNs) {
        this.costNs = costNs;
    }

    abstract boolean contains(Object o);

    abstract boolean remove(Object o);

    abstract boolean add(Object o);

    abstract int size();

    /** Busy work standing for one comparison or insertion. */
    void work() {
        if (costNs == 0) return;
        long end = System.nanoTime() + costNs;
        while (System.nanoTime() < end) Thread.onSpinWait();
    }

    static ConcurrentList create(String impl, long costNs) {
        return switch (impl) {
            case "coarse" -> new CoarseList(costNs);
            case "fine" -> new FineList(costNs);
            default -> throw new IllegalArgumentException(impl);
        };
    }
}
