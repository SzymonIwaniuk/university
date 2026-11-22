import java.util.concurrent.locks.ReentrantLock;

/**
 * Fine-grained locking (hand-over-hand): every node has its own lock, a thread holds at most
 * two neighbouring locks and takes the next one before releasing the previous one,
 * so threads can work on different parts of the list at the same time.
 */
class FineList extends ConcurrentList {
    private static final class Node {
        final Object value;
        Node next;
        final ReentrantLock lock = new ReentrantLock();

        Node(Object value) {
            this.value = value;
        }
    }

    private final Node head = new Node(null); // sentinel, never removed

    FineList(long costNs) {
        super(costNs);
    }

    @Override
    boolean contains(Object o) {
        Node pred = head;
        pred.lock.lock();
        Node curr = pred.next;
        while (curr != null) {
            curr.lock.lock();
            pred.lock.unlock();
            work();
            if (curr.value.equals(o)) {
                curr.lock.unlock();
                return true;
            }
            pred = curr;
            curr = curr.next;
        }
        pred.lock.unlock();
        return false;
    }

    @Override
    boolean remove(Object o) {
        Node pred = head;
        pred.lock.lock();
        Node curr = pred.next;
        while (curr != null) {
            curr.lock.lock(); // pred and curr are both locked here
            work();
            if (curr.value.equals(o)) {
                pred.next = curr.next;
                curr.lock.unlock();
                pred.lock.unlock();
                return true;
            }
            pred.lock.unlock();
            pred = curr;
            curr = curr.next;
        }
        pred.lock.unlock();
        return false;
    }

    @Override
    boolean add(Object o) {
        Node pred = head;
        pred.lock.lock();
        while (pred.next != null) {
            Node next = pred.next;
            next.lock.lock();
            pred.lock.unlock();
            pred = next;
            work();
        }
        work();
        pred.next = new Node(o); // the last node is locked, nobody can append at the same time
        pred.lock.unlock();
        return true;
    }

    @Override
    int size() {
        int n = 0;
        for (Node curr = head.next; curr != null; curr = curr.next) {
            if (curr.lock.isLocked()) throw new IllegalStateException("lock left held");
            n++;
        }
        return n;
    }
}
