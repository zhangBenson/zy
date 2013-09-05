package com.gogowise.dao;

import com.gogowise.domain.OrganizationComment;
import com.gogowise.domain.Pagination;

import java.util.List;

public interface OrganizationCommentDao extends ModelDao<OrganizationComment>{

    public List<OrganizationComment> findOrgCommentByOrgId(Integer orgId, Pagination pagination);
}
