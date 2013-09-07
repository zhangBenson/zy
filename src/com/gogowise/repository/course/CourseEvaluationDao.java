package com.gogowise.repository.course;

import com.gogowise.repository.ModelDao;
import com.gogowise.domain.course.CourseEvaluation;
import com.gogowise.domain.Pagination;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-20
 * Time: 下午1:19
 * To change this template use File | Settings | File Templates.
 */
public interface CourseEvaluationDao extends ModelDao<CourseEvaluation> {

    public CourseEvaluation findByEvaluatorId(Integer eid);

    public CourseEvaluation findByCourseId(Integer cid);

    public List<CourseEvaluation> findByCourseId(Pagination pagination,Integer cid);

    public List<CourseEvaluation> findByTeacherId(Pagination pagination, Integer cid);

    public List<CourseEvaluation> findByOrganizationId(Pagination pagination,Integer oid);

}
