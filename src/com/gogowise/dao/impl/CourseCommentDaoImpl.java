package com.gogowise.dao.impl;

import com.gogowise.dao.CourseCommentDao;
import com.gogowise.domain.CourseComment;
import com.gogowise.domain.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-22
 * Time: 下午2:38
 * To change this template use File | Settings | File Templates.
 */
@Repository("courseCommentDao")
public class CourseCommentDaoImpl extends ModelDaoImpl<CourseComment> implements CourseCommentDao{
    public List<CourseComment> findByCourseId(Pagination pagination, Integer cid) {
        return this.find("From CourseComment cc where cc.course.id=? order by cc.id desc",pagination,cid);
    }
}
