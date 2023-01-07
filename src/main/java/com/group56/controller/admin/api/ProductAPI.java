package com.group56.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.group56.model.ProductModel;
import com.group56.model.UserModel;
import com.group56.service.IProductService;
import com.group56.utils.HttpUtil;
import com.group56.utils.SessionUtil;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@MultipartConfig()
@WebServlet(urlPatterns = {"/api-product"})
public class ProductAPI extends HttpServlet {
    @Inject
    IProductService productService;
    private ServletFileUpload uploader = null;

    @Override
    public void init() throws ServletException {
        DiskFileItemFactory fileFactory = new DiskFileItemFactory();
        File filesDir = (File) getServletContext().getAttribute("FILES_DIR_FILE");
        fileFactory.setRepository(filesDir);
        this.uploader = new ServletFileUpload(fileFactory);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        ProductModel productModel = HttpUtil.of(req.getReader()).toModel(ProductModel.class);
        productModel.setCreatedBy(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getFullName());
        productModel = productService.add(productModel);
        objectMapper.writeValue(resp.getOutputStream(), productModel);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        ProductModel productModel = HttpUtil.of(req.getReader()).toModel(ProductModel.class);
        productModel.setModifiedBy(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getFullName());
        productModel = productService.update(productModel);
        objectMapper.writeValue(resp.getOutputStream(), productModel);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        ProductModel productModel = HttpUtil.of(req.getReader()).toModel(ProductModel.class);
        productService.delete(productModel.getId());
        objectMapper.writeValue(resp.getOutputStream(), "{}");
    }
}
