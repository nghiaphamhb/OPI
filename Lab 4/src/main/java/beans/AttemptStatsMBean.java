package beans;

public interface AttemptStatsMBean {
    int getTotalAttempts();
    int getTotalMisses();
    void resetStats();
}
