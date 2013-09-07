package com.gogowise.rep.competition.enity;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.enity.BaseUser;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Competition extends AbstractPersistence {
    private String name;
    @OneToOne
    private BaseUser creator;
    private String description;
    @Temporal(TemporalType.DATE)
    private Date startDate;
    @Temporal(TemporalType.DATE)
    private Date endDate;
    @Temporal(TemporalType.DATE)
    private Date singUpStartDate;
    @Temporal(TemporalType.DATE)
    private Date singUpEndDate;
    private int status;
    private String logoUrl;
    private String phone;
    private String QQ;
    @ManyToOne
    private Subject subject;
    private String brief;
    private String guanMing;

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BaseUser getCreator() {
        return creator;
    }

    public void setCreator(BaseUser creator) {
        this.creator = creator;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Date getSingUpStartDate() {
        return singUpStartDate;
    }

    public void setSingUpStartDate(Date singUpStartDate) {
        this.singUpStartDate = singUpStartDate;
    }

    public Date getSingUpEndDate() {
        return singUpEndDate;
    }

    public void setSingUpEndDate(Date singUpEndDate) {
        this.singUpEndDate = singUpEndDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getQQ() {
        return QQ;
    }

    public void setQQ(String QQ) {
        this.QQ = QQ;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public String getGuanMing() {
        return guanMing;
    }

    public void setGuanMing(String guanMing) {
        this.guanMing = guanMing;
    }
}
