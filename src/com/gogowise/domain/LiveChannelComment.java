package com.gogowise.domain;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import java.util.Calendar;

@Entity
public class LiveChannelComment extends AbstractPersistence{
    @OneToOne
    private LiveChannel liveChannel;

    @OneToOne
    private BaseUser commenter;
    @OneToOne
    private BaseUser toFriend;
    private Calendar commentTime;
    private String content;

    public LiveChannel getLiveChannel() {
        return liveChannel;
    }

    public void setLiveChannel(LiveChannel liveChannel) {
        this.liveChannel = liveChannel;
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
