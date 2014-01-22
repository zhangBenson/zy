package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.rep.course.dao.ClassDao;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.dao.CourseMaterialDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.CourseMaterial;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class ListMaterialAction extends BasicAction {
    private Course course;
    private Integer classId;


    private CourseMaterial courseMaterial;
    private CourseMaterialDao courseMaterialDao;
    private CourseDao courseDao;
    private ClassDao classDao;
    private List<CourseMaterial> courseMaterials = new ArrayList<CourseMaterial>();


    @Action(value = "uploadCourseMaterial", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".uploadCourseMaterial")})
    public String uploadCourseMaterial() {
        courseMaterials = courseMaterialDao.findByCourseId(null, this.getCourse().getId());
        return SUCCESS;
    }


    @Action(value = "deleteCourseMaterial")
    public void deleteCourseMaterial() {
        CourseMaterial courseMaterial = courseMaterialDao.findById(this.getCourseMaterial().getId());
        courseMaterial.setIsDisplay(false);
        courseMaterialDao.persist(courseMaterial);
    }


    // getters and setters

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public CourseMaterial getCourseMaterial() {
        return courseMaterial;
    }

    public void setCourseMaterial(CourseMaterial courseMaterial) {
        this.courseMaterial = courseMaterial;
    }

    public CourseMaterialDao getCourseMaterialDao() {
        return courseMaterialDao;
    }

    public void setCourseMaterialDao(CourseMaterialDao courseMaterialDao) {
        this.courseMaterialDao = courseMaterialDao;
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public List<CourseMaterial> getCourseMaterials() {
        return courseMaterials;
    }

    public void setCourseMaterials(List<CourseMaterial> courseMaterials) {
        this.courseMaterials = courseMaterials;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public ClassDao getClassDao() {
        return classDao;
    }

    public void setClassDao(ClassDao classDao) {
        this.classDao = classDao;
    }
}
