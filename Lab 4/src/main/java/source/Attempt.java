package source;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import utils.AttemptRepository;

import javax.enterprise.context.SessionScoped;
import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.inject.Inject;
import javax.inject.Named;
import java.io.Serializable;

@Named("attempt")
@SessionScoped
@NoArgsConstructor
public class Attempt implements Serializable {
    @Getter
    @Setter
    private boolean selectedXMinus4;
    @Getter
    @Setter
    private boolean selectedXMinus3;
    @Getter
    @Setter
    private boolean selectedXMinus2;
    @Getter
    @Setter
    private boolean selectedXMinus1;
    @Getter
    @Setter
    private boolean selectedX0;
    @Getter
    @Setter
    private boolean selectedX1;
    @Getter
    @Setter
    private boolean selectedX2;

    @Getter
    @Setter
    private double x;

    @Getter
    @Setter
    private double y;

    @Getter
    @Setter
    private double r;

    @Getter
    @Setter
    private boolean hit;

    @Getter
    @Setter
    private long attemptTime;

    @Getter
    @Setter
    private double executionTime;

    @Inject
    @Getter
    @Setter
    private transient ResultTable table;

    @Inject
    @Getter
    @Setter
    private AttemptRepository attemptRepository;


    public Attempt(double x, double y, double r, boolean hit, long attemptTime, double executionTime) {
        this.setX(x);
        this.y = y;
        this.r = r;
        this.hit = hit;
        this.attemptTime = attemptTime;
        this.executionTime = executionTime;
    }

    public void setX(double x) {
        this.x = x;
    }

    public double getX() {
        return x;
    }

    public void setR(double r) {
        this.r = r;
    }

    public void check() {
        long start = System.nanoTime();
        long attemptTime = System.currentTimeMillis();
        hit = ((getX() >= -r) && (getX() <= 0) && (y >= 0) && (y <= r ))  //hinh chu nhat
                || ((getX() >= 0) && (getX() <= r / 2) && (y <= 0) && (y >= -r + 2 * getX()))  //hinh tam giac
                || ((getX() >= 0) && (y >= 0) && (getX() * getX() + y * y <= r * r));  //hinh tron
        long executionTime = System.nanoTime() - start;
        if (table != null) {
            Attempt newAttempt = new Attempt(getX(), y, r, hit, attemptTime, executionTime);
            table.addPoint(newAttempt);
            attemptRepository.addAttempt(newAttempt);
        }
    }

    public double getY() {
        return y;
    }

    public void setY(double y) {
        this.y = y;
    }

    public double getR() {
        return r;
    }


    public boolean isHit() {
        return hit;
    }

    public void setHit(boolean hit) {
        this.hit = hit;
    }

    public long getAttemptTime() {
        return attemptTime;
    }

    public void setAttemptTime(long attemptTime) {
        this.attemptTime = attemptTime;
    }

    public double getExecutionTime() {
        return executionTime;
    }

    public void setExecutionTime(double executionTime) {
        this.executionTime = executionTime;
    }

    @Override
    public String toString() {
        return String.format("Attempt(x=%.2f, y=%.2f, r=%.2f)", x, y, r);
    }
}


