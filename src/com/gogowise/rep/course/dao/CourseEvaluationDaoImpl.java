package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.course.enity.CourseEvaluation;
import com.gogowise.rep.Pagination;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-20
 * Time: 下午1:24
 * To change this template use File | Settings | File Templates.
 */

@Repository("courseEvaluationDao")
public class CourseEvaluationDaoImpl extends ModelDaoImpl<CourseEvaluation> implements CourseEvaluationDao{

    public CourseEvaluation findByEvaluatorId(Integer eid) {
        List<CourseEvaluation> courseEvaluations = new ArrayList<CourseEvaluation>();
        courseEvaluations = this.find("From CourseEvaluation ce where ce.evaluator.id=?",eid);
        if(courseEvaluations==null||courseEvaluations.size()==0){
            return null;
        }
        return courseEvaluations.get(0);
    }

    public List<CourseEvaluation> findByCourseId(Pagination pagination, Integer cid) {
        return this.find("From CourseEvaluation ce where ce.course.id=?",cid);
    }

    public CourseEvaluation findByCourseId(Integer cid) {
        return this.findFist("From CourseEvaluation ce where ce.course.id=?",cid);
    }

    public List<CourseEvaluation> findByTeacherId(Pagination pagination, Integer cid) {
        return this.find("From CourseEvaluation ce  where ce.course.teacher.id=?",cid);

    }


    public List<CourseEvaluation> findByOrganizationId(Pagination pagination, Integer oid) {
        return this.find("select distinct ce From CourseEvaluation ce join  ce.course c join c.organization org where org.id=? ",pagination,oid);
    }
}
