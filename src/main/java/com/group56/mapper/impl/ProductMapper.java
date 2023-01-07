package com.group56.mapper.impl;

import com.group56.mapper.IRowMapper;
import com.group56.model.CategoryModel;
import com.group56.model.ProductModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductMapper implements IRowMapper<ProductModel> {
    @Override
    public ProductModel mapRow(ResultSet rs) {
        try {
            ProductModel productModel = new ProductModel();
            productModel.setId(rs.getLong("product_id"));
            productModel.setName(rs.getString("product_name"));
            productModel.setPrice(rs.getLong("price"));
            productModel.setThumbnail(rs.getString("thumbnail"));
            productModel.setCategoryId(rs.getLong("category_id"));
            productModel.setCreatedDate(rs.getTimestamp("created_date"));
            productModel.setCreatedBy(rs.getString("created_by"));
            productModel.setStatus(rs.getInt("status"));
            productModel.setDescription(rs.getString("description"));
            try {
                productModel.setModifiedBy(rs.getString("modified_by"));
                productModel.setModifiedDate(rs.getTimestamp("modified_date"));
                CategoryModel categoryModel = new CategoryModel();
                categoryModel.setName(rs.getString("category_name"));
                productModel.setCategoryModel(categoryModel);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            return productModel;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
