package com.group56.mapper.impl;

import com.group56.mapper.IRowMapper;
import com.group56.model.CategoryModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoryMapper implements IRowMapper<CategoryModel> {
    @Override
    public CategoryModel mapRow(ResultSet rs) {
        try {
            CategoryModel categoryModel = new CategoryModel();
            categoryModel.setId(rs.getLong("category_id"));
            categoryModel.setName(rs.getString("category_name"));
            categoryModel.setDescription(rs.getString("description"));
            categoryModel.setStatus(rs.getInt("status"));
            categoryModel.setCreatedBy(rs.getString("created_by"));
            categoryModel.setCreatedDate(rs.getTimestamp("created_date"));
            categoryModel.setModifiedBy(rs.getString("modified_by"));
            categoryModel.setModifiedDate(rs.getTimestamp("modified_date"));
            return categoryModel;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
