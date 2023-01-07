package com.group56.controller.web;

import com.group56.model.UserModel;
import com.group56.service.IUserService;
import com.group56.utils.FormUtil;
import com.group56.utils.MessageUtil;
import com.group56.utils.SessionUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ResourceBundle;

@WebServlet(urlPatterns = {"/trang-chu", "/dang-nhap", "/thoat"})
public class HomeController extends HttpServlet {
    @Inject
    private IUserService userService;
    ResourceBundle resourceBundle = ResourceBundle.getBundle("message");
    //Phương thức doGET
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        MessageUtil.setMessage(req);
        if (action != null && action.equals("login")) {
            RequestDispatcher rd = req.getRequestDispatcher("/views/web/login.jsp");
            rd.forward(req, resp);
        } else if (action != null && action.equals("register")) {
            resp.sendRedirect(req.getContextPath() + "/views/web/register.jsp");
        } else if (action != null && action.equals("logout")) {
            SessionUtil.getInstance().removeValue(req, "USERMODEL");
            resp.sendRedirect(req.getContextPath() + "/views/web/login.jsp");
        }  else {
            RequestDispatcher rd = req.getRequestDispatcher("/views/web/home.jsp");
            rd.forward(req, resp);
        }
    }
    //Phương thức doPost
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null && action.equals("login")) {
            UserModel userModel = FormUtil.toModel(UserModel.class, req);
            userModel = userService.checkLogin(userModel.getEmail(), userModel.getPassword(), 1);
            if (userModel != null) {
                SessionUtil.getInstance().putValue(req, "USERMODEL", userModel);
                if (userModel.getRoleModel().getName().equals("USER")) {
                    resp.sendRedirect(req.getContextPath() + "/trang-chu");
                } else if (userModel.getRoleModel().getName().equals("ADMIN")) {
                    resp.sendRedirect(req.getContextPath() + "/admin-home");
                }
            } else {
                resp.sendRedirect(req.getContextPath() + "/dang-nhap?action=login&message=username_password_invalid");
            }
        }
    }
}
