package com.gogowise.dao;

import com.gogowise.domain.Course;
import com.gogowise.domain.CourseClass;

import java.util.Calendar;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-10-23
 * Time: 下午1:43
 * To change this template use File | Settings | File Templates.
 */
public interface ClassDao extends ModelDao<CourseClass>{

    public void saveClass(CourseClass courseClass,Course course,Integer duration);

    public void editClass(CourseClass courseClass);

    public List<CourseClass> findAgeCourse(Integer id);

    public List<CourseClass> findOngoingCourse(Integer id);

    public List<CourseClass> findForcastCourse(Integer id);

    public List<CourseClass> findMyForcastCourse(Integer cid,Integer sid);

    public List<CourseClass> findByCourseId(Integer cid);

    public CourseClass findByClassNameAndCourseId(String className,Integer cid);

    public void autoClassSystemSave(List<Calendar> startTimes,List<Integer> durations,List<Integer> classDate,Integer repeatTimes,Course course);

    public List<CourseClass> find(Calendar startTime, Calendar endTime);

    public List<CourseClass> find(Calendar startTime);

    public void sendEmailToAll(CourseClass courseClass);

}

