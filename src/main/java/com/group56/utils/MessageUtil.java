package com.group56.utils;

import javax.servlet.http.HttpServletRequest;
import java.util.ResourceBundle;

public class MessageUtil {
    public static void setMessage(HttpServletRequest httpServletRequest) {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("message");
        String message = httpServletRequest.getParameter("message");
        if (message != null) {
            String messageResponse = resourceBundle.getString(message);
            String alert = "success";
            if (message.equals("username_password_invalid") || message.equals("not_login")
                    || message.equals("not_allow") || message.equals("error_system") || message.equals("exits_object")
                    || message.equals("null_value") || message.equals("pass_not_match")) {
                alert = "danger";
            }
            httpServletRequest.setAttribute("messageResponse", messageResponse);
            httpServletRequest.setAttribute("alert", alert);
        }


    }

}
