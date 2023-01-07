package com.group56.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.group56.model.CategoryModel;
import com.group56.model.UserModel;
import com.group56.service.ICategoryService;
import com.group56.utils.HttpUtil;
import com.group56.utils.SessionUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/api-category"})
public class CategoryAPI extends HttpServlet {
    @Inject
    ICategoryService categoryService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        CategoryModel categoryModel = HttpUtil.of(req.getReader()).toModel(CategoryModel.class);
        categoryModel.setCreatedBy(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getFullName());
        categoryModel = categoryService.add(categoryModel);
        objectMapper.writeValue(resp.getOutputStream(), categoryModel);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        CategoryModel categoryModel = HttpUtil.of(req.getReader()).toModel(CategoryModel.class);
        categoryModel.setModifiedBy(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getFullName());
        categoryModel = categoryService.update(categoryModel);
        objectMapper.writeValue(resp.getOutputStream(), categoryModel);
    }


    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        CategoryModel newModel = HttpUtil.of(req.getReader()).toModel(CategoryModel.class);
        categoryService.delete(newModel.getIds());
        mapper.writeValue(resp.getOutputStream(), "{}");
    }
}
