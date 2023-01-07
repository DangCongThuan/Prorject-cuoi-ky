package com.group56.dao.impl;

import com.group56.dao.ICategoryDao;
import com.group56.mapper.impl.CategoryMapper;
import com.group56.model.CategoryModel;
import com.group56.paging.Pageble;
import org.apache.commons.lang3.StringUtils;

import java.util.List;

public class CategoryDao extends AbstractDAO<CategoryModel> implements ICategoryDao {


    @Override
    public boolean checkExits(String name) {
        String sql = "Select * From category Where category_name = ?";
        List<CategoryModel> categoryModelList = query(sql, new CategoryMapper(), name);
        return categoryModelList.isEmpty() ? false : true;
    }

    @Override
    public List<CategoryModel> findAll(Pageble pageble) {
        StringBuilder sql = new StringBuilder("Select * From category");
        if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName())
                && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
            sql.append(" Order By " + pageble.getSorter().getSortName() + " " + pageble.getSorter().getSortBy() + "");
        }
        if (pageble.getOffSet() != null && pageble.getLimit() != null) {
            sql.append(" Limit " + pageble.getOffSet() + ", " + pageble.getLimit() + "");
        }
        return query(sql.toString(), new CategoryMapper());
    }

    @Override
    public Long add(CategoryModel newCategory) {
        String sql = "Insert Into category(category_name, description, status, created_date, created_by) Values( ?, ?, ?, ?, ?)";
        return insert(sql, newCategory.getName(), newCategory.getDescription(), newCategory.getStatus(), newCategory.getCreatedDate(),
                newCategory.getCreatedBy());
    }

    @Override
    public CategoryModel findById(Long categoryId) {
        String sql = "Select * From category Where category_id = ?";
        List<CategoryModel> categoryModelList = query(sql, new CategoryMapper(), categoryId);
        return categoryModelList.isEmpty() ? null : categoryModelList.get(0);

    }

    @Override
    public CategoryModel findByName(String name) {
        String sql = "Select * From category Where category_name = ?";
        List<CategoryModel> categoryModelList = query(sql, new CategoryMapper(), name);
        return categoryModelList.isEmpty() ? null : categoryModelList.get(0);
    }

    @Override
    public int returnTotalItems() {
        String sql = "Select count(*) from category";
        return count(sql);
    }

    @Override
    public void delete(Long id) {
        String sql = "DELETE FROM category WHERE category_id = ?";
        update(sql, id);
    }

    @Override
    public void update(CategoryModel newCategory) {
        StringBuilder sql = new StringBuilder("Update category Set category_name = ?, description = ?,");
        sql.append(" status = ?, created_date = ?, created_by = ?, modified_date = ?, modified_by = ? Where category_id = ?");
        update(sql.toString(), newCategory.getName(), newCategory.getDescription(), newCategory.getStatus(),
                newCategory.getCreatedDate(), newCategory.getCreatedBy(), newCategory.getCreatedDate(),
                newCategory.getModifiedBy(), newCategory.getId());
    }

    @Override
    public List<CategoryModel> findAll() {
        StringBuilder sql = new StringBuilder("Select * From category");
        return query(sql.toString(), new CategoryMapper());
    }
}
