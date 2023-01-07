package com.group56.dao.impl;

import com.group56.dao.IProductImageDAO;
import com.group56.mapper.impl.ProductImageMapper;
import com.group56.model.ProductImageModel;

import java.util.List;

public class ProductImageDAO extends AbstractDAO<ProductImageModel> implements IProductImageDAO {
    @Override
    public Long addImage(ProductImageModel productImageModel) {
        String sql = "Insert Into images_product(image_name, type, product_id, status, created_date, created_by) Values( ?, ?, ?,?, ?, ?)";
        return insert(sql, productImageModel.getProductImage(), productImageModel.getType(), productImageModel.getProductId(),
                productImageModel.getStatus(), productImageModel.getCreatedDate(), productImageModel.getCreatedBy());
    }

    @Override
    public ProductImageModel findById(Long id) {
        String sql = "Select * from images_product Where image_id = ?";
        List<ProductImageModel> products = query(sql, new ProductImageMapper(), id);
        return products.isEmpty() ? null : products.get(0);
    }
}
