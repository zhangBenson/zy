package com.gogowise.domain.course;

import com.gogowise.domain.AbstractPersistence;
import com.gogowise.domain.user.BaseUser;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import java.util.Calendar;


/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-25
 * Time: 下午4:39
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class CourseQuestion extends AbstractPersistence {
    @OneToOne
    private BaseUser questioner;
    @OneToOne
    private Course course;
    private String description;
    private Calendar putTime;
    private Boolean isAnswered;

    public BaseUser getQuestioner() {
        return questioner;
    }

    public void setQuestioner(BaseUser questioner) {
        this.questioner = questioner;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Calendar getPutTime() {
        return putTime;
    }

    public void setPutTime(Calendar putTime) {
        this.putTime = putTime;
    }

    public Boolean getAnswered() {
        return isAnswered;
    }

    public void setAnswered(Boolean answered) {
        isAnswered = answered;
    }
}
