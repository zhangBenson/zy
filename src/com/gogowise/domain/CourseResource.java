package com.gogowise.domain;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import java.util.Calendar;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-23
 * Time: 下午3:01
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class CourseResource extends AbstractPersistence{
    @OneToOne
    private Course course;
    @OneToOne
    private BaseUser provider;
    private String sourceTitle;
    private String fullPath;
    private Calendar provideTime;
    private Calendar estimateTime;
    private String description;


    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public BaseUser getProvider() {
        return provider;
    }

    public void setProvider(BaseUser provider) {
        this.provider = provider;
    }

    public String getSourceTitle() {
        return sourceTitle;
    }

    public void setSourceTitle(String sourceTitle) {
        this.sourceTitle = sourceTitle;
    }

    public Calendar getProvideTime() {
        return provideTime;
    }

    public void setProvideTime(Calendar provideTime) {
        this.provideTime = provideTime;
    }

    public Calendar getEstimateTime() {
        return estimateTime;
    }

    public void setEstimateTime(Calendar estimateTime) {
        this.estimateTime = estimateTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFullPath() {
        return fullPath;
    }

    public void setFullPath(String fullPath) {
        this.fullPath = fullPath;
    }

}
