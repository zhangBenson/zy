package com.gogowise.rep.course;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.course.enity.CourseInviteStudent;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-2-16
 * Time: 下午5:06
 * To change this template use File | Settings | File Templates.
 */

@Repository("courseInviteStudentDao")
public class CourseInviteStudentDaoImpl extends ModelDaoImpl<CourseInviteStudent> implements CourseInviteStudentDao{
    public CourseInviteStudent findByCourseAndEmail(Integer cid, String email) {
        List<CourseInviteStudent> courseInviteStudents = this.find("From CourseInviteStudent cs where cs.course.id=? and cs.invitedStudentEmail=?", cid, email);
        if(courseInviteStudents==null||courseInviteStudents.size()==0){
            return null;
        }
        return courseInviteStudents.get(0);
    }

    public List<CourseInviteStudent> findByCourseId(Integer cid) {
        return this.find("From CourseInviteStudent cs where cs.course.id=?",cid);
    }
}
