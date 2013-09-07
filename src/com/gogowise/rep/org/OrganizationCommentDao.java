package com.gogowise.rep.org;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.org.org.OrganizationComment;
import com.gogowise.rep.Pagination;

import java.util.List;

public interface OrganizationCommentDao extends ModelDao<OrganizationComment> {

    public List<OrganizationComment> findOrgCommentByOrgId(Integer orgId, Pagination pagination);
}
