package com.group56.mapper.impl;

import com.group56.mapper.IRowMapper;
import com.group56.model.RoleModel;
import com.group56.model.UserModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper implements IRowMapper<UserModel> {
    @Override
    public UserModel mapRow(ResultSet rs) {
        try {
            UserModel userModel = new UserModel();
            userModel.setId(rs.getLong("id"));
            userModel.setEmail(rs.getString("email"));
            userModel.setPhoneNumber(rs.getString("phone_number"));
            userModel.setPassword(rs.getString("pass"));
            userModel.setFullName(rs.getString("full_name"));
            userModel.setAddress(rs.getString("address"));
            userModel.setRoleId(rs.getLong("role_id"));
            userModel.setStatus(rs.getInt("status"));
            userModel.setCreatedDate(rs.getTimestamp("created_date"));
            userModel.setCreatedBy(rs.getString("created_by"));
            try {
                userModel.setModifiedBy(rs.getString("modified_by"));
                userModel.setModifiedDate(rs.getTimestamp("modified_date"));
                RoleModel roleModel = new RoleModel();
                roleModel.setName(rs.getString("role_name"));
                userModel.setRoleModel(roleModel);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }

            return userModel;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
