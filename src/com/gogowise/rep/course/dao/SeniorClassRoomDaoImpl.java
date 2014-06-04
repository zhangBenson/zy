package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.CourseInviteStudent;
import com.gogowise.rep.course.enity.SeniorClassRoom;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.common.utils.Utils;
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

    public void saveSeniorClassRoom(Integer courseId, Integer userId) throws IOException {

        SeniorClassRoom seniorClassRoom = new SeniorClassRoom();
        BaseUser student = baseUserDao.findById(userId);
        Course course = courseDao.findById(courseId);
        seniorClassRoom.setCourse(course);
        seniorClassRoom.setStudent(student);

        this.saveStudentforSeniorClassRoom(seniorClassRoom);
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
            if (course.getObservationNum() + course.getCourseInviteStudents().size() >= course.getTeachingNum()) {
                return true;
            } else {
                return false;
            }
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
