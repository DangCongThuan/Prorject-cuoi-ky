package com.group56.dao.impl;

import com.group56.dao.IRoleDao;
import com.group56.mapper.impl.RoleMapper;
import com.group56.model.RoleModel;

import java.util.List;

public class RoleDao extends AbstractDAO<RoleModel> implements IRoleDao {
    @Override
    public Long add(RoleModel roleModel) {
        String sql = "INSERT INTO role VALUES(?)";
        return insert(sql, roleModel.getName());
    }

    @Override
    public RoleModel findById(Long id) {
        String sql = "Select * from role Where role_id = ?";
        List<RoleModel> roleModelList = query(sql, new RoleMapper(), id);
        return roleModelList.isEmpty() ? null : roleModelList.get(0);
    }

    @Override
    public RoleModel findByName(String name) {
        String sql = "Select * from role Where  role_name = ?";
        List<RoleModel> roleModelList = query(sql, new RoleMapper(), name);
        return roleModelList.isEmpty() ? null : roleModelList.get(0);
    }
}
