package com.gogowise.rep.course;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.course.enity.CourseRecommend;
import org.springframework.stereotype.Repository;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-4-7
 * Time: 下午2:11
 * To change this template use File | Settings | File Templates.
 */
@Repository("courseRecommendDao")
public class CourseRecommendDaoImpl extends ModelDaoImpl<CourseRecommend> implements CourseRecommendDao{
}
