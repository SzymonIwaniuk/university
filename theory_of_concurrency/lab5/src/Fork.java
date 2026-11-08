/** Fork as a Java monitor, like Widelec from the skeleton: take() waits until the fork is free. */
class Fork {
    private boolean taken = false;

    synchronized void take() throws InterruptedException {
        while (taken) wait();
        taken = true;
    }

    synchronized void put() {
        taken = false;
        notify();
    }
}
