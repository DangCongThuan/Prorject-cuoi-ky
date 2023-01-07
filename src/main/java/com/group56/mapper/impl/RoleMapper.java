package com.group56.mapper.impl;

import com.group56.mapper.IRowMapper;
import com.group56.model.RoleModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RoleMapper implements IRowMapper<RoleModel> {
    @Override
    public RoleModel mapRow(ResultSet rs) {
        try {
            RoleModel roleModel = new RoleModel();
            roleModel.setId(rs.getLong("role_id"));
            roleModel.setName(rs.getString("role_name"));

            return roleModel;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
