package com.group56.controller.web;

import com.group56.constant.SystemConstant;
import com.group56.model.ProductModel;
import com.group56.paging.PageResquest;
import com.group56.paging.Pageble;
import com.group56.service.IProductService;
import com.group56.sort.Sorter;
import com.group56.utils.FormUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/danh-sach-san-pham"})
public class ProductController extends HttpServlet {
    @Inject
    IProductService productService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductModel productModel= FormUtil.toModel(ProductModel.class, req);
        productModel.setMaxPageItems(9);
        Pageble pageble = new PageResquest(productModel.getPage(), productModel.getMaxPageItems(), new Sorter(productModel.getSortName(), productModel.getSortBy()));
        productModel.setListResult(productService.findAll(pageble));
        productModel.setTotalItems(productService.returnTotalItems());
        productModel.setTotalPages((int) Math.ceil((double) productModel.getTotalItems() / productModel.getMaxPageItems()));

        req.setAttribute(SystemConstant.model, productModel);
        RequestDispatcher rd = req.getRequestDispatcher("/views/web/shop.jsp");
        rd.forward(req, resp);
    }
}
