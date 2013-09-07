package com.gogowise.repository.org;

import com.gogowise.repository.ModelDaoImpl;
import com.gogowise.domain.org.OrganizationTeacher;
import com.gogowise.domain.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("organizationTeacherDao")
public class OrganizationTeacherDaoImpl extends ModelDaoImpl<OrganizationTeacher> implements OrganizationTeacherDao {
     public List<OrganizationTeacher> find(Integer orgId,Pagination pagination){
         return  this.find("From OrganizationTeacher ot where ot.org.id = ? order by ot.id desc", pagination,orgId);
     }

}
