package com.group56.utils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import java.io.File;

public class IsFileExitsUtil {
    public static boolean check(ServletContextEvent sce) {
        String rootPath = System.getProperty("catalina.home");
        ServletContext ctx = sce.getServletContext();
        String relativePath = ctx.getInitParameter("tempfile.dir");
        File file = new File(rootPath + File.separator + "webapps" + File.separator + relativePath);
        return file.exists();
    }
    public static boolean check(ServletContextEvent sce, String name) {
        String rootPath = System.getProperty("catalina.home");
        ServletContext ctx = sce.getServletContext();
        String relativePath = ctx.getInitParameter("tempfile.dir");
        File file = new File(rootPath + File.separator + "webapps" + File.separator + relativePath + File.separator + name);
        return file.exists();
    }
}
