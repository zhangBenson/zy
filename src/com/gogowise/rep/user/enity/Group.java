package com.gogowise.rep.user.enity;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.course.enity.Course;

import javax.persistence.Entity;
import java.util.List;

/**
 * Created by benson on 2014/5/26.
 */
@Entity
public class Group extends AbstractPersistence {
    private String name;
    private List<BaseUser> students;
    private List<Course> courses;

    public String getName() {

        return name;
    }

    public void setName(String name) {

        this.name = name;
    }

    public List<BaseUser> getStudents() {

        return students;
    }

    public void setStudents(List<BaseUser> students) {

        this.students = students;
    }

    public List<Course> getCourses() {

        return courses;
    }

    public void setCourses(List<Course> courses) {

        this.courses = courses;
    }
}
