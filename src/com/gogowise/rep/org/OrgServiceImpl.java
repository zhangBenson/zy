package com.gogowise.rep.org;

import com.gogowise.rep.ModelServiceImpl;
import com.gogowise.rep.org.dao.OrganizationBaseUserDao;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.org.enity.OrganizationBaseUser;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.user.enity.RoleType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("orgService")
public class OrgServiceImpl extends ModelServiceImpl implements OrgService {


    @Autowired
    private BaseUserDao baseUserDao;
    @Autowired
    private OrganizationDao organizationDao;
    @Autowired
    private OrganizationBaseUserDao organizationBaseUserDao;

    public Organization findMyOrg(Integer userId) {
        Organization ret = organizationDao.findByResId(userId);
        if (ret != null) return ret;
        OrganizationBaseUser orgUser = organizationBaseUserDao.findMyOrgByUserIdAndRole(userId, RoleType.ROLE_TYPE_TEACHER);
        return orgUser == null ? null : orgUser.getOrg();
    }


    public boolean confirmOrgTeacher(Integer userId, Integer orgId) {
        BaseUser teacher = baseUserDao.findById(userId);
        Organization organization = organizationDao.findById(orgId);
        if (teacher == null || organization == null) return false;
        OrganizationBaseUser organizationBaseUser = organizationBaseUserDao.findByOrgIdAndEmail(userId, teacher.getEmail());
        organizationBaseUser.setPreviousStatus(organizationBaseUser.getUserStatus());
        organizationBaseUser.setUserStatus(OrganizationBaseUser.USER_STATUS_CONFIRMED);
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

    public boolean isMember(Integer userId, Integer orgId) {
        List<OrganizationBaseUser> organizationBaseUser = organizationBaseUserDao.findByUserAndOrg(userId, orgId);
        return organizationBaseUser.size() != 0 || userId.equals(organizationDao.findById(orgId).getResponsiblePerson().getId());
    }

    public boolean isResponsiblePerson(Integer userId, Integer orgId) {
        Organization organization = organizationDao.findByResId(userId);
        return organization != null && orgId.equals(organization.getResponsiblePerson());
    }
}
