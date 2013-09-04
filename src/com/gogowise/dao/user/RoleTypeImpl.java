package com.gogowise.dao.user;

import com.gogowise.dao.ModelDao;
import com.gogowise.dao.user.RoleTypeDao;
import com.gogowise.domain.RoleType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("roleTypeDao")
public class RoleTypeImpl extends ModelDao.ModelDaoImpl<RoleType> implements RoleTypeDao {
    public List<RoleType> findAll(){
        return this.find("From RoleType ");
    }
}
