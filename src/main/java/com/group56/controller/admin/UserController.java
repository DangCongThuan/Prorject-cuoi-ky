package com.group56.controller.admin;

import com.group56.constant.SystemConstant;
import com.group56.model.UserModel;
import com.group56.paging.PageResquest;
import com.group56.paging.Pageble;
import com.group56.service.IRoleService;
import com.group56.service.IUserService;
import com.group56.sort.Sorter;
import com.group56.utils.FormUtil;
import com.group56.utils.MessageUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(urlPatterns = {"/admin-quan-li-nguoi-dung"})
public class UserController extends HttpServlet {
    @Inject
    IUserService userService;
    IRoleService roleService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserModel userModel = FormUtil.toModel(UserModel.class, req);
        userModel.setMaxPageItems(4);
        String view = null;
        if (userModel.getTypeAction().equals(SystemConstant.LIST)) {
            Pageble pageble = new PageResquest(userModel.getPage(), userModel.getMaxPageItems(), new Sorter(userModel.getSortName(), userModel.getSortBy()));
//            userModel.setListResult(userService.findAll(pageble));
            userModel.setTotalItems(userService.returnTotalItems());
            userModel.setTotalPages((int) Math.ceil((double) userModel.getTotalItems() / userModel.getMaxPageItems()));
            view = "/views/admin/productlists.jsp";
        } else if (userModel.getTypeAction().equals(SystemConstant.EDIT)) {
            if (userModel.getId() != null) {
//                userModel = userService.findById(userModel.getId());
            }
            view = "/views/admin/editproduct.jsp";
//            req.setAttribute("categories", roleService.findAll());
        } else if (userModel.getTypeAction().equals(SystemConstant.CONTINUE)) {
            view = "/views/admin/addImgProduct.jsp";
        }
        MessageUtil.setMessage(req);
        req.setAttribute(SystemConstant.model, userModel);
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }
}
