package com.gogowise.dao.course;

import com.gogowise.dao.ModelDaoImpl;
import com.gogowise.domain.CourseComment;
import com.gogowise.domain.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("courseCommentDao")
public class CourseCommentDaoImpl extends ModelDaoImpl<CourseComment> implements CourseCommentDao{
    public List<CourseComment> findByCourseId(Pagination pagination, Integer cid) {
        return this.find("From CourseComment cc where cc.course.id=? order by cc.id desc",pagination,cid);
    }
}
