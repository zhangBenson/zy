package com.gogowise.rep.user.dao;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.user.enity.BaseUserRoleType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("baseUserRoleTypeDao")
public class BaseUserRoleTypeImpl extends ModelDaoImpl<BaseUserRoleType> implements BaseUserRoleTypeDao {
    public List<BaseUserRoleType> findByUserId(Integer userId) {
        return this.find("From BaseUserRoleType bt where bt.baseUser.id = ? ", userId);
    }


    public BaseUserRoleType findByUserIdAndRoleName(Integer userId, String roleName) {
        return this.findFist("From BaseUserRoleType bt where bt.baseUser.id = ?  and bt.roleType.roleName = ?", userId, roleName);
    }


}
