package com.group56.service.impl;

import com.group56.dao.IRoleDao;
import com.group56.model.RoleModel;
import com.group56.service.IRoleService;

import javax.inject.Inject;

public class RoleService implements IRoleService {
    @Inject
    IRoleDao roleDao;

    @Override
    public Long add(RoleModel roleModel) {
        return roleDao.add(roleModel);
    }
}
