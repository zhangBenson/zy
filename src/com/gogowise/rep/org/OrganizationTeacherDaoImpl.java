package com.gogowise.rep.org;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.org.org.OrganizationTeacher;
import com.gogowise.rep.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("organizationTeacherDao")
public class OrganizationTeacherDaoImpl extends ModelDaoImpl<OrganizationTeacher> implements OrganizationTeacherDao {
     public List<OrganizationTeacher> find(Integer orgId,Pagination pagination){
         return  this.find("From OrganizationTeacher ot where ot.org.id = ? order by ot.id desc", pagination,orgId);
     }

}
