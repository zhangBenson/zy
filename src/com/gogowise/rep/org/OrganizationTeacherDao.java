package com.gogowise.rep.org;

import com.gogowise.rep.ModelDao;
import com.gogowise.domain.org.OrganizationTeacher;
import com.gogowise.domain.Pagination;

import java.util.List;


public interface OrganizationTeacherDao extends ModelDao<OrganizationTeacher> {

    public List<OrganizationTeacher> find(Integer orgId,Pagination pagination);
}
