package com.gogowise.rep.course.enity;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.enity.BaseUser;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import java.util.Calendar;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-4-7
 * Time: 下午2:01
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class CourseRecommend extends AbstractPersistence {
    @ManyToOne
    private Course course;
    @OneToOne
    private BaseUser user;    //if the user accept,that is to say the user has already been our system's member,and then we fill him in.
    private String comments;
    private String email;
    private Calendar createTime;


    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public Calendar getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Calendar createTime) {
        this.createTime = createTime;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
