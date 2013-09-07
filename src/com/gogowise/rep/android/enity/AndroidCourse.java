package com.gogowise.rep.android.enity;

import com.gogowise.rep.user.user.BaseUser;
import com.gogowise.common.utils.Constants;

import java.util.Calendar;

/**
 * Created by IntelliJ IDEA.
 * User: GGW
 * Date: 12-1-12
 * Time: 下午8:28
 * To change this template use File | Settings | File Templates.
 */
public class AndroidCourse {
    private Boolean opened = true;
    private String name;
   // private  Organization organization;
    private BaseUser teacher;
    private BaseUser personalTeacher;
    private String logoUrl;
    private String description;
    private Integer limitNumUp;
    private Integer limitNum;
    private Calendar startDate;
    private Calendar finishDate;
    private Integer totalHours;
    private String teacherName;



    private Double  synthetical = Constants.DEFAULT_DOUBLE_VALUE;         //     综合评分
    private Integer evaluatorNums = Constants.DEFAULT_INT_VALUE;         //评分人数
    private Integer teachingNum = Constants.DEFAULT_INT_VALUE;           //几对几
    private Double charges;                                                 //课堂的收费
    private Boolean over = true;                                           //是否预定人数已满
     private Double consumptionQuantity = 0.000;       //数量

    private Boolean consumptionType = false;      //知券

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public Double getCharges() {
        return charges;
    }

    public void setCharges(Double charges) {
        this.charges = charges;
    }

    public Integer getEvaluatorNums() {
        return evaluatorNums;
    }

    public void setEvaluatorNums(Integer evaluatorNums) {
        this.evaluatorNums = evaluatorNums;
    }

    public Boolean getOver() {
        return over;
    }

    public void setOver(Boolean over) {
        this.over = over;
    }

    public Double getSynthetical() {
        return synthetical;
    }

    public void setSynthetical(Double synthetical) {
        this.synthetical = synthetical;
    }

    public Integer getTeachingNum() {
        return teachingNum;
    }

    public void setTeachingNum(Integer teachingNum) {
        this.teachingNum = teachingNum;
    }


    public Double getConsumptionQuantity() {
        return consumptionQuantity;
    }

    public void setConsumptionQuantity(Double consumptionQuantity) {
        this.consumptionQuantity = consumptionQuantity;
    }

    public Boolean getConsumptionType() {
        return consumptionType;
    }

    public void setConsumptionType(Boolean consumptionType) {
        this.consumptionType = consumptionType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Calendar getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(Calendar finishDate) {
        this.finishDate = finishDate;
    }

    public Integer getLimitNum() {
        return limitNum;
    }

    public void setLimitNum(Integer limitNum) {
        this.limitNum = limitNum;
    }

    public Integer getLimitNumUp() {
        return limitNumUp;
    }

    public void setLimitNumUp(Integer limitNumUp) {
        this.limitNumUp = limitNumUp;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getOpened() {
        return opened;
    }

    public void setOpened(Boolean opened) {
        this.opened = opened;
    }

    public BaseUser getPersonalTeacher() {
        return personalTeacher;
    }

    public void setPersonalTeacher(BaseUser personalTeacher) {
        this.personalTeacher = personalTeacher;
    }

    public Calendar getStartDate() {
        return startDate;
    }

    public void setStartDate(Calendar startDate) {
        this.startDate = startDate;
    }

    public BaseUser getTeacher() {
        return teacher;
    }

    public void setTeacher(BaseUser teacher) {
        this.teacher = teacher;
    }

    public Integer getTotalHours() {
        return totalHours;
    }

    public void setTotalHours(Integer totalHours) {
        this.totalHours = totalHours;
    }
}
