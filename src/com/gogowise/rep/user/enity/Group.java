package com.gogowise.rep.user.enity;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.course.enity.Course;

import javax.persistence.Entity;
import java.util.ArrayList;
import java.util.List;

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

    public void removeStudent(BaseUser student) {

        if (students == null || students.size() == 0)
            return;
        for (BaseUser current : this.getStudents()) {
            if (current.getId().equals(student.getId())) {
                this.getStudents().remove(current);
                break;
            }
        }
    }

    public void removeCourse(Course course) {

        if (courses == null || courses.size() == 0)
            return;
        for (Course current : this.getCourses()) {
            if (current.getId().equals(course.getId())) {
                this.getCourses().remove(current);
                break;
            }
        }
    }

    public void addStudent(BaseUser student) {

        if (students == null) {
            this.students = new ArrayList<>();

        }
        if (!this.getStudentIds().contains(student.getId())) {
            this.getStudents().add(student);
        }
    }

    public void addCourse(Course course) {

        if (courses == null) {
            this.courses = new ArrayList<>();

        }
        if (!this.getStudentIds().contains(course.getId())) {
            this.getCourses().add(course);
        }
    }

    public List<Integer> getCourseIds() {

        if (courses == null)
            return null;
        List<Integer> ids = new ArrayList<>();
        for (Course course : courses) {
            ids.add(course.getId());
        }
        return ids;
    }

    public List<Integer> getStudentIds() {

        if (students == null)
            return null;
        List<Integer> ids = new ArrayList<>();
        for (BaseUser student : students) {
            ids.add(student.getId());
        }
        return ids;
    }
}
