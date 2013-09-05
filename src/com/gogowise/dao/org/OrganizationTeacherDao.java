package com.gogowise.dao.org;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.OrganizationTeacher;
import com.gogowise.domain.Pagination;

import java.util.List;


public interface OrganizationTeacherDao extends ModelDao<OrganizationTeacher> {

    public List<OrganizationTeacher> find(Integer orgId,Pagination pagination);
}
