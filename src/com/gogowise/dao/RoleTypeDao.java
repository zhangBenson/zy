package com.gogowise.dao;


import com.gogowise.domain.RoleType;

import java.util.List;

public interface RoleTypeDao extends ModelDao<RoleType>{
    public List<RoleType> findAll();
}
