package com.gogowise.rep.live.live;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.user.BaseUser;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import java.util.Calendar;

@Entity
public class UserFans extends AbstractPersistence {
    @OneToOne
    private BaseUser user;
    @OneToOne
    private BaseUser fan;
    private Calendar focusTime;
    private Boolean  userLiving = false; //在个人中心，用于记录我关注的博主是否正在直播 ，数据库中不保存数据，临时用
    private Integer personalOnliveID = -1;  //同样用于个人中心，如果正在直播，记录直播的ID；

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public BaseUser getFan() {
        return fan;
    }

    public void setFan(BaseUser fan) {
        this.fan = fan;
    }

    public Calendar getFocusTime() {
        return focusTime;
    }

    public void setFocusTime(Calendar focusTime) {
        this.focusTime = focusTime;
    }

    public Boolean getUserLiving() {
        return userLiving;
    }

    public void setUserLiving(Boolean userLiving) {
        this.userLiving = userLiving;
    }

    public Integer getPersonalOnliveID() {
        return personalOnliveID;
    }

    public void setPersonalOnliveID(Integer personalOnliveID) {
        this.personalOnliveID = personalOnliveID;
    }
}
