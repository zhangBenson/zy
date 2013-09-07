package com.gogowise.domain.live;

import com.gogowise.domain.AbstractPersistence;
import com.gogowise.common.utils.Utils;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import java.util.Calendar;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-10-18
 * Time: 下午1:36
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class SubPrivateChannel extends AbstractPersistence {
    @ManyToOne
    private UserPrivateChannel userPrivateChannel;
    private String name;   //子频道主题
    private Integer subChannelNum;  // this number is used to mark the channel sequence
    private Calendar openTime;
    private Calendar flagUpdateTime = Utils.getCurrentCalender();   //record the heart signal update time
    private Boolean isUsing = false;      //初始化时，子频道默认是打开的

    public UserPrivateChannel getUserPrivateChannel() {
        return userPrivateChannel;
    }

    public void setUserPrivateChannel(UserPrivateChannel userPrivateChannel) {
        this.userPrivateChannel = userPrivateChannel;
    }

    public Integer getSubChannelNum() {
        return subChannelNum;
    }

    public void setSubChannelNum(Integer subChannelNum) {
        this.subChannelNum = subChannelNum;
    }

    public Calendar getFlagUpdateTime() {
        return flagUpdateTime;
    }

    public void setFlagUpdateTime(Calendar flagUpdateTime) {
        this.flagUpdateTime = flagUpdateTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Calendar getOpenTime() {
        return openTime;
    }

    public void setOpenTime(Calendar openTime) {
        this.openTime = openTime;
    }

    public Boolean channelFinished(){
        Calendar updateTime = (Calendar)this.getFlagUpdateTime().clone();
        updateTime.add(Calendar.MINUTE,10);
        if(updateTime.before(Calendar.getInstance()) || this.getUsing()) return true;
        else return false;
    }

    public Boolean getUsing() {
        return isUsing;
    }

    public void setUsing(Boolean using) {
        isUsing = using;
    }
}
