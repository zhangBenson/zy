package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.course.enity.CourseResource;
import com.gogowise.rep.Pagination;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-23
 * Time: 下午3:17
 * To change this template use File | Settings | File Templates.
 */
public interface CourseResourceDao extends ModelDao<CourseResource> {

    public List<CourseResource> findByCourseId(Pagination pagination,Integer cid);
}
