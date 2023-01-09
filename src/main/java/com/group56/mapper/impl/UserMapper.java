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
            userModel.setPassword(rs.getString("pass"));
            userModel.setPhoneNumber(rs.getString("phone_number"));
            userModel.setAddress(rs.getString("address"));
            userModel.setFullName(rs.getString("full_name"));
            userModel.setStatus(rs.getInt("status"));
            userModel.setRoleId(rs.getLong("role_id"));
            userModel.setCreatedDate(rs.getTimestamp("created_date"));
            userModel.setCreatedBy(rs.getString("created_by"));
            userModel.setFirstName(rs.getString("first_name"));
            userModel.setLastName(rs.getString("last_name"));
            userModel.setCity(rs.getString("city"));
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
