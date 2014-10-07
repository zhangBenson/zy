package com.gogowise.rep.course.vo;

import com.gogowise.rep.course.enity.Course;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: benson
 * Date: 13-12-8
 * Time: 下午3:25
 * To change this template use File | Settings | File Templates.
 */
public class CourseSpecification {
    private Integer operatorId;
    private Course course;
    private Integer courseType;
    private List<String> teachersId;

    public Integer getOperatorId() {
        return operatorId;
    }

    public Course getCourse() {
        return course;
    }

    public Integer getCourseType() {
        return courseType;
    }

    public List<String> getTeachersId() {
        return teachersId;
    }

    public static CourseSpecification create(Course course,Integer operatorId, Integer courseType, List<String> teachersId) {
        CourseSpecification specification = new CourseSpecification();
        specification.operatorId = operatorId;
        specification.course = course;
        specification.courseType = courseType;
        specification.teachersId = teachersId;
        return specification;
    }
}
