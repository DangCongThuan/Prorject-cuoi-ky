package com.group56.utils;

import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.InvocationTargetException;

public class FormUtil {
    public static <T> T toModel(Class<T> tClass, HttpServletRequest request) {
        T object = null;
        try {
            object = tClass.newInstance();
            try {
                BeanUtils.populate(object, request.getParameterMap());
            } catch (InvocationTargetException e) {
                throw new RuntimeException(e);
            }
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        return object;
    }
}
