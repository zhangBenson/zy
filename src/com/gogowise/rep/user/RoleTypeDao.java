package com.gogowise.rep.user;


import com.gogowise.rep.ModelDao;
import com.gogowise.rep.user.enity.RoleType;

import java.util.List;

public interface RoleTypeDao extends ModelDao<RoleType> {
    public List<RoleType> findAll();
}
