package com.gogowise.rep.live.enity;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.enity.BaseUser;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import java.util.Calendar;

@Entity
public class OnliveFollower extends AbstractPersistence {
    @ManyToOne
    private LiveChannel liveChannel;
    @OneToOne
    private BaseUser follower;
    private Calendar followTime;

    public LiveChannel getLiveChannel() {
        return liveChannel;
    }

    public void setLiveChannel(LiveChannel liveChannel) {
        this.liveChannel = liveChannel;
    }

    public BaseUser getFollower() {
        return follower;
    }

    public void setFollower(BaseUser follower) {
        this.follower = follower;
    }

    public Calendar getFollowTime() {
        return followTime;
    }

    public void setFollowTime(Calendar followTime) {
        this.followTime = followTime;
    }
}
