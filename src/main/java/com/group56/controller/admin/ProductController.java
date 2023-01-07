package com.group56.controller.admin;

import com.group56.constant.SystemConstant;
import com.group56.model.ProductModel;
import com.group56.paging.PageResquest;
import com.group56.paging.Pageble;
import com.group56.service.ICategoryService;
import com.group56.service.IProductService;
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

@WebServlet(urlPatterns = {"/admin-san-pham"})
public class ProductController extends HttpServlet {
    @Inject
    IProductService productService;
    @Inject
    ICategoryService categoryService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductModel productModel = FormUtil.toModel(ProductModel.class, req);
        productModel.setMaxPageItems(4);
        String view = null;
        if (productModel.getTypeAction().equals(SystemConstant.LIST)) {
            Pageble pageble = new PageResquest(productModel.getPage(), productModel.getMaxPageItems(), new Sorter(productModel.getSortName(), productModel.getSortBy()));
            productModel.setListResult(productService.findAll(pageble));
            productModel.setTotalItems(productService.returnTotalItems());
            productModel.setTotalPages((int) Math.ceil((double) productModel.getTotalItems() / productModel.getMaxPageItems()));
            view = "/views/admin/productlists.jsp";
        } else if (productModel.getTypeAction().equals(SystemConstant.EDIT)) {
            if (productModel.getId() != null) {
                productModel = productService.findById(productModel.getId());
            }
            view = "/views/admin/editproduct.jsp";
        } else if (productModel.getTypeAction().equals(SystemConstant.CONTINUE)) {
            if (!productModel.getMessage().equals("exits_object")) {
            view = "/views/admin/addImgProduct.jsp";
            } else {
                view = "/views/admin/editproduct.jsp";
            }
        }
        MessageUtil.setMessage(req);
        req.setAttribute(SystemConstant.model, productModel);
        req.setAttribute("categories", categoryService.findAll());
        req.setAttribute("prURL", req.getHeader("referer"));
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }
}
