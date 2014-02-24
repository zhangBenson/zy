package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.course.enity.CourseMaterial;
import com.gogowise.rep.Pagination;

import java.util.List;


public interface CourseMaterialDao extends ModelDao<CourseMaterial> {
     public List<CourseMaterial> findByCourseId(Pagination pagination, Integer courseId);

     public List<CourseMaterial> findByCourseClassId(Pagination pagination, Integer courseId);

    public List<CourseMaterial> find( Integer courseId, Integer typeId);
}
