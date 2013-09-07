package com.gogowise.dao.course;

import com.gogowise.dao.ModelDaoImpl;
import com.gogowise.domain.course.CourseNewEvent;
import com.gogowise.domain.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("courseNewEventDao")
public class CourseNewEventDaoImpl extends ModelDaoImpl<CourseNewEvent> implements CourseNewEventDao{

    public List<CourseNewEvent> findLatestTenEvents(Pagination pagination) {
        String hql = "From CourseNewEvent cne order by cne.id desc";
        return this.find(hql,pagination);
    }

    public List<CourseNewEvent> findByCourseID(Integer courseID, Pagination pagination) {
        String hql = "From CourseNewEvent cne where cne.course.id=? order by cne.id desc";
        return this.find(hql,pagination,courseID);
    }
}
