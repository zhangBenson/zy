package com.gogowise.rep.course.dao;


import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.enity.CourseMaterial;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository("courseMaterialDao")
public class CourseMaterialDaoImpl extends ModelDaoImpl<CourseMaterial> implements CourseMaterialDao {

    public List<CourseMaterial> findByCourseId(Pagination pagination, Integer courseId) {
        return this.find("From CourseMaterial cm where cm.course.id=? and isDisplay = ?  order by cm.id desc", pagination, courseId, true);
    }

    public List<CourseMaterial> findByCourseClassId(Pagination pagination, Integer courseClassId) {
        return this.find("From CourseMaterial cm where cm.courseClass.id=? and isDisplay = ?  order by cm.id desc", pagination, courseClassId, true);
    }

    public List<CourseMaterial> find(Integer courseId, Integer typeId) {
        return this.find("From CourseMaterial cm where cm.course.id=? and cm.type = ?  and isDisplay = ?  order by cm.id desc", courseId, typeId, true);
    }

}


