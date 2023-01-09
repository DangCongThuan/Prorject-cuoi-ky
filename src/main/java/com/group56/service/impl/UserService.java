package com.group56.service.impl;

import com.group56.dao.IRoleDao;
import com.group56.dao.IUserDao;
import com.group56.model.UserModel;
import com.group56.service.IUserService;
import org.apache.commons.lang3.StringUtils;

import javax.inject.Inject;
import java.sql.Timestamp;
import java.util.List;

public class UserService implements IUserService {
    @Inject
    private IUserDao iUserDao;
    @Inject
    private IRoleDao iRoleDao;

    @Override
    public List<UserModel> findAll() {
        return iUserDao.findAll();
    }

    @Override
    public UserModel add(UserModel newUser) {
        newUser.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        newUser.setStatus(1);
        newUser.setRoleId(1L);
        if (newUser.getId() == null) {
            newUser.setFullName(newUser.getFirstName() + " " + newUser.getLastName());
            newUser.setCreatedBy(newUser.getFullName());
        }
        if (StringUtils.isAnyBlank(newUser.getEmail(), newUser.getPassword(), newUser.getFullName())) {
            newUser.setMessage("null_value");
        }
        if (iUserDao.checkExits(newUser.getEmail())) {
            newUser.setMessage("exits_object");
        } else {
            Long productId = iUserDao.add(newUser);
            newUser = iUserDao.findById(productId);
            newUser.setMessage("register_success");
        }
        return newUser;

    }

    @Override
    public UserModel checkLogin(String email, String pass, Integer status) {
        return iUserDao.checkUserLogin(email, pass, status);
    }

    @Override
    public Integer returnTotalItems() {
        return null;
    }
}
