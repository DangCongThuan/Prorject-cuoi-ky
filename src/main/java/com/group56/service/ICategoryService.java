package com.group56.service;

import com.group56.model.CategoryModel;
import com.group56.paging.Pageble;

import java.util.List;

public interface ICategoryService {
    List<CategoryModel> findAll(Pageble pageble);

    List<CategoryModel> findAll();


    CategoryModel add(CategoryModel categoryModel);

    Integer returnTotalItems();

    CategoryModel findById(Long id);

    CategoryModel update(CategoryModel newCategory);

    void delete(Long[] ids);
}
