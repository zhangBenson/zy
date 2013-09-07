package com.gogowise.rep.live.live;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.user.BaseUser;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import java.util.Calendar;

@Entity
public class ShowComment extends AbstractPersistence {
     @OneToOne
    private MyShow show;           //课程
    @OneToOne
    private BaseUser commenter;      //评论者
    @OneToOne
    private BaseUser friend;
    private Calendar commentTime;        //评论时间
    private String content;           //评论内容

    public MyShow getShow() {
        return show;
    }

    public void setShow(MyShow show) {
        this.show = show;
    }

    public BaseUser getCommenter() {
        return commenter;
    }

    public void setCommenter(BaseUser commenter) {
        this.commenter = commenter;
    }

    public BaseUser getFriend() {
        return friend;
    }

    public void setFriend(BaseUser friend) {
        this.friend = friend;
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
}
