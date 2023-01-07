package com.group56.model;

public class ProductImageModel extends AbstractModel<ProductImageModel> {
    private String productImage;
    private Long productId;
    private String type;

    private Integer status;


    public String getProductImage() {
        return productImage;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
