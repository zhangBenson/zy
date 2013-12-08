package com.gogowise.rep.org.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.org.enity.OrganizationComment;
import com.gogowise.rep.Pagination;

import java.util.List;

public interface OrganizationCommentDao extends ModelDao<OrganizationComment> {

    public List<OrganizationComment> findOrgCommentByOrgId(Integer orgId, Pagination pagination);
}
