package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.course.enity.ClassMembership;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-28 20:50
 * Email: jhji@ir.hit.edu.cn
 */
public interface ClassMembershipDao extends ModelDao<ClassMembership>
{
    public List<ClassMembership> findByUserId(Integer uId);
    public List<ClassMembership> findByClassId(Integer classId);
    public ClassMembership findByUserAndClassId(Integer uId,Integer classId);
    public List<ClassMembership> findByUserIdAndCourseId(Integer uId,Integer cId);
}
