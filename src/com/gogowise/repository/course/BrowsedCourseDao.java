package com.gogowise.repository.course;

import com.gogowise.repository.ModelDao;
import com.gogowise.domain.course.BrowsedCourse;

import java.util.List;

public interface BrowsedCourseDao extends ModelDao<BrowsedCourse> {
    public List<BrowsedCourse> findByUserId(Integer userId);
}
