package com.group56.paging;

import com.group56.sort.Sorter;

public class PageResquest implements Pageble {
    private Integer page;
    private Integer maxPageItem;
    private Sorter sorter;



    private String searchName;

    public PageResquest(Integer page, Integer maxPageItem, Sorter sorter) {
        this.page = page;
        this.maxPageItem = maxPageItem;
        this.sorter = sorter;
    }

    public PageResquest(Integer page, Integer maxPageItem, Sorter sorter,String searchName) {
        this.page = page;
        this.maxPageItem = maxPageItem;
        this.sorter = sorter;
        this.searchName = searchName;
    }


    @Override
    public Integer getPage() {
        return this.page;
    }

    @Override
    public Integer getOffSet() {
        if (this.page != null && this.maxPageItem != null) {
            return (this.page - 1) * this.maxPageItem;
        }
        return null;
    }

    @Override
    public Integer getLimit() {
        return this.maxPageItem;
    }

    @Override
    public Sorter getSorter() {
        if (this.sorter != null) {
            return this.sorter;
        }
        return null;
    }

    @Override
    public String getNameSearch() {
        return this.searchName;
    }


}
