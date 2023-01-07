package com.group56.utils;

import javax.servlet.http.HttpServletRequest;

public class SessionUtil {
    public static SessionUtil sessionUtil = null;

    public static SessionUtil getInstance() {
        if (sessionUtil == null) {
            return new SessionUtil();
        }
        return sessionUtil;
    }

    public void putValue(HttpServletRequest httpServletRequest, String key, Object value) {
        httpServletRequest.getSession().setAttribute(key, value);
    }

    public Object getValue(HttpServletRequest httpServletRequest, String key) {
        return httpServletRequest.getSession().getAttribute(key);

    }

    public void removeValue(HttpServletRequest httpServletRequest, String key) {
        httpServletRequest.getSession().removeAttribute(key);

    }
}
