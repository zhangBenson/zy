package com.gogowise.rep.live.live;

import com.gogowise.rep.AbstractPersistence;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import java.util.Calendar;

@Entity
public class SeasonIncreasedOnliveFans extends AbstractPersistence {
    @ManyToOne
    private LiveChannel liveChannel;
    private Calendar focusTime;
    private Integer year;
    private Integer season;
    private Integer fansNum = 0;
    private Integer inviteNum = 0;

    public Integer getSeason() {
        return season;
    }

    public void setSeason(Integer season) {
        this.season = season;
    }

    public LiveChannel getLiveChannel() {
        return liveChannel;
    }

    public void setLiveChannel(LiveChannel liveChannel) {
        this.liveChannel = liveChannel;
    }

    public Calendar getFocusTime() {
        return focusTime;
    }

    public void setFocusTime(Calendar focusTime) {
        this.focusTime = focusTime;
    }

    public Integer getFansNum() {
        return fansNum;
    }

    public void setFansNum(Integer fansNum) {
        this.fansNum = fansNum;
    }

    public Integer getInviteNum() {
        return inviteNum;
    }

    public void setInviteNum(Integer inviteNum) {
        this.inviteNum = inviteNum;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }
}
