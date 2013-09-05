package com.gogowise.dao;

import com.gogowise.domain.BrowsedCourse;

import java.util.List;

public interface BrowsedCourseDao extends ModelDao<BrowsedCourse> {
    public List<BrowsedCourse> findByUserId(Integer userId);
}
