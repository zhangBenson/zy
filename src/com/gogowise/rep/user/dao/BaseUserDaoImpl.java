package com.gogowise.rep.user.dao;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.Pagination;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Benson
 * Date: 11-8-7
 * Time: 下午8:23
 * To change this template use File | Settings | File Templates.
 */
@Repository("baseUserDao")
public class BaseUserDaoImpl extends ModelDaoImpl<BaseUser> implements BaseUserDao {

    public BaseUser logon(String email, String password) {
        Criteria c=    this.createCriteria(BaseUser.class).add(Restrictions.eq("email", email))
                .add(Restrictions.eq("password", password));
        List<BaseUser> bus = c.list();
        if(bus.size() ==0) return null;
        return bus.get(0);
    }

    public BaseUser findByEmail(String email) {
        return findFist("From BaseUser u where u.email=?",email);
    }

    public List<BaseUser> findHotTeacher( Pagination pagination) {
        String hql = "select distinct ce.course.teacher from  CourseEvaluation ce   group by ce.course.teacher  order by count(ce.id) desc ";
        return  this.find(hql, pagination);
    }

    public BaseUser findByNickName(String nickName) {
        return findFist("From BaseUser u where u.nickName=?", nickName);
    }

    public BaseUser findByEmailAndNickName(String email, String nickName) {
        return findFist("From BaseUser u where  u.email=?  and u.nickName=? ", email, nickName);
    }

    public List<BaseUser> findByFansNum(Pagination pagination) {
        String hql = "From BaseUser u order by u.fansNum desc";
        return this.find(hql,pagination);
    }

    public List<BaseUser> findHottestTeacher(Pagination pagination) {
        String hql = "From BaseUser u where u.isTeacher=true  order by u.fansNum desc";
        return this.find(hql,pagination);
    }

    public List<BaseUser> searchUsers(String searchStr, Pagination pagination) {
        if(searchStr == null || searchStr.equals("")) return this.findByFansNum(pagination);
        String hql = "From BaseUser u where u.nickName like ? order by u.fansNum desc";
        return this.find(hql,pagination,"%"+searchStr+"%");
    }
}
