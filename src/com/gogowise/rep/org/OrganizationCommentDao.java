package com.gogowise.rep.org;

import com.gogowise.rep.ModelDao;
import com.gogowise.domain.org.OrganizationComment;
import com.gogowise.domain.Pagination;

import java.util.List;

public interface OrganizationCommentDao extends ModelDao<OrganizationComment> {

    public List<OrganizationComment> findOrgCommentByOrgId(Integer orgId, Pagination pagination);
}
