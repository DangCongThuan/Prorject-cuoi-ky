package com.group56.service.impl;

import com.group56.dao.ICategoryDao;
import com.group56.model.CategoryModel;
import com.group56.paging.Pageble;
import com.group56.service.ICategoryService;
import org.apache.commons.lang3.StringUtils;

import javax.inject.Inject;
import java.sql.Timestamp;
import java.util.List;

public class CategoryService implements ICategoryService {
    @Inject
    private ICategoryDao categoryDao;

    @Override
    public List<CategoryModel> findAll(Pageble pageble) {
        return categoryDao.findAll(pageble);
    }

    @Override
    public List<CategoryModel> findAll() {
        return categoryDao.findAll();
    }

    @Override
    public void delete(Long[] ids) {
        for (Long id : ids) {
            categoryDao.delete(id);
        }
    }

    @Override
    public CategoryModel add(CategoryModel newCategory) {
        newCategory.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        if (StringUtils.isAnyBlank(newCategory.getName(), newCategory.getDescription())) {
            newCategory.setMessage("null_value");
        } else if (categoryDao.checkExits(newCategory.getName())) {
            newCategory.setMessage("exits_object");
        } else {
            Long categoryId = categoryDao.add(newCategory);
            newCategory = categoryDao.findById(categoryId);
            newCategory.setMessage("insert_success");
        }
        return newCategory;
    }

    @Override
    public Integer returnTotalItems() {
        return categoryDao.returnTotalItems();
    }

    @Override
    public CategoryModel findById(Long id) {
        return categoryDao.findById(id);
    }

    @Override
    public CategoryModel update(CategoryModel newCategory) {
        CategoryModel oldCategory = categoryDao.findById(newCategory.getId());
        newCategory.setCreatedBy(oldCategory.getCreatedBy());
        newCategory.setCreatedDate(oldCategory.getCreatedDate());
        newCategory.setModifiedDate(new Timestamp(System.currentTimeMillis()));
        categoryDao.update(newCategory);
        return categoryDao.findById(newCategory.getId());
    }
}
