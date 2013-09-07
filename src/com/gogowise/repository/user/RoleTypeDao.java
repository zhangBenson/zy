package com.gogowise.repository.user;


import com.gogowise.repository.ModelDao;
import com.gogowise.domain.user.RoleType;

import java.util.List;

public interface RoleTypeDao extends ModelDao<RoleType> {
    public List<RoleType> findAll();
}
