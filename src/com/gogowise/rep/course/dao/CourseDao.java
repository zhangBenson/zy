package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.user.enity.BaseUser;

import java.util.List;

public interface CourseDao extends ModelDao<Course> {


    public List<Course> findUserCreatedCourses(Integer userID, Pagination pagination);

    public List<Course> findUserRegCourses(Integer userID, Pagination pagination);

    public List<Course> findHotCourses(Pagination pagination);

    public List<Course> findlatestCourses(Pagination pagination);

    public List<Course> findlatestCoursesForAdmin(Pagination pagination);

    public List<Course> findMoocCourses(Pagination pagination);

    public List<Course> findCourses2Teacher(Integer tid, Pagination pagination);

    public Course findTodayCourse(Integer userId);

    public Course findTomorrowCourse(Integer userId);

    public Course findYesterdayCourse(Integer userId);

    public List<Course> findLatestCourseByOrg(Integer orgId, Pagination page);

    public List<Course> findHotCoursesByOrg(Integer orgId, Pagination pagination);

    public List<Course> findMoocsByOrg(Integer orgId, Pagination pagination);

    public List<Course> findCoursesByOrgWithAccess(Integer orgId, boolean isPublic, Pagination page);


    public List<Course> findMyOrgCourseForSupervision(Integer Rid, Pagination pagination);

    public List<BaseUser> findRegUser(Integer courseId, Pagination pagination);

    public List<Course> findByOrg(Integer orgID, Pagination pagination);

    public List<Course> findByFromCourse(Integer fromCourseID, Pagination pagination);

    public List<Course> findLatest4Course(Pagination pagination);

    public List<Course> findCoursesInTypes(Integer type, Pagination pagination);

    public List<Course> searchCourses(String searchStr, Pagination pagination);

    public List<Course> findMaintenanceCourses(Integer userId, Pagination pagination);

    public List<Course> findFinishedCourseForUserCenter(Pagination page, Integer sid, int type);

    public List<Course> findMyCourseOfForcastClassForUserCenter(Pagination page, Integer sid, int type);

    public List<Course> findForecastCourse(Pagination page);

}
