package com.group56.controller.web;

import com.group56.constant.SystemConstant;
import com.group56.model.ProductModel;
import com.group56.paging.PageResquest;
import com.group56.paging.Pageble;
import com.group56.service.ICategoryService;
import com.group56.service.IProductImgService;
import com.group56.service.IProductService;
import com.group56.sort.Sorter;
import com.group56.utils.FormUtil;
import org.apache.commons.lang3.StringUtils;

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
    @Inject
    ICategoryService categoryService;
    @Inject
    IProductImgService productImgService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ProductModel productModel = FormUtil.toModel(ProductModel.class, req);
        if (productModel.getMaxPageItems() == null) {
            productModel.setMaxPageItems(9);
        }
        if (productModel.getPage() == null) {
            productModel.setPage(1);
            ;
        }
        Pageble pageble = null;
        String views = null;
        if (StringUtils.isNotBlank(productModel.getTypeAction()) && productModel.getTypeAction().equals("shows")) {
            productModel = productService.findById(productModel.getId());
            productModel.setInforImages(productImgService.findByProduct(productModel.getId()));
            pageble = new PageResquest(1, 9, new Sorter(productModel.getSortName(), productModel.getSortBy()));
            productModel.setListResult(productService.findAll(pageble));
            views = "/views/web/product-details.jsp";
        } else {
            if (StringUtils.isNotBlank(productModel.getTypeAction()) && productModel.getTypeAction().equals("search")) {
                pageble = new PageResquest(productModel.getPage(), productModel.getMaxPageItems(), new Sorter(productModel.getSortName(), productModel.getSortBy()), productModel.getSearchBy());
                productModel.setListResult(productService.search(pageble));
                productModel.setTotalItems(productService.returnTotalItemsOfSearchName(productModel.getSearchBy()));
            } else if (StringUtils.isNotBlank(productModel.getCategoryName())) {
                pageble = new PageResquest(productModel.getPage(), productModel.getMaxPageItems(), new Sorter(productModel.getSortName(), productModel.getSortBy()), productModel.getCategoryName());
                productModel.setListResult(productService.findInCategory(pageble));
                productModel.setTotalItems(productService.returnTotalItemsOfcategory(productModel.getCategoryName()));
            } else {
                pageble = new PageResquest(productModel.getPage(), productModel.getMaxPageItems(), new Sorter(productModel.getSortName(), productModel.getSortBy()));
                productModel.setListResult(productService.findAll(pageble));
                productModel.setTotalItems(productService.returnTotalItems());
            }
            productModel.setTotalPages((int) Math.ceil((double) productModel.getTotalItems() / productModel.getMaxPageItems()));
            views = "/views/web/shop.jsp";
        }

        req.setAttribute(SystemConstant.model, productModel);
        req.setAttribute("categories", categoryService.findAll());
        RequestDispatcher rd = req.getRequestDispatcher(views);
        rd.forward(req, resp);
    }
}
