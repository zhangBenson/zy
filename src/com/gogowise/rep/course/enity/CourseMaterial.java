package com.gogowise.rep.course.enity;

import com.gogowise.rep.AbstractPersistence;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import java.util.Calendar;

/**
 * Created by IntelliJ IDEA.
 * User: Yongzhi
 * Date: 12-5-13
 * Time: 下午10:12
 * To change this template use File | Settings | File Templates.
 */
@Entity
//@Table( name = "CourseMaterial" )
public class CourseMaterial extends AbstractPersistence {
    @ManyToOne
    private Course course;
    @ManyToOne
    private CourseClass courseClass;
    private int type;
    private String description;
    private Calendar uploadTime;
    private String fullPath;
    private String sourceTitle;
    private Double fullSize = 0.0;
    private Integer totalPages;
    private String path;

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getSourceTitle() {
        return sourceTitle;
    }

    public void setSourceTitle(String sourceTitle) {
        this.sourceTitle = sourceTitle;
    }

    public String getFullPath() {

        return fullPath;
    }

    public void setFullPath(String fullPath) {
        this.fullPath = fullPath;
    }


    public String getDescription() {

        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getFullSize() {
        return fullSize;
    }

    public void setFullSize(Double fullSize) {
        this.fullSize = fullSize;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Calendar getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Calendar uploadTime) {
        this.uploadTime = uploadTime;
    }

    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public CourseClass getCourseClass() {
        return courseClass;
    }

    public void setCourseClass(CourseClass courseClass) {
        this.courseClass = courseClass;
        this.course = courseClass.getCourse();
    }
}
