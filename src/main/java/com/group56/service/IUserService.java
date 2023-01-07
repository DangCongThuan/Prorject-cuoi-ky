package com.group56.service;

import com.group56.model.UserModel;

import java.util.List;

public interface IUserService {
    List<UserModel> findAll();

    UserModel add(UserModel userModel);

    UserModel checkLogin(String email, String pass, Integer status);

    Integer returnTotalItems();
}
