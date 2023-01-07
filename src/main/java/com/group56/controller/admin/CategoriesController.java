package com.group56.controller.admin;

import com.group56.constant.SystemConstant;
import com.group56.model.CategoryModel;
import com.group56.paging.PageResquest;
import com.group56.paging.Pageble;
import com.group56.service.ICategoryService;
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

@WebServlet(urlPatterns = {"/admin-danh-muc", "/admin-edit-danh-muc", "/admin-list-danh-muc"})
public class CategoriesController extends HttpServlet {

    @Inject
    ICategoryService categoryService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoryModel categoryModel = FormUtil.toModel(CategoryModel.class, req);
        categoryModel.setMaxPageItems(4);
        String view = null;
        if (categoryModel.getTypeAction().equals(SystemConstant.LIST)) {
            Pageble pageble = new PageResquest(categoryModel.getPage(), categoryModel.getMaxPageItems(), new Sorter(categoryModel.getSortName(), categoryModel.getSortBy()));
            categoryModel.setListResult(categoryService.findAll(pageble));
            categoryModel.setTotalItems(categoryService.returnTotalItems());
            categoryModel.setTotalPages((int) Math.ceil((double) categoryModel.getTotalItems() / categoryModel.getMaxPageItems()));
            view = "/views/admin/categorieslist.jsp";
        } else if (categoryModel.getTypeAction().equals(SystemConstant.EDIT)) {
            if (categoryModel.getId() != null) {
                categoryModel = categoryService.findById(categoryModel.getId());
            }
            view = "/views/admin/editcategory.jsp";
        }
        req.setAttribute(SystemConstant.model, categoryModel);
        req.setAttribute("prURL", req.getHeader("referer"));
        MessageUtil.setMessage(req);
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }
}
