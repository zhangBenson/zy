package com.gogowise.rep.course;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.course.enity.CourseQuestion;
import com.gogowise.rep.Pagination;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-25
 * Time: 下午4:47
 * To change this template use File | Settings | File Templates.
 */
public interface CourseQuestionDao extends ModelDao<CourseQuestion> {

    public List<CourseQuestion> findNewByCourseId(Pagination pagination,Integer cid);
}
