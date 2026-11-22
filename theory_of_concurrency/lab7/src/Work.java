/** Busy work of a given length, used for the client's own work and the cost of a buffer operation. */
final class Work {
    private Work() {}

    static void spin(long ns) {
        if (ns == 0) return;
        long end = System.nanoTime() + ns;
        while (System.nanoTime() < end) Thread.onSpinWait();
    }
}
