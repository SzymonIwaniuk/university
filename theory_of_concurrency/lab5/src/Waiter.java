/** Waiter (lokaj) lets at most limit philosophers try to take forks at the same time. */
class Waiter {
    private final int limit;
    private int seated = 0;

    Waiter(int limit) {
        this.limit = limit;
    }

    synchronized void enter() throws InterruptedException {
        while (seated == limit) wait();
        seated++;
    }

    synchronized void leave() {
        seated--;
        notify(); // exactly one place became free
    }
}
