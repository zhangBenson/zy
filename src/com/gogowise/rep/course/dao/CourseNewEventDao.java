package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.course.enity.CourseNewEvent;
import com.gogowise.rep.Pagination;

import java.util.List;


public interface CourseNewEventDao extends ModelDao<CourseNewEvent> {

    public List<CourseNewEvent> findLatestTenEvents(Pagination pagination);

    public List<CourseNewEvent> findByCourseID(Integer courseID, Pagination pagination);
}
