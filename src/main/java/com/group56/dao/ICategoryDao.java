package com.group56.dao;

import com.group56.model.CategoryModel;
import com.group56.paging.Pageble;

import java.util.List;

public interface ICategoryDao {
    List<CategoryModel> findAll(Pageble pageble);

    Long add(CategoryModel newCategory);

    CategoryModel findById(Long categoryId);

    CategoryModel findByName(String name);

    List<CategoryModel> findAll();

    int returnTotalItems();

    void update(CategoryModel newCategory);

    void delete(Long id);

    boolean checkExits(String name);
}
