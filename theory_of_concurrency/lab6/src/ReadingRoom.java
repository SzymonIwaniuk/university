/** Common base of the readers-writers solutions: a reader calls startRead/endRead, a writer startWrite/endWrite. */
abstract class ReadingRoom {
    abstract void startRead() throws InterruptedException;

    abstract void endRead();

    abstract void startWrite() throws InterruptedException;

    abstract void endWrite();

    static ReadingRoom create(String impl) {
        return switch (impl) {
            case "sem" -> new SemaphoreRW();
            case "fair" -> new FairSemaphoreRW();
            case "cond" -> new ConditionRW();
            default -> throw new IllegalArgumentException(impl);
        };
    }
}
