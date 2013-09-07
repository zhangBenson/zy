package com.gogowise.rep.course;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.course.enity.CourseNewEvent;
import com.gogowise.rep.Pagination;
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
