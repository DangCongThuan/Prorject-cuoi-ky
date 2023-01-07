package com.group56.controller.web;

import com.group56.constant.SystemConstant;
import com.group56.model.UserModel;
import com.group56.utils.FormUtil;
import com.group56.utils.MessageUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "user-register", value = "/user-register")
public class UserRegister extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserModel userModel = FormUtil.toModel(UserModel.class, request);
        String view = null;
        if (userModel.getTypeAction().equals(SystemConstant.REGISER)) {
            view = "/views/web/register.jsp";
        } else if(userModel.getTypeAction().equals(SystemConstant.EDIT)) {
            view = "/views/web/taikhoan.jsp";
        }
        MessageUtil.setMessage(request);
        request.setAttribute(SystemConstant.model, userModel);
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
