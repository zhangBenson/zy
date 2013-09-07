package com.gogowise.repository.course;

import com.gogowise.repository.ModelDao;
import com.gogowise.domain.course.CourseQuestion;
import com.gogowise.domain.Pagination;

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
