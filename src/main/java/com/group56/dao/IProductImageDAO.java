package com.group56.dao;

import com.group56.model.ProductImageModel;

public interface IProductImageDAO {
    Long addImage(ProductImageModel productImageModel);

    ProductImageModel findById(Long id);
}
