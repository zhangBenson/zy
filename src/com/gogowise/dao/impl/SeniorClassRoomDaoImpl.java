package com.gogowise.dao.impl;

import com.gogowise.dao.BaseUserDao;
import com.gogowise.dao.CourseDao;
import com.gogowise.dao.CourseInviteStudentDao;
import com.gogowise.dao.SeniorClassRoomDao;
import com.gogowise.domain.*;
import com.gogowise.utils.Utils;
import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-4
 * Time: 下午6:46
 * To change this template use File | Settings | File Templates.
 */
@Repository("seniorClassRoomDao")
public class SeniorClassRoomDaoImpl extends ModelDaoImpl<SeniorClassRoom> implements SeniorClassRoomDao {
    private CourseDao courseDao;
    private BaseUserDao baseUserDao;
    private CourseInviteStudentDao courseInviteStudentDao;

    public void saveStudentforSeniorClassRoom(SeniorClassRoom seniorClassRoom) {
        this.persistAbstract(seniorClassRoom);
        Course course = courseDao.findById(seniorClassRoom.getCourse().getId());
        Integer observationNum = course.getObservationNum() + 1;
        course.setObservationNum(observationNum);
        courseDao.persistAbstract(course);
    }

    public List<SeniorClassRoom> findClassRoomByCourseId(Integer cid) {
        return this.find("From SeniorClassRoom scr where scr.course.id=?", cid);
    }


    public SeniorClassRoom findClassRoomByCourseAndStudent(Integer cid, Integer sid) {
        List<SeniorClassRoom> seniorClassRooms = this.find("From SeniorClassRoom scr where scr.course.id=? and scr.student.id=?", cid, sid);
        if (seniorClassRooms.size() == 0) {
            return null;
        }
        return seniorClassRooms.get(0);
    }

    public List<SeniorClassRoom> findAllClassRoomByUser(Pagination pagination, Integer userId) {
        List<SeniorClassRoom> seniorClassRooms = new ArrayList<SeniorClassRoom>();
        List<SeniorClassRoom> seniorClassRooms2 = new ArrayList<SeniorClassRoom>();
        seniorClassRooms = this.find("From SeniorClassRoom scr where scr.student.id=?", userId);
        for (int i = 0; i < seniorClassRooms.size(); i++) {
            if (seniorClassRooms.get(i).getCourse().getClasses().size() != 0) {
                seniorClassRooms2.add(seniorClassRooms.get(i));
            }
        }
        return seniorClassRooms2;
    }

    public String saveSeniorClassRoom(Integer courseId, Integer userId) throws IOException {
        SeniorClassRoom seniorClassRoom = new SeniorClassRoom();
        BaseUser student = baseUserDao.findById(userId);
        Course course = courseDao.findById(courseId);
        seniorClassRoom.setCourse(course);
        seniorClassRoom.setStudent(student);

        if(existInStudentInvitation(course,student.getEmail())){
            return "course.exist.in.studentInvitation";  //您是被邀请的用户，请在您的邮件中点击接受完成购买
        }
        if (identityTell(course, student.getEmail())) {
            return "course.identity.exist";    //   您不需要购买该课程
        }
        if (limitNumOver(course)) {
            return "course.studentNum.overflow"; //对不起，该课程预定人数已满
        }

        if (existInRoom(course.getId(), userId)) {
            return "course.already.observation";  //您已经购买了该课程
        }
        if (!limitNumOver(course) & !identityTell(course, student.getEmail()) & !existInRoom(course.getId(), userId)) {
            this.saveStudentforSeniorClassRoom(seniorClassRoom);
            return "course.first.observation";      //恭喜您，购买成功
        }
        return null;
    }

    public String deleteSeniorClassRoom(Integer cid, Integer uid) {
        SeniorClassRoom seniorClassRoom = this.findClassRoomByCourseAndStudent(cid, uid);
        if (seniorClassRoom != null) {
            this.delete(seniorClassRoom);
            Course course = courseDao.findById(cid);
            course.setObservationNum(course.getObservationNum() - 1);
            courseDao.persistAbstract(course);
            return "course.reg.success";
        }
        return "course.reg.failed";
    }

    private Boolean limitNumOver(Course course) {

            if (course.getTeachingNum() <= 3) {
                if (course.getObservationNum() +course.getCourseInviteStudents().size()>= course.getTeachingNum()) {
                    return true;
                } else {
                    return false;
                }
            }
        return false;
    }

    private Boolean existInStudentInvitation(Course course,String email){
        CourseInviteStudent courseInviteStudent = courseInviteStudentDao.findByCourseAndEmail(course.getId(),email);
        if(courseInviteStudent!=null){
             return true;
        }
        return false;
    }

    private Boolean existInRoom(Integer cid, Integer uid) {
        SeniorClassRoom scr = this.findClassRoomByCourseAndStudent(cid, uid);
        if (scr != null) {
            return true;
        }
        return false;
    }

    private Boolean identityTell(Course course, String userEmail) {
        // return true suggest that the user is already an menber of the coures
        String teacherEmail = "";
        if(course.getTeacher()!=null){
            teacherEmail = course.getTeacher().getEmail();
        }else {
            if(course.getOrganization()!=null){
                teacherEmail = Utils.getEmptyString(course.getTeacherEmail());
            }
        }
        if(userEmail.equals(teacherEmail)){
            return true;
        }
        return false;
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public CourseInviteStudentDao getCourseInviteStudentDao() {
        return courseInviteStudentDao;
    }

    public void setCourseInviteStudentDao(CourseInviteStudentDao courseInviteStudentDao) {
        this.courseInviteStudentDao = courseInviteStudentDao;
    }
}
