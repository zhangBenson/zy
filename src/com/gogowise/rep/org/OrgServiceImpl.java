package com.gogowise.rep.org;

import com.gogowise.rep.ModelServiceImpl;
import com.gogowise.rep.org.dao.OrganizationTeacherDao;
import com.gogowise.rep.org.enity.OrganizationTeacher;
import com.gogowise.rep.user.enity.BaseUser;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("orgService")
public class OrgServiceImpl extends ModelServiceImpl implements OrgService{

    private OrganizationTeacherDao organizationTeacherDao;

    public List<BaseUser> findAllTeachersForOrg(Integer orgId) {
        List<OrganizationTeacher> organizationTeachers =  organizationTeacherDao.find(orgId, null);
        if (organizationTeachers == null) return  null;
        List<BaseUser> teachers = new ArrayList<>();
        for (OrganizationTeacher organizationTeacher : organizationTeachers)  {
            teachers.add(organizationTeacher.getTeacher());
        }
        return teachers;
    }

    public void setOrganizationTeacherDao(OrganizationTeacherDao organizationTeacherDao) {
        this.organizationTeacherDao = organizationTeacherDao;
    }
}
