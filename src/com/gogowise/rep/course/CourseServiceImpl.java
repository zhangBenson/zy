package com.gogowise.rep.course;

import com.gogowise.rep.ModelServiceImpl;
import com.gogowise.rep.org.OrgService;
import com.gogowise.rep.org.dao.OrganizationTeacherDao;
import com.gogowise.rep.org.enity.OrganizationTeacher;
import com.gogowise.rep.user.enity.BaseUser;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("courseService")
public class CourseServiceImpl extends ModelServiceImpl implements CourseService{

    private OrgService orgService;

    public List<BaseUser> findAllTeachersForOrg(Integer orgId) {
        return  orgService.findAllTeachersForOrg(orgId);
    }

    public void setOrgService(OrgService orgService) {
        this.orgService = orgService;
    }
}
