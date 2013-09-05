package com.gogowise.dao.course;

import com.gogowise.dao.ModelDaoImpl;
import com.gogowise.domain.ClassRoom;
import com.gogowise.domain.Course;
import com.gogowise.domain.Pagination;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-3
 * Time: 上午10:15
 * To change this template use File | Settings | File Templates.
 */

@Repository("classRoomDao")
public class ClassRoomDaoImpl extends ModelDaoImpl<ClassRoom> implements ClassRoomDao{
     private CourseDao courseDao;
    public void saveStudentforClassRoom(ClassRoom classRoom) {
        this.persistAbstract(classRoom);
        Course  course = courseDao.findById(classRoom.getCourse().getId());
        Integer buyAgeNum = course.getBuyAgesNum()+1;
        course.setBuyAgesNum(buyAgeNum);
        courseDao.persist(course);
    }

    public ClassRoom findClassRoomByCourseAndStudent(Integer cid, Integer sid) {
        List<ClassRoom> classRooms = new ArrayList<ClassRoom>();
        classRooms = this.find("From ClassRoom cr where cr.course.id=? and cr.student.id=?",cid,sid);
        if(classRooms==null||classRooms.size()==0){
            return null ;
        }
        return classRooms.get(0);
    }

    public List<ClassRoom> findClassRoomByCourseId(Pagination pagination, Integer id) {
        return this.find("From ClassRoom cr where cr.course.id=?",id);
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }
}
