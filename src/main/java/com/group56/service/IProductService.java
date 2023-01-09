package com.group56.service;

import com.group56.model.ProductModel;
import com.group56.paging.Pageble;

import java.util.List;

public interface IProductService {
    List<ProductModel> findAll(Pageble pageble);

    ProductModel add(ProductModel newProduct);

    int returnTotalItems();
    int returnTotalItemsOfcategory(String name);
    int returnTotalItemsOfSearchName(String name);
    ProductModel findById(Long id);

    ProductModel update(ProductModel productUpdated);

    void delete(Long id);

    List<ProductModel> findInCategory(Pageble pageble);
    List<ProductModel> search(Pageble pageble);

}
