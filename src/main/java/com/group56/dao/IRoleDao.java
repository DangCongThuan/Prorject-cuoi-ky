package com.group56.dao;

import com.group56.model.RoleModel;

public interface IRoleDao {
    Long add(RoleModel roleModel);

    RoleModel findById(Long id);

    RoleModel findByName(String name);

}
