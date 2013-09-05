package com.gogowise.dao;

import com.gogowise.domain.BaseUser;
import com.gogowise.domain.Course;
import com.gogowise.domain.Pagination;

import java.util.Calendar;
import java.util.List;

public interface CourseDao extends ModelDao<Course> {

    public void saveCourse(Course course);

    public void courseModification(Course exist,Course modified);

    public List<Course> findCourseOfAgeClass(Pagination page);

    public List<Course> findCourseOfLivingClass(Pagination page);

    public List<Course> findCourseOfForcastClass(Pagination page);

    public List<Course> findMyCourseOfForcastClass(Pagination page,Integer sid);

    public List<Course> findUserCreatedCourses(Integer userID,Pagination pagination);

    public List<Course> findUserRegCourses(Integer userID,Pagination pagination);

    public List<Course> findMyCourseOFAgePart(Pagination pagination,Integer sid);

    public List<Course> findMyCourseOfForcastClassForUserCenter(Pagination page, Integer sid);

 //   public Boolean confirmCourse(Integer courseId,Integer userId);

    public List<Course> findTheCanRegCourseByUid(Pagination pagination,Integer userId);

    public List<Course> findHotCourses(Pagination pagination);

    public List<Course> findlatestCourses(Pagination pagination);

    public List<Course> findCourses2Teacher(Integer tid,Pagination pagination);

    public List<Course> findCourses2Student(Integer tid, Pagination pagination);

    public List<Course> findCourseWithStudentIdAndCourseId(Integer tid, Integer cid);

    public List<Course> findCourseRelateCourses(String courseName,Pagination pagination);

    public Course findTodayCourse(Integer userId);

    public Course findTomorrowCourse(Integer userId);

    public Course findYesterdayCourse(Integer userId);

    public List<Course> searchCourseByName(Pagination page, String name);

    public  List<Course> findLatestCourseByOrg(Integer orgId, Pagination page);

    public List<Course> findHotCoursesByOrg(Integer orgId, Pagination pagination);

    public List<Course> findMaintenanceCourses(Integer tid,Pagination pagination);

    public List<Course> findOrgForcastClass(Pagination pagination);

    public Course saveRepeatCourse(Calendar startTime,Course course,String teacherEmail);

    public List<Course> findMyOrgCourseForSupervision(Integer Rid,Pagination pagination);

    public List<Course> findCourseOnline(Pagination pagination);

    public List<BaseUser> findRegUser(Integer courseId, Pagination pagination);

    public List<Course> findByOrg(Integer orgID,Pagination pagination);

    public List<Course> findByFromCourse(Integer fromCourseID,Pagination pagination);

    public List<Course> findLatest4Course(Pagination pagination);

    public List<Course> findCoursesInTypes(Integer type ,Pagination pagination);

    public List<Course>  searchCourses(String searchStr , Pagination pagination);
}
