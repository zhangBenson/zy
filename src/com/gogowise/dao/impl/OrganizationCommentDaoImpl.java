package com.gogowise.dao.impl;

import com.gogowise.dao.OrganizationCommentDao;
import com.gogowise.domain.OrganizationComment;
import com.gogowise.domain.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("organizationCommentDao")
public class OrganizationCommentDaoImpl extends ModelDaoImpl<OrganizationComment> implements OrganizationCommentDao {
       public List<OrganizationComment> findOrgCommentByOrgId(Integer orgId, Pagination pagination){
            return  this.find("select oc from OrganizationComment oc where oc.organization.id = ? order by oc.id desc ", pagination, orgId);
       }

}
