package com.group56.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class AbstractModel<T> {
    private Long id;
    private Timestamp createdDate;
    private String createdBy;
    private Timestamp modifiedDate;
    private String modifiedBy;

    private String sortName;
    private String sortBy;
    private List<T> listResult = new ArrayList<>();
    private Integer page;
    private Integer maxPagesVisible;
    private Integer maxPageItems;
    private Integer totalPages;
    private Integer totalItems;
    private String typeAction;
    private Long[] ids;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    private String message;

    public String getTypeAction() {
        return typeAction;
    }

    public void setTypeAction(String typeAction) {
        this.typeAction = typeAction;
    }

    public String getSortName() {
        return sortName;
    }

    public void setSortName(String sortName) {
        this.sortName = sortName;
    }

    public String getSortBy() {
        return sortBy;
    }

    public void setSortBy(String sortBy) {
        this.sortBy = sortBy;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Timestamp getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(Timestamp modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public List<T> getListResult() {
        return listResult;
    }

    public void setListResult(List<T> listResult) {
        this.listResult = listResult;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getMaxPagesVisible() {
        return maxPagesVisible;
    }

    public void setMaxPagesVisible(Integer maxPagesVisible) {
        this.maxPagesVisible = maxPagesVisible;
    }

    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }

    public Integer getMaxPageItems() {
        return maxPageItems;
    }

    public void setMaxPageItems(Integer maxPageItems) {
        this.maxPageItems = maxPageItems;
    }

    public Integer getTotalItems() {
        return totalItems;
    }

    public void setTotalItems(Integer totalItems) {
        this.totalItems = totalItems;
    }

    public Long[] getIds() {
        return ids;
    }

    public void setIds(Long[] ids) {
        this.ids = ids;
    }
}
