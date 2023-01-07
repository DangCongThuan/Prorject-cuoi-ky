package com.group56.mapper.impl;

import com.group56.mapper.IRowMapper;
import com.group56.model.ProductImageModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductImageMapper implements IRowMapper<ProductImageModel> {
    @Override
    public ProductImageModel mapRow(ResultSet rs) {

        try {
            ProductImageModel productImageModel = new ProductImageModel();
            productImageModel.setId(rs.getLong("image_id"));
            productImageModel.setProductImage(rs.getString("image_name"));
            productImageModel.setType(rs.getString("type"));
            productImageModel.setProductId(rs.getLong("product_id"));
            productImageModel.setStatus(rs.getInt("status"));
            return productImageModel;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
