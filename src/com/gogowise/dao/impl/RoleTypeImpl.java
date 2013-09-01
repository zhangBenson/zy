package com.gogowise.dao.impl;

import com.gogowise.dao.RoleTypeDao;
import com.gogowise.domain.RoleType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("roleTypeDao")
public class RoleTypeImpl extends ModelDaoImpl<RoleType> implements RoleTypeDao {
    public List<RoleType> findAll(){
        return this.find("From RoleType ");
    }
}
