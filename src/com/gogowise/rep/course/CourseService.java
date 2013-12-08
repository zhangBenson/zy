package com.gogowise.rep.course;

import com.gogowise.rep.ModelService;
import com.gogowise.rep.user.enity.BaseUser;

import java.util.List;

public interface CourseService extends ModelService {

    public List<BaseUser> findAllTeachersForOrg(Integer orgId);
}
