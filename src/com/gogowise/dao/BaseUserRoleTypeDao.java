package com.gogowise.dao;


import com.gogowise.domain.BaseUserRoleType;

import java.util.List;

public interface BaseUserRoleTypeDao extends ModelDao<BaseUserRoleType>{
    public List<BaseUserRoleType> findByUserId(Integer userId);
    public Boolean havePermission(Integer userId, String roleName);
}
