package com.group56.dao.impl;

import com.group56.dao.IProductDAO;
import com.group56.mapper.impl.ProductMapper;
import com.group56.model.ProductModel;
import com.group56.paging.Pageble;
import org.apache.commons.lang3.StringUtils;

import java.util.List;

public class ProductDAO extends AbstractDAO<ProductModel> implements IProductDAO {
    @Override
    public List<ProductModel> findAll(Pageble pageble) {
        StringBuilder sql = new StringBuilder("Select * from product p INNER JOIN category AS c ON p.category_id = c.category_id");
        if (pageble.getSorter() != null && !StringUtils.isAllBlank(pageble.getSorter().getSortBy(), pageble.getSorter().getSortName())) {
            sql.append(" Order By p." + pageble.getSorter().getSortName() + " " + pageble.getSorter().getSortBy() + "");
        }
        if (pageble.getOffSet() != null && pageble.getLimit() != null) {
            sql.append(" Limit " + pageble.getOffSet() + ", " + pageble.getLimit() + "");
        }
        return query(sql.toString(), new ProductMapper());
    }

    @Override
    public List<ProductModel> findInCategory(Pageble pageble) {
        StringBuilder sql = new StringBuilder("Select * from product p INNER JOIN category AS c ON p.category_id = c.category_id");
        sql.append(" Where category_name = ?");
        if (pageble.getSorter() != null && !StringUtils.isAllBlank(pageble.getSorter().getSortBy(), pageble.getSorter().getSortName())) {
            sql.append(" Order By " + pageble.getSorter().getSortName() + " " + pageble.getSorter().getSortBy() + "");
        }
        if (pageble.getOffSet() != null && pageble.getLimit() != null) {
            sql.append(" Limit " + pageble.getOffSet() + ", " + pageble.getLimit() + "");
        }
        return query(sql.toString(), new ProductMapper(), pageble.getNameSearch());
    }

    @Override
    public List<ProductModel> search(Pageble pageble) {
        StringBuilder sql = new StringBuilder("Select * from product p INNER JOIN category AS c ON p.category_id = c.category_id");
        sql.append(" WHERE INSTR(`product_name`, ?) > 0");
        if (pageble.getSorter() != null && !StringUtils.isAllBlank(pageble.getSorter().getSortBy(), pageble.getSorter().getSortName())) {
            sql.append(" Order By " + pageble.getSorter().getSortName() + " " + pageble.getSorter().getSortBy() + "");
        }
        if (pageble.getOffSet() != null && pageble.getLimit() != null) {
            sql.append(" Limit " + pageble.getOffSet() + ", " + pageble.getLimit() + "");
        }
        return query(sql.toString(), new ProductMapper(), pageble.getNameSearch());
    }

    @Override
    public int returnTotalItemsOfSearchName(String name) {
        String sql = "Select count(*) from product p WHERE INSTR(`product_name`, ?) > 0";
        return count(sql, name);
    }

    @Override
    public Long add(ProductModel newProduct) {
        String sql = "Insert Into product(product_name, price, description, category_id, status, created_date, created_by, modified_by) Values(?, ?, ?, ?, ?, ?, ?, ?)";
        return insert(sql, newProduct.getName(), newProduct.getPrice(), newProduct.getDescription(), newProduct.getCategoryId(), newProduct.getStatus(),
                newProduct.getCreatedDate(), newProduct.getCreatedBy(), newProduct.getCreatedBy());
    }

    @Override
    public ProductModel findById(Long id) {
        String sql = "Select * from product Where product_id = ?";
        List<ProductModel> products = query(sql, new ProductMapper(), id);
        return products.isEmpty() ? null : products.get(0);
    }

    @Override
    public ProductModel findByName(String name) {
        String sql = "Select * from product Where product_name = ?";
        List<ProductModel> products = query(sql, new ProductMapper(), name);
        return products.isEmpty() ? null : products.get(0);
    }

    @Override
    public boolean checkExits(String name) {
        String sql = "Select * from product Where product_name = ?";
        List<ProductModel> products = query(sql, new ProductMapper(), name);
        return products.isEmpty() ? false : true;
    }

    @Override
    public int returnTotalItems() {
        String sql = "Select count(*) from product";
        return count(sql);
    }

    @Override
    public void update(ProductModel productUpdated) {
        StringBuilder sql = new StringBuilder("UPDATE product SET product_name = ?, price = ?, thumbnail = ?,");
        sql.append(" category_id = ?, status = ?, created_date = ?, created_by = ?,");
        sql.append(" modified_date = ?, modified_by = ?, description = ? Where product_id = ?");
        update(sql.toString(), productUpdated.getName(), productUpdated.getPrice(), productUpdated.getThumbnail(),
                productUpdated.getCategoryId(), productUpdated.getStatus(), productUpdated.getCreatedDate(),
                productUpdated.getCreatedBy(), productUpdated.getModifiedDate(), productUpdated.getModifiedBy(), productUpdated.getDescription(),
                productUpdated.getId());
    }

    @Override
    public void delete(Long id) {
        String sql = "Delete from product Where id = ?";
        update(sql, id);
    }

    @Override
    public int returnTotalItemsOfCategory(String name) {
        String sql = "Select count(*) from product p INNER JOIN category AS c ON p.category_id = c.category_id where category_name = ?";
        return count(sql, name);
    }


}
