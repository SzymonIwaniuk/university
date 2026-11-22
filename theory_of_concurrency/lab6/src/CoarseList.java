import java.util.concurrent.locks.ReentrantLock;

/** One lock for the whole list: every operation is a critical section. */
class CoarseList extends ConcurrentList {
    private static final class Node {
        final Object value;
        Node next;

        Node(Object value) {
            this.value = value;
        }
    }

    private final ReentrantLock lock = new ReentrantLock();
    private final Node head = new Node(null); // sentinel

    CoarseList(long costNs) {
        super(costNs);
    }

    @Override
    boolean contains(Object o) {
        lock.lock();
        try {
            for (Node curr = head.next; curr != null; curr = curr.next) {
                work();
                if (curr.value.equals(o)) return true;
            }
            return false;
        } finally {
            lock.unlock();
        }
    }

    @Override
    boolean remove(Object o) {
        lock.lock();
        try {
            for (Node pred = head, curr = head.next; curr != null; pred = curr, curr = curr.next) {
                work();
                if (curr.value.equals(o)) {
                    pred.next = curr.next;
                    return true;
                }
            }
            return false;
        } finally {
            lock.unlock();
        }
    }

    @Override
    boolean add(Object o) {
        lock.lock();
        try {
            Node pred = head;
            while (pred.next != null) {
                pred = pred.next;
                work();
            }
            work();
            pred.next = new Node(o);
            return true;
        } finally {
            lock.unlock();
        }
    }

    @Override
    int size() {
        int n = 0;
        for (Node curr = head.next; curr != null; curr = curr.next) n++;
        return n;
    }
}
