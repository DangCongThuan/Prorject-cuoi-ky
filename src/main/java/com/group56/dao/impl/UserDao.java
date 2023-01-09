package com.group56.dao.impl;

import com.group56.dao.IUserDao;
import com.group56.mapper.impl.UserMapper;
import com.group56.model.UserModel;

import java.util.List;

public class UserDao extends AbstractDAO<UserModel> implements IUserDao {
    @Override
    public List<UserModel> findAll() {
        String sql = "Select * from user";
        return query(sql, new UserMapper());
    }

    @Override
    public Long add(UserModel userModel) {
        String sql = "Insert into user(email, pass, phone_number, address, city, first_name, last_name, full_name, role_id, status, created_date, created_by) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        return insert(sql, userModel.getEmail(), userModel.getPassword(), userModel.getPhoneNumber(),
                userModel.getAddress(), userModel.getCity(), userModel.getFirstName(), userModel.getLastName(),
                userModel.getFullName(), userModel.getRoleId(), userModel.getStatus(), userModel.getCreatedDate(), userModel.getCreatedBy());
    }

    @Override
    public UserModel checkUserLogin(String email, String pass, Integer status) {
        StringBuilder sql = new StringBuilder("SELECT * FROM user AS u INNER JOIN role AS r ON u.role_id = r.role_id");
        sql.append(" WHERE u.email = ? AND u.pass = ? AND u.status = ?");
        List<UserModel> users = query(sql.toString(), new UserMapper(), email, pass, status);
        return users.isEmpty() ? null : users.get(0);
    }

    @Override
    public UserModel findById(Long id) {
        String sql = "Select * from user Where id = ?";
        List<UserModel> userModelList = query(sql, new UserMapper(), id);
        return userModelList.isEmpty() ? null : userModelList.get(0);
    }

    @Override
    public boolean checkExits(String email) {
        String sql = "Select * from product Where product_name = ?";
        List<UserModel> user = query(sql, new UserMapper(), email);
        return user.isEmpty() ? false : true;

    }
}
