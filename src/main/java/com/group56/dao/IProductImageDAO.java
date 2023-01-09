package com.group56.dao;

import com.group56.model.ProductImageModel;

import java.util.List;

public interface IProductImageDAO {
    Long addImage(ProductImageModel productImageModel);

    ProductImageModel findById(Long id);

    List<ProductImageModel> findByProduct(Long productId, int status);
}
