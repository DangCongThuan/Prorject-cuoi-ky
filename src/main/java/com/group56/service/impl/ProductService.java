package com.group56.service.impl;

import com.group56.dao.ICategoryDao;
import com.group56.dao.IProductDAO;
import com.group56.model.CategoryModel;
import com.group56.model.ProductModel;
import com.group56.paging.Pageble;
import com.group56.service.IProductService;
import org.apache.commons.lang3.StringUtils;

import javax.inject.Inject;
import java.sql.Timestamp;
import java.util.List;

public class ProductService implements IProductService {
    @Inject
    IProductDAO productDAO;
    @Inject
    ICategoryDao categoryDao;

    @Override
    public List<ProductModel> findAll(Pageble pageble) {
        return productDAO.findAll(pageble);
    }

    @Override
    public ProductModel add(ProductModel newProduct) {
        CategoryModel categoryModel = categoryDao.findByName(newProduct.getCategoryName());
        newProduct.setCategoryId(categoryModel.getId());
        newProduct.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        if (StringUtils.isAnyBlank(newProduct.getName())) {
            newProduct.setMessage("null_value");
        } else if (productDAO.checkExits(newProduct.getName())) {
            newProduct.setMessage("exits_object");
        } else {
            Long productId = productDAO.add(newProduct);
            newProduct = productDAO.findById(productId);
            newProduct.setMessage("continue");
        }
        return newProduct;
    }

    @Override
    public int returnTotalItems() {
        return productDAO.returnTotalItems();
    }

    @Override
    public ProductModel findById(Long id) {
        return productDAO.findById(id);
    }

    @Override
    public ProductModel update(ProductModel productUpdated) {
        CategoryModel categoryModel = new CategoryModel();
        if (productUpdated.getCategoryId() == null) {
        categoryModel = categoryDao.findByName(productUpdated.getCategoryName());
        productUpdated.setCategoryId(categoryModel.getId());
        }
        ProductModel oldModel = productDAO.findById(productUpdated.getId());
        productUpdated.setCreatedBy(oldModel.getCreatedBy());
        productUpdated.setCreatedDate(oldModel.getCreatedDate());
        productUpdated.setModifiedDate(new Timestamp(System.currentTimeMillis()));
        productDAO.update(productUpdated);
        return productDAO.findById(productUpdated.getId());
    }

    @Override
    public void delete(Long id) {
        productDAO.delete(id);
    }
}
