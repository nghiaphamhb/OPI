import beans.Point;
import junit.framework.TestCase;

public class PointTest extends TestCase {

    private Point point;

    @Override
    protected void setUp() throws Exception {
        super.setUp();
        point = new Point();
    }

    public void testSettersAndGetters() {
        point.setX(1.0);
        assertEquals(1.0, point.getX(), 0.001);

        point.setY(2.0);
        assertEquals(2.0, point.getY(), 0.001);

        point.setR(3.0);
        assertEquals(3.0, point.getR(), 0.001);

        point.setHit(true);
        assertEquals(true, point.isHit());

        point.setAttemptTime(1234567890L);
        assertEquals(1234567890L, point.getAttemptTime());

        point.setExecutionTime(4.0);
        assertEquals(4.0, point.getExecutionTime(), 0.001);
    }

    public void testCheckHitRectangle() {
        point.setX(-1.0);
        point.setY(1.0);
        point.setR(2.0);
        point.check();
        assertEquals(true, point.isHit());
    }

    public void testCheckMissRectangle() {
        point.setX(-3.0);
        point.setY(1.0);
        point.setR(2.0);
        point.check();
        assertEquals(false, point.isHit());
    }

    public void testCheckHitTriangle() {
        point.setX(1.0);
        point.setY(-1.0);
        point.setR(4.0);
        point.check();
        assertEquals(true, point.isHit());
    }

    public void testCheckMissTriangle() {
        point.setX(3.0);
        point.setY(-1.0);
        point.setR(4.0);
        point.check();
        assertEquals(false, point.isHit());
    }

    public void testCheckHitCircle() {
        point.setX(1.0);
        point.setY(1.0);
        point.setR(2.0);
        point.check();
        assertEquals(true, point.isHit());
    }

    public void testCheckMissCircle() {
        point.setX(3.0);
        point.setY(3.0);
        point.setR(2.0);
        point.check();
        assertEquals(false, point.isHit());
    }
}
