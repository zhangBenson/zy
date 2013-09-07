package com.gogowise.domain.course;

import com.gogowise.domain.AbstractPersistence;
import com.gogowise.domain.user.BaseUser;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import java.util.Calendar;

@Entity
public class CourseReservation extends AbstractPersistence {
    @ManyToOne
    private Course course;
    @OneToOne
    private BaseUser owner;
    private String comments;
    private Calendar initial;
    private Calendar atLatest;
    private Boolean unActive = false  ;

    private Calendar creteDate;

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

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public Calendar getInitial() {
        return initial;
    }

    public void setInitial(Calendar initial) {
        this.initial = initial;
    }

    public Calendar getAtLatest() {
        return atLatest;
    }

    public void setAtLatest(Calendar atLatest) {
        this.atLatest = atLatest;
    }

    public Boolean getUnActive() {
        return unActive;
    }

    public void setUnActive(Boolean unActive) {
        this.unActive = unActive;
    }

    public Calendar getCreteDate() {
        return creteDate;
    }

    public void setCreteDate(Calendar creteDate) {
        this.creteDate = creteDate;
    }
}
