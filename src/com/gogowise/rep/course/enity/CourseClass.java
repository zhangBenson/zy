package com.gogowise.rep.course.enity;

import com.gogowise.rep.AbstractPersistence;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.util.Calendar;

@Entity
@Table(name = "class")
public class CourseClass extends AbstractPersistence {
    private Calendar date;
    private String name;
    private String nickName;
    private Boolean isTeacherEntered = false;
    private Boolean isRecord = false;
    private Integer duration;
    @ManyToOne
    private Course course;
    private Integer anonyNum = 0;

    public Calendar getDate() {
        return date;
    }

    public void setDate(Calendar date) {
        this.date = date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getFinished() {
        return   Calendar.getInstance().after(this.getFinishDate());
    }

    public Boolean getRecord() {
        return isRecord;
    }

    public void setRecord(Boolean record) {
        isRecord = record;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }



    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public Calendar getFinishDate() {
        Calendar finishDate = (Calendar) this.getDate().clone();
        finishDate.add(Calendar.MINUTE, this.getDuration());
        return finishDate;
    }


    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public Boolean getTeacherEntered() {
        return isTeacherEntered;
    }

    public void setTeacherEntered(Boolean teacherEntered) {
        isTeacherEntered = teacherEntered;
    }
    public Integer getWeekDay(){
        return this.getDate().get(Calendar.DAY_OF_WEEK);
    }

    public Integer getAnonyNum() {
        return anonyNum;
    }

    public void setAnonyNum(Integer anonyNum) {
        this.anonyNum = anonyNum;
    }
}
