package com.gogowise.action.android;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.CourseDao;
import com.gogowise.domain.AndroidCourse;
import com.gogowise.domain.Course;
import com.gogowise.domain.Pagination;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: GGW
 * Date: 12-1-5
 * Time: 下午2:53
 * To change this template use File | Settings | File Templates.
 */

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
//@ParentPackage(value = "basic-json-package")
@Results({
        @Result(name = "json", type = "json")

})
public class CourseForAndroidAction extends BasicAction {
    private CourseDao courseDao;
    private List<Course> courses = new ArrayList<Course>();
    private Pagination page = new Pagination();
    private List<AndroidCourse> course1=new ArrayList<AndroidCourse>();
    private String type;


    @Action(value = "forcast4android")
    public String forcast(){
          courses = courseDao.findCourseOfForcastClass(page);
          for(int i=0;i<courses.size();i++){
              Course c1=courses.get(i);
              AndroidCourse c=new AndroidCourse();
              c.setName(c1.getName());
              c.setTeachingNum(c1.getTeachingNum());
              c.setLogoUrl(c1.getLogoUrl());

              if(c1.getTeacher().getNickName()==null||c1.getTeacher().getNickName()==""){
                   c.setTeacherName("未知");
              }else{
                  c.setTeacherName(c1.getTeacher().getNickName());
              }
              c.setDescription(c1.getDescription());
              c.setCharges(c1.getCharges());
              course1.add(c);
          }
          return "json";
    }
    @JSON(serialize = false)
    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }
    @JSON(serialize = false)
    public List<Course> getCourses() {
        return courses;
    }
    @JSON(serialize = false)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setCourses(List<Course> courses) {
        this.courses = courses;
    }
    @JSON(serialize = false)
    public Pagination getPage() {
        return page;
    }

    public void setPage(Pagination page) {
        this.page = page;
    }

    public List<AndroidCourse> getCourse1() {
        return course1;
    }

    public void setCourse1(List<AndroidCourse> course1) {
        this.course1 = course1;
    }
}
