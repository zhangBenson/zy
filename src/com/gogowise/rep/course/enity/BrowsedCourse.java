package com.gogowise.rep.course.enity;


import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.enity.BaseUser;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;


@Entity
public class BrowsedCourse extends AbstractPersistence {
    @ManyToOne
    private Course course;
    @ManyToOne
    private BaseUser owner;

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public BaseUser getOwner() {
        return owner;
    }

    public void setOwner(BaseUser owner) {
        this.owner = owner;
    }
}
