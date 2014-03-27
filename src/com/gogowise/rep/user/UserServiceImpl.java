package com.gogowise.rep.user;

import com.gogowise.rep.ModelServiceImpl;
import com.gogowise.rep.org.OrgService;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.dao.BaseUserRoleTypeDao;
import com.gogowise.rep.user.dao.RoleTypeDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.user.enity.BaseUserRoleType;
import com.gogowise.rep.user.enity.RoleType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl extends ModelServiceImpl implements UserService {

    private BaseUserRoleTypeDao baseUserRoleTypeDao;
    private RoleTypeDao roleTypeDao;

    @Autowired
    private OrgService orgService;

    @Autowired
    private BaseUserDao baseUserDao;

    public void grantPermission(BaseUser owner, String permission) {
        if (this.havePermission(owner.getId(), permission)) {
            return;
        } else {
            BaseUserRoleType baseUserRoleTypeForSave = new BaseUserRoleType();
            baseUserRoleTypeForSave.setBaseUser(owner);
            baseUserRoleTypeForSave.setRoleType(roleTypeDao.findById(RoleType.getIdByRoleName(permission)));
            baseUserRoleTypeDao.persist(baseUserRoleTypeForSave);
        }
    }

    public Boolean havePermission(Integer userId, String roleName) {
        return baseUserRoleTypeDao.findByUserIdAndRoleName(userId, roleName) != null;
    }

    public void removePermission(BaseUser owner, String permission) {
        List<BaseUserRoleType> baseUserRoleTypes = baseUserRoleTypeDao.findByUserId(owner.getId());
        for (BaseUserRoleType baseUserRoleType : baseUserRoleTypes) {
            if (baseUserRoleType.getRoleType().getRoleName().equalsIgnoreCase(permission)) {
                baseUserRoleTypeDao.delete(baseUserRoleType);
                break;
            }
        }
    }

    public void regUser(BaseUser user, String roleType) {
        baseUserDao.persistAbstract(user);
        this.grantPermission(user, roleType);
    }

    public void setBaseUserRoleTypeDao(BaseUserRoleTypeDao baseUserRoleTypeDao) {
        this.baseUserRoleTypeDao = baseUserRoleTypeDao;
    }

    public void setRoleTypeDao(RoleTypeDao roleTypeDao) {
        this.roleTypeDao = roleTypeDao;
    }
}
