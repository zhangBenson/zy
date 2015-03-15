package com.gogowise.rep.course.vo;

import com.gogowise.rep.course.enity.Course;

import java.util.ArrayList;
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
    private List<String> teachersId = new ArrayList<>();
    private List<String> tags = new ArrayList<>();
    private List<String> emails = new ArrayList<>();

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

    public List<String> getTags() {
        return tags;
    }

    public List<String> getEmails() {
        return emails;
    }

    public void addEmail(String email) {
        emails.add(email);
    }

    public static CourseSpecification create(Course course, Integer operatorId, Integer courseType, List<String> teachersId, List<String> tags, List<String> emails) {
        CourseSpecification specification = new CourseSpecification();
        specification.operatorId = operatorId;
        specification.course = course;
        specification.courseType = courseType;
        specification.teachersId.addAll(teachersId);
        specification.tags.addAll(tags);
        specification.emails.addAll(emails);
        return specification;
    }
}
