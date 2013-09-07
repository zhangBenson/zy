package com.gogowise.rep.course;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.course.enity.CourseQuestion;
import com.gogowise.rep.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-25
 * Time: 下午4:49
 * To change this template use File | Settings | File Templates.
 */
@Repository("courseQuestionDao")
public class CourseQuestionDaoImpl extends ModelDaoImpl<CourseQuestion> implements CourseQuestionDao{

    public List<CourseQuestion> findNewByCourseId(Pagination pagination, Integer cid) {
        return this.find("From CourseQuestion cq where cq.course.id=? and cq.isAnswered = false",cid);
    }
}
