package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.course.enity.ClassMembership;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-28 20:52
 * Email: jhji@ir.hit.edu.cn
 */
@Repository("classMembershipDao")
public class ClassMembershipDaoImpl extends ModelDaoImpl<ClassMembership> implements ClassMembershipDao {

    @Override
    public List<ClassMembership> findByUserId(Integer uId) {
        String hql = "from ClassMembership cm where cm.user.id=?";
        return this.find(hql, null, uId);
    }

    @Override
    public List<ClassMembership> findByClassId(Integer classId) {
        String hql = "from ClassMembership cm where cm.courseClass.id=?";
        return this.find(hql, null, classId);
    }

    @Override
    public ClassMembership findByUserAndClassId(Integer uId, Integer classId) {
        String hql = "from ClassMembership cm where cm.courseClass.id=? and cm.user.id=?";
        return this.findFist(hql, classId, uId);
    }

    public List<ClassMembership> findByUserIdAndCourseId(Integer uId,Integer cId){
        String hql = "from ClassMembership cm where cm.courseClass.course.id=? and cm.user.id=?";
        return this.find(hql, cId, uId);
    }
}
