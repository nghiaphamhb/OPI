package beans;

import javax.enterprise.context.SessionScoped;
import javax.inject.Inject;
import javax.inject.Named;
import java.io.Serializable;

@Named("hitRatio")
@SessionScoped
public class HitRatio implements HitRatioMBean, Serializable {
    private final AttemptStats stats;

    @Inject
    public HitRatio(AttemptStats stats) {
        this.stats = stats;
    }

    @Override
    public synchronized double getMissRatioPercent() {
        int totalAttempt = stats.getTotalAttempts();
        int totalMiss = stats.getTotalMisses();
        return totalAttempt == 0 ? 0.0 : (double) totalMiss / totalAttempt;
    }

    public void reset() {
        stats.resetStats();
    }

}
