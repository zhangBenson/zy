package com.gogowise.dao.impl;

import com.gogowise.dao.CourseReservationDao;
import com.gogowise.domain.CourseReservation;
import org.springframework.stereotype.Repository;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-4-4
 * Time: 下午4:18
 * To change this template use File | Settings | File Templates.
 */
@Repository("courseReservationDao")
public class CourseReservationDaoImpl extends ModelDaoImpl<CourseReservation> implements CourseReservationDao{

    public CourseReservation findByCourseAndUser(Integer courseID, Integer userID) {
        String hql = "From CourseReservation cr where cr.course.id = ? and cr.owner.id=?";
        return this.findFist(hql,courseID,userID);
    }

}
