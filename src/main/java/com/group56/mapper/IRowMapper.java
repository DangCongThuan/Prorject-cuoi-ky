package com.group56.mapper;

import java.sql.ResultSet;

public interface IRowMapper<T> {
    T mapRow(ResultSet rs);
}
