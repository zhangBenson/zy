package com.gogowise.rep.course;

import com.gogowise.rep.ModelService;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.vo.CourseSpecification;
import com.gogowise.rep.user.enity.BaseUser;

import java.util.List;

public interface CourseService extends ModelService {

    public List<BaseUser> findAllTeachersByOrgCreator(Integer userId);
    public void saveCourse(CourseSpecification specification);
    public Course findById(Integer id);
    public List<Course>  findMaintenanceCourses(Integer userId , Pagination pagination);
}
