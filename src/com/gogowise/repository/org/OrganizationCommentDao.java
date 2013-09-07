package com.gogowise.repository.org;

import com.gogowise.repository.ModelDao;
import com.gogowise.domain.org.OrganizationComment;
import com.gogowise.domain.Pagination;

import java.util.List;

public interface OrganizationCommentDao extends ModelDao<OrganizationComment> {

    public List<OrganizationComment> findOrgCommentByOrgId(Integer orgId, Pagination pagination);
}
