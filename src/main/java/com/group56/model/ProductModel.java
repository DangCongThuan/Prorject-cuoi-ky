package com.group56.model;

import java.util.ArrayList;

public class ProductModel extends AbstractModel<ProductModel> {
    private String name;
    private Long price;
    private String thumbnail;
    private String description;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    private ArrayList<String> inforExtra = new ArrayList<>();

    public ArrayList<String> getInforExtra() {
        return inforExtra;
    }

    public void setInforExtra(ArrayList<String> inforExtra) {
        this.inforExtra = inforExtra;
    }

    private Long categoryId;
    private String categoryName;
    private Integer status;
    private CategoryModel categoryModel;

    public CategoryModel getCategoryModel() {
        return categoryModel;
    }

    public void setCategoryModel(CategoryModel categoryModel) {
        this.categoryModel = categoryModel;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

}
