package com.gogowise.rep.course;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.course.enity.CourseReservation;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-4-4
 * Time: 下午4:17
 * To change this template use File | Settings | File Templates.
 */
public interface CourseReservationDao extends ModelDao<CourseReservation> {

     public CourseReservation findByCourseAndUser(Integer courseID, Integer userID);
}
