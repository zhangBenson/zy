package com.gogowise.rep.course;

import com.gogowise.rep.ModelService;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.ServiceException;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.CourseMaterial;
import com.gogowise.rep.course.enity.Question;
import com.gogowise.rep.course.vo.CourseSpecification;
import com.gogowise.rep.user.enity.BaseUser;

import java.util.List;

public interface CourseService extends ModelService {

    public void saveCourse(CourseSpecification specification);

    public Course findById(Integer id);

    public List<Course> findMaintenanceCourses(Integer userId, Pagination pagination);

    public void saveQuestion(CourseMaterial courseMaterial, List<Question> questions);

    public void validateBeforePurchase(Course course, BaseUser user) throws ServiceException;

    public boolean isDenyByPrivateCourse(Integer userId, Integer courseId);

    public void saveInvitation(String email, Integer courseId);

    public void delete(Integer id, Integer userId) throws ServiceException;
}
