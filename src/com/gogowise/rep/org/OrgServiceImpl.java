package com.gogowise.rep.org;

import com.gogowise.rep.ModelServiceImpl;
import com.gogowise.rep.org.dao.OrganizationBaseUserDao;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.dao.OrganizationTeacherDao;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.org.enity.OrganizationBaseUser;
import com.gogowise.rep.org.enity.OrganizationTeacher;
import com.gogowise.rep.user.UserService;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.user.enity.RoleType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("orgService")
public class OrgServiceImpl extends ModelServiceImpl implements OrgService {

    private OrganizationTeacherDao organizationTeacherDao;

    @Autowired
    private BaseUserDao baseUserDao;
    @Autowired
    private OrganizationDao organizationDao;
    @Autowired
    private OrganizationBaseUserDao organizationBaseUserDao;

    @Autowired
    private UserService userService;


    public List<BaseUser> findAllTeachersForOrg(Integer orgId) {
        List<OrganizationTeacher> organizationTeachers = organizationTeacherDao.find(orgId, null);
        if (organizationTeachers == null) return null;
        List<BaseUser> teachers = new ArrayList<>();
        for (OrganizationTeacher organizationTeacher : organizationTeachers) {
            teachers.add(organizationTeacher.getTeacher());
        }
        return teachers;
    }

    public boolean confirmOrgTeacher(Integer userId, Integer orgId) {
        BaseUser teacher = baseUserDao.findById(userId);
        Organization organization = organizationDao.findById(orgId);
        if (teacher == null || organization == null) return false;
        OrganizationBaseUser organizationBaseUser = organizationBaseUserDao.findByOrgIdAndEmail(userId, teacher.getEmail());
        organizationBaseUser.setPreviousStatus(organizationBaseUser.getUserStatus());
        organizationBaseUser.setUserStatus(organizationBaseUser.USER_STATUS_CONFIRMED);
        organizationBaseUser.setUser(teacher);
        organizationBaseUserDao.persistAbstract(organizationBaseUser);
//        userService.
        return true;
    }

    public boolean confirmedOtherOrg(Integer userId, Integer orgId) {
        List<OrganizationBaseUser> orgUsers = organizationBaseUserDao.findByIdAndStatus(userId, OrganizationBaseUser.USER_STATUS_CONFIRMED, RoleType.ROLE_TYPE_TEACHER);
        if (orgUsers == null || orgUsers.size() == 0) return false;
        for (OrganizationBaseUser orgUser : orgUsers) {
            if (!orgId.equals(orgUser.getOrg().getId())) {
                return true;
            }
        }
        return false;
    }


    public void setOrganizationTeacherDao(OrganizationTeacherDao organizationTeacherDao) {
        this.organizationTeacherDao = organizationTeacherDao;
    }
}
