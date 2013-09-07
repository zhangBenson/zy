package com.gogowise.repository.user;

import com.gogowise.repository.ModelDaoImpl;
import com.gogowise.domain.user.RoleType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("roleTypeDao")
public class RoleTypeImpl extends ModelDaoImpl<RoleType> implements RoleTypeDao {
    public List<RoleType> findAll(){
        return this.find("From RoleType ");
    }
}
