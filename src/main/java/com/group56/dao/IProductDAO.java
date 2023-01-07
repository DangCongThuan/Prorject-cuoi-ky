package com.group56.dao;

import com.group56.model.ProductModel;
import com.group56.paging.Pageble;

import java.util.List;

public interface IProductDAO {
    List<ProductModel> findAll(Pageble pageble);

    Long add(ProductModel newProduct);

    ProductModel findById(Long id);

    ProductModel findByName(String name);

    boolean checkExits(String name);

    int returnTotalItems();

    void update(ProductModel productUpdated);

    void delete(Long id);
}
