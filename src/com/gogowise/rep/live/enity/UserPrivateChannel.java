package com.gogowise.rep.live.enity;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.enity.BaseUser;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-10-18
 * Time: 下午1:34
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class UserPrivateChannel extends AbstractPersistence {
    public static  final Integer STATE_OF_PROBATION = 1; //试用期
    public static  final Integer STATE_OF_CHARGED = 2;    //正式购买


    @OneToOne
    private BaseUser user;
    private Boolean open2User;
    private Integer channelNum = 3; //子频道规模
    private Calendar createTime;     //频道开通时间
    private Calendar endTime;         //频道结束时间

    private Integer channelState; //频道当前状态(试用期 or 正式购买)
    private Integer channelCombo;  //开通频道的套餐      1 :月卡     2：季卡    3：半年卡   4：年卡

    @OneToMany(mappedBy = "userPrivateChannel")
    private List<SubPrivateChannel> subPrivateChannels = new ArrayList<SubPrivateChannel>();


    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public Boolean getOpen2User() {
        return open2User;
    }

    public void setOpen2User(Boolean open2User) {
        this.open2User = open2User;
    }

    public Integer getChannelNum() {
        return channelNum;
    }

    public void setChannelNum(Integer channelNum) {
        this.channelNum = channelNum;
    }

    public Calendar getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Calendar createTime) {
        this.createTime = createTime;
    }

    public Calendar getEndTime() {
        return endTime;
    }

    public void setEndTime(Calendar endTime) {
        this.endTime = endTime;
    }

    public Integer getChannelState() {
        return channelState;
    }

    public void setChannelState(Integer channelState) {
        this.channelState = channelState;
    }

    public Integer getChannelCombo() {
        return channelCombo;
    }

    public void setChannelCombo(Integer channelCombo) {
        this.channelCombo = channelCombo;
    }

    public List<SubPrivateChannel> getSubPrivateChannels() {
        return subPrivateChannels;
    }

    public void setSubPrivateChannels(List<SubPrivateChannel> subPrivateChannels) {
        this.subPrivateChannels = subPrivateChannels;
    }
}
