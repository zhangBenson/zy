package com.gogowise.dao.course;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.CourseNewEvent;
import com.gogowise.domain.Pagination;

import java.util.List;


public interface CourseNewEventDao extends ModelDao<CourseNewEvent> {

    public List<CourseNewEvent> findLatestTenEvents(Pagination pagination);

    public List<CourseNewEvent> findByCourseID(Integer courseID, Pagination pagination);
}
