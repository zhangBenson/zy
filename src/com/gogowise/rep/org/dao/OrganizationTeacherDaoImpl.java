package com.gogowise.rep.org.dao;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.org.enity.OrganizationTeacher;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.user.enity.BaseUser;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("organizationTeacherDao")
public class OrganizationTeacherDaoImpl extends ModelDaoImpl<OrganizationTeacher> implements OrganizationTeacherDao {
     public List<OrganizationTeacher> find(Integer orgId,Pagination pagination){
         return  this.find("From OrganizationTeacher ot where ot.org.id = ? order by ot.id desc", pagination,orgId);
     }

    @Override
    public OrganizationTeacher findByOrgIdAndTeacherId(Integer orgId, Integer teacherId) {
        return  this.findFist("From OrganizationTeacher ot where ot.org.id = ? and ot.teacher.id=?",orgId,teacherId);
    }

}
