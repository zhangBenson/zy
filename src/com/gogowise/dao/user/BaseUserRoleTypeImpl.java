package com.gogowise.dao.user;

import com.gogowise.dao.ModelDao;
import com.gogowise.dao.user.BaseUserRoleTypeDao;
import com.gogowise.domain.BaseUserRoleType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("baseUserRoleTypeDao")
public class BaseUserRoleTypeImpl extends ModelDao.ModelDaoImpl<BaseUserRoleType> implements BaseUserRoleTypeDao {
    public List<BaseUserRoleType> findByUserId(Integer userId) {
        return this.find("From BaseUserRoleType bt where bt.baseUser.id = ? " ,userId );
    }

    public Boolean havePermission(Integer userId, String roleName){
        return this.findFist("From BaseUserRoleType bt where bt.baseUser.id = ?  and bt.roleType.roleName = ?" ,userId,roleName ) != null;
    }

}
