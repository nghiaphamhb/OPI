package utils;

import beans.AttemptStats;
import beans.HitRatio;
import source.Attempt;
import source.ResultTable;

import javax.enterprise.context.Destroyed;
import javax.enterprise.context.Initialized;
import javax.enterprise.context.SessionScoped;
import javax.enterprise.event.Observes;
import javax.inject.Inject;
import javax.inject.Named;
import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.List;

@Named("attemptRepository")
@SessionScoped
public class AttemptRepository implements Serializable {
    private final AttemptStats statsMBean = new AttemptStats();
    private final HitRatio hitRatioMBean = new HitRatio(statsMBean);

    @Inject
    private ResultTable resultTable;

    public void init(@Observes @Initialized(SessionScoped.class) Object unused) {
        MBeanRegistry.registerBean(statsMBean, "attemptStats");
        MBeanRegistry.registerBean(hitRatioMBean, "hitRatio");
    }

    public void destroy(@Observes @Destroyed(SessionScoped.class) Object unused) {
        MBeanRegistry.unregisterBean("attemptStats");
        MBeanRegistry.unregisterBean("hitRatio");
    }

    @Transactional
    public void addAttempt(Attempt attempt) {
        statsMBean.updateStats(attempt); // cập nhật MBean
        hitRatioMBean.getMissRatioPercent();
//        System.out.println(">>> addAttempt called with: " + attempt);
    }

    public List<Attempt> getAttemptsList(int start, int count) {
        List<Attempt> all = resultTable.getResults();
        int end = Math.min(start + count, all.size());
        return all.subList(start, end);
    }


    @Transactional
    public void clearAttempts() {
        resultTable.clear();
    }

}
