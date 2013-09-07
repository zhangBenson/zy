package com.gogowise.rep.course;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.course.enity.CourseComment;
import com.gogowise.rep.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("courseCommentDao")
public class CourseCommentDaoImpl extends ModelDaoImpl<CourseComment> implements CourseCommentDao{
    public List<CourseComment> findByCourseId(Pagination pagination, Integer cid) {
        return this.find("From CourseComment cc where cc.course.id=? order by cc.id desc",pagination,cid);
    }
}
