package com.gogowise.rep.live.enity;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.enity.BaseUser;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import java.util.Calendar;

@Entity
public class LiveTermComment extends AbstractPersistence {
    @OneToOne
    private ChannelTerms channelTerms;
    @OneToOne
    private BaseUser commenter;
    @OneToOne
    private BaseUser toFriend;
    private Calendar commentTime;
    private String content;

    public ChannelTerms getChannelTerms() {
        return channelTerms;
    }

    public void setChannelTerms(ChannelTerms channelTerms) {
        this.channelTerms = channelTerms;
    }

    public BaseUser getCommenter() {
        return commenter;
    }

    public void setCommenter(BaseUser commenter) {
        this.commenter = commenter;
    }

    public BaseUser getToFriend() {
        return toFriend;
    }

    public void setToFriend(BaseUser toFriend) {
        this.toFriend = toFriend;
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
