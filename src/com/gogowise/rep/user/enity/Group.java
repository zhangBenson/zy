package com.gogowise.rep.user.enity;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.org.enity.Organization;

import javax.persistence.Entity;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Group extends AbstractPersistence {
    private String name;
    private Organization organization;
    private List<BaseUser> students = new ArrayList<>();

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


    public void removeStudent(BaseUser student) {
        for (BaseUser current : this.getStudents()) {
            if (current.getId().equals(student.getId())) {
                this.getStudents().remove(current);
                break;
            }
        }
    }


    public void addStudent(BaseUser student) {

        if (!this.getStudentIds().contains(student.getId())) {
            this.getStudents().add(student);
        }
    }



    public List<Integer> getStudentIds() {

        List<Integer> ids = new ArrayList<>();
        for (BaseUser student : students) {
            ids.add(student.getId());
        }
        return ids;
    }

    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }
}
