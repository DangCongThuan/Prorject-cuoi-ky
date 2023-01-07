package com.group56.dao;

import com.group56.model.UserModel;

import java.util.List;

public interface IUserDao {
    List<UserModel> findAll();

    Long add(UserModel userModel);

    UserModel checkUserLogin(String email, String pass, Integer status);

    UserModel findById(Long id);

    boolean checkExits(String email);
}
