package com.group56.service;

import com.group56.model.ProductImageModel;
import com.group56.model.ProductModel;

import java.util.List;

public interface IProductImgService {
    List<String> add(ProductModel productModel, String type);
    List<ProductImageModel> findByProduct(Long productId);
}
