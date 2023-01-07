package com.group56.service.impl;

import com.group56.dao.IProductImageDAO;
import com.group56.model.ProductImageModel;
import com.group56.model.ProductModel;
import com.group56.service.IProductImgService;

import javax.inject.Inject;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ProductImgService implements IProductImgService {
    @Inject
    IProductImageDAO productImageDAO;

    @Override
    public List<String> add(ProductModel productModel, String type) {
        ArrayList<String> result = new ArrayList<>();
        for (String name : productModel.getInforExtra()) {
            ProductImageModel productImageModel = new ProductImageModel();
            productImageModel.setProductImage(name);
            productImageModel.setStatus(1);
            productImageModel.setProductId(productModel.getId());
            productImageModel.setType(type);
            productImageModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
            productImageModel.setCreatedBy(productModel.getCreatedBy());
            Long imageId = productImageDAO.addImage(productImageModel);
            productImageModel = productImageDAO.findById(imageId);
            result.add(productImageModel.getProductImage());
        }
        return result;
    }
}
