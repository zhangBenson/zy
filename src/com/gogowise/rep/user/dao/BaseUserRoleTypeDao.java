package com.gogowise.rep.user.dao;


import com.gogowise.rep.ModelDao;
import com.gogowise.rep.user.enity.BaseUserRoleType;

import java.util.List;

public interface BaseUserRoleTypeDao extends ModelDao<BaseUserRoleType> {
    public List<BaseUserRoleType> findByUserId(Integer userId);

    public BaseUserRoleType findByUserIdAndRoleName(Integer userId, String roleName);
}
