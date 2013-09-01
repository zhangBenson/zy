package com.gogowise.dao;

import com.gogowise.domain.CourseResource;
import com.gogowise.domain.Pagination;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-23
 * Time: 下午3:17
 * To change this template use File | Settings | File Templates.
 */
public interface CourseResourceDao extends ModelDao<CourseResource>{

    public List<CourseResource> findByCourseId(Pagination pagination,Integer cid);
}
