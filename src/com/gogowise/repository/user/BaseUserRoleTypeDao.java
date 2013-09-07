package com.gogowise.repository.user;


import com.gogowise.repository.ModelDao;
import com.gogowise.domain.user.BaseUserRoleType;

import java.util.List;

public interface BaseUserRoleTypeDao extends ModelDao<BaseUserRoleType> {
    public List<BaseUserRoleType> findByUserId(Integer userId);
    public Boolean havePermission(Integer userId, String roleName);
}
