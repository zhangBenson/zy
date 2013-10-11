package com.gogowise.rep.course;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.course.enity.CourseMaterial;
import com.gogowise.rep.Pagination;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-5-14
 * Time: 上午1:50
 * To change this template use File | Settings | File Templates.
 */

public interface CourseMaterialDao extends ModelDao<CourseMaterial> {
     public List<CourseMaterial> findByCourseId(Pagination pagination, Integer courseId);

     public List<CourseMaterial> findByCourseClassId(Pagination pagination, Integer courseId);
}
