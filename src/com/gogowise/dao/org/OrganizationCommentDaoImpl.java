package com.gogowise.dao.org;

import com.gogowise.dao.ModelDao;
import com.gogowise.dao.org.ChangeResponserHistoryDao;
import com.gogowise.domain.OrganizationComment;
import com.gogowise.domain.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("organizationCommentDao")
public class OrganizationCommentDaoImpl extends ModelDao.ModelDaoImpl<OrganizationComment> implements ChangeResponserHistoryDao.OrganizationCommentDao {
       public List<OrganizationComment> findOrgCommentByOrgId(Integer orgId, Pagination pagination){
            return  this.find("select oc from OrganizationComment oc where oc.organization.id = ? order by oc.id desc ", pagination, orgId);
       }

}
