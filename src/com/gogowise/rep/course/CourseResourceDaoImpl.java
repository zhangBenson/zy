package com.gogowise.rep.course;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.domain.course.CourseResource;
import com.gogowise.domain.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-23
 * Time: 下午3:18
 * To change this template use File | Settings | File Templates.
 */
@Repository("courseResourceDao")
public class CourseResourceDaoImpl extends ModelDaoImpl<CourseResource> implements CourseResourceDao{

    public List<CourseResource> findByCourseId(Pagination pagination, Integer cid) {
        return this.find("From CourseResource cr where cr.course.id=?",cid);
    }

}
