package beans;

import source.Attempt;

import javax.enterprise.context.SessionScoped;
import javax.inject.Named;
import javax.management.Notification;
import javax.management.NotificationBroadcasterSupport;
import java.io.Serializable;

@Named("attemptStats")
@SessionScoped
public class AttemptStats extends NotificationBroadcasterSupport implements AttemptStatsMBean, Serializable {
    private int totalPoints = 0;
    private int totalMisses = 0;
    long sequenceNumber = 0;


    @Override
    public synchronized int getTotalAttempts() {
        return totalPoints;
    }

    @Override
    public synchronized int getTotalMisses() {
        return totalMisses ;
    }

    public synchronized void updateStats(Attempt p) {
        totalPoints ++;
        if (isOutsideVisibleArea(p)){
            totalMisses++;
            Notification notification = new Notification(
                    "point.outside.bounds",
                    this,
                    sequenceNumber++,
                    System.currentTimeMillis(),
                    "Attempt placed outside visible coordinate area: " + p
            );
            sendNotification(notification);
            return;
        }
        if(!p.isHit()){
            totalMisses++;
        }
    }

    private boolean isOutsideVisibleArea(Attempt p) {
        double rMax = 6;
        return p.getX() <= -rMax && p.getX() >= rMax
                && p.getY() <= -rMax && p.getY() >= rMax;
    }

    @Override
    public void resetStats() {
        totalPoints = 0;
        totalMisses = 0;
    }

}
