package com.group56.dao;

import com.group56.mapper.IRowMapper;

import java.util.List;

public interface IGenericDAO<T> {
    List<T> query(String sql, IRowMapper<T> rowMapper, Object... parameters);

    void update(String sql, Object... parameters);

    Long insert(String sql, Object... parameters);

    int count(String sql, Object... parameters);

}
