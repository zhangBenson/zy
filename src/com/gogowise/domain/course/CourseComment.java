package com.gogowise.domain.course;

import com.gogowise.domain.AbstractPersistence;
import com.gogowise.domain.user.BaseUser;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import java.util.Calendar;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-22
 * Time: 下午1:55
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class CourseComment extends AbstractPersistence {
    @OneToOne
    private Course course;           //课程
    @OneToOne
    private BaseUser commenter;      //评论者
    @OneToOne
    private BaseUser friend;
    private Calendar commentTime;        //评论时间
    private String content;           //评论内容

    //==================getter  and setter =============


    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public BaseUser getCommenter() {
        return commenter;
    }

    public void setCommenter(BaseUser commenter) {
        this.commenter = commenter;
    }

    public Calendar getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Calendar commentTime) {
        this.commentTime = commentTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public BaseUser getFriend() {
        return friend;
    }

    public void setFriend(BaseUser friend) {
        this.friend = friend;
    }
}
