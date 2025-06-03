package utils;

import javax.management.*;
import java.lang.management.ManagementFactory;

public class MBeanRegistry {
    private static final MBeanServer server = ManagementFactory.getPlatformMBeanServer();

    public static void registerBean(Object mbean, String name) {
        try{
            System.out.println(">>> Registering MBean instance: " + mbean);

            ObjectName objectName = new ObjectName("web.beans:type=" + name);
            server.registerMBean(mbean, objectName);
        } catch (InstanceAlreadyExistsException  e) {
            System.err.println("MBean " + name + " already registered");
        } catch (Exception  e) {
            e.printStackTrace();
        }
    }

    public static void unregisterBean(String name) {
        try {
            ObjectName objectName = new ObjectName("web.beans:type=" + name);
            if (server.isRegistered(objectName)) {
                server.unregisterMBean(objectName);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
