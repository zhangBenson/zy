package com.gogowise.dao;

import com.gogowise.domain.CourseInviteStudent;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-2-16
 * Time: 下午5:05
 * To change this template use File | Settings | File Templates.
 */
public interface CourseInviteStudentDao extends ModelDao<CourseInviteStudent>{

    public CourseInviteStudent findByCourseAndEmail(Integer cid,String email);

    public List<CourseInviteStudent> findByCourseId(Integer cid);
}
