package com.gogowise.domain.live;


import com.gogowise.domain.AbstractPersistence;
import com.gogowise.domain.live.MyShow;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class SeasonIncreasedShowFans extends AbstractPersistence {
    //当前季度新增用户数和访问数
    @ManyToOne
    private MyShow myShow;
    private Integer season;
    private Integer year;
    private Integer fansNum = 0;
    private Integer inviteNum = 0;

    public MyShow getMyShow() {
        return myShow;
    }

    public void setMyShow(MyShow myShow) {
        this.myShow = myShow;
    }

    public Integer getSeason() {
        return season;
    }

    public void setSeason(Integer season) {
        this.season = season;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
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
}
