package com.gogowise.domain.live;

import com.gogowise.domain.AbstractPersistence;
import com.gogowise.domain.user.BaseUser;
import com.gogowise.common.utils.Utils;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import java.util.Calendar;

@Entity
public class PersonalOnlive extends AbstractPersistence {
    @OneToOne
    private BaseUser owner;
    private String title;
    private String announcement;
    private Calendar startTime;
    private Integer duration = 0;       //持续时间
    private Integer anonyNum = 0;
    private Long flag = Utils.getCurrentCalender().getTimeInMillis()/1000;
    private Calendar flagUpdateTime = Utils.getCurrentCalender();
    private Boolean haveRecord = false;  //是否录像了
    private Calendar recordTime;     //录像的时间
    private Integer sequence;
    private Boolean realFinished = false;

    private Integer numOfRegAudience = 0;   //最多同时在线注册人数
    private Integer numOfAudience = 0;    //最多同时在线用户
    private Integer clickRate = 0 ;     //总点击量

    private String address;
    private double latitude;
    private double longitude;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public BaseUser getOwner() {
        return owner;
    }

    public void setOwner(BaseUser owner) {
        this.owner = owner;
    }

    public Calendar getStartTime() {
        return startTime;
    }

    public void setStartTime(Calendar startTime) {
        this.startTime = startTime;
    }

    public Integer getAnonyNum() {
        return anonyNum;
    }

    public void setAnonyNum(Integer anonyNum) {
        this.anonyNum = anonyNum;
    }

    public Long getFlag() {
        return flag;
    }

    public void setFlag(Long flag) {
        this.flag = flag;
    }
    public Boolean getFinished() {
        if((Utils.getCurrentCalender().getTimeInMillis()/1000 - this.getFlag())>500){
            return true;
        }
        return false;
    }

    public Boolean getHaveRecord() {
        return haveRecord;
    }

    public void setHaveRecord(Boolean haveRecord) {
        this.haveRecord = haveRecord;
    }

    public Calendar getRecordTime() {
        return recordTime;
    }

    public void setRecordTime(Calendar recordTime) {
        this.recordTime = recordTime;
    }

    public Calendar getFlagUpdateTime() {
        return flagUpdateTime;
    }

    public void setFlagUpdateTime(Calendar flagUpdateTime) {
        this.flagUpdateTime = flagUpdateTime;
    }

    public Integer getSequence() {
        return sequence;
    }

    public void setSequence(Integer sequence) {
        this.sequence = sequence;
    }

    public Integer getNumOfRegAudience() {
        return numOfRegAudience;
    }

    public void setNumOfRegAudience(Integer numOfRegAudience) {
        this.numOfRegAudience = numOfRegAudience;
    }

    public Integer getNumOfAudience() {
        return numOfAudience;
    }

    public void setNumOfAudience(Integer numOfAudience) {
        this.numOfAudience = numOfAudience;
    }

    public Integer getClickRate() {
        return clickRate;
    }

    public void setClickRate(Integer clickRate) {
        this.clickRate = clickRate;
    }


    public Boolean getRealFinished() {
        return realFinished;
    }

    public void setRealFinished(Boolean realFinished) {
        this.realFinished = realFinished;
    }

    public Calendar getEndTime(){
        Calendar endTime = (Calendar)this.getStartTime().clone();
        endTime.add(Calendar.MINUTE,this.getDuration());
        return endTime;
    }

    public String getAnnouncement() {
        return announcement;
    }

    public void setAnnouncement(String announcement) {
        this.announcement = announcement;
    }
}
