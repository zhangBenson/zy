package com.gogowise.dao.course;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.CourseQuestion;
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
