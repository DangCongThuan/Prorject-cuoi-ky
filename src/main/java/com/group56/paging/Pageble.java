package com.group56.paging;

import com.group56.sort.Sorter;

public interface Pageble {
    Integer getPage();

    Integer getOffSet();

    Integer getLimit();

    Sorter getSorter();

}
