package com.gogowise.rep.course.dao;


import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.course.enity.CourseMaterial;
import com.gogowise.rep.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 *Created by IntelliJ IDEA.
 * User: Yongzhi
 * Date: 12-5-13
 * Time: 下午10:12.
 */

@Repository("courseMaterialDao")
public class CourseMaterialDaoImpl extends ModelDaoImpl<CourseMaterial> implements CourseMaterialDao{

    public List<CourseMaterial> findByCourseId(Pagination pagination, Integer courseId) {
        return this.find("From CourseMaterial cm where cm.course.id=? order by cm.uploadTime desc", pagination, courseId);
    }

    public List<CourseMaterial> findByCourseClassId(Pagination pagination, Integer courseClassId) {
        return this.find("From CourseMaterial cm where cm.courseClass.id=? order by cm.uploadTime desc", pagination, courseClassId);
    }
}


