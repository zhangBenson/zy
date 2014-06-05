package com.gogowise.rep.user;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gogowise.rep.ModelServiceImpl;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.dao.BaseUserRoleTypeDao;
import com.gogowise.rep.user.dao.GroupDao;
import com.gogowise.rep.user.dao.RoleTypeDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.user.enity.BaseUserRoleType;
import com.gogowise.rep.user.enity.Group;
import com.gogowise.rep.user.enity.RoleType;

@Service("userService")
public class UserServiceImpl extends ModelServiceImpl implements UserService {

    @Autowired
    private BaseUserRoleTypeDao baseUserRoleTypeDao;

    @Autowired
    private RoleTypeDao roleTypeDao;
    @Autowired
    private GroupDao groupDao;

    @Autowired
    private BaseUserDao baseUserDao;

    public void grantPermission(BaseUser owner, String permission) {

        if (!this.havePermission(owner.getId(), permission)) {
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

    public void changeUser(int groupId, List<Integer> userIds) {

        Group group = groupDao.findById(groupId);
        List<Integer> removeIds = group.getStudentIds();
        if (removeIds != null) {
            removeIds.removeAll(userIds);

            this.groupDao.removeStudents(groupId, removeIds);
        }

        List<Integer> addIds = new ArrayList<>();
        addIds.addAll(userIds);
        addIds.removeAll(group.getStudentIds());

        this.groupDao.addStudents(groupId, addIds);

    }

    public void changeCourse(int groupId, List<Integer> courseIds) {

        Group group = groupDao.findById(groupId);
        List<Integer> removeIds = group.getCourseIds();
        removeIds.removeAll(courseIds);

        List<Integer> addIds = new ArrayList<>();
        addIds.addAll(courseIds);
        addIds.removeAll(group.getCourseIds());

    }

}
