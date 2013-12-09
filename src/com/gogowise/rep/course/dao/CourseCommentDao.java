package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.course.enity.CourseComment;
import com.gogowise.rep.Pagination;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-22
 * Time: 下午2:34
 * To change this template use File | Settings | File Templates.
 */
public interface CourseCommentDao extends ModelDao<CourseComment> {

    public List<CourseComment> findByCourseId(Pagination pagination,Integer cid);

}
