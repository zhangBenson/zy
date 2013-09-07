package com.gogowise.rep.live.live;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.user.BaseUser;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import java.util.Calendar;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-12-7
 * Time: 上午10:39
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class MonitorAuthorize extends AbstractPersistence {
    @OneToOne
    private BaseUser authorize;
    @OneToOne
    private BaseUser authorizeTo;
    private String  monitorAuthorizeToEmail;

    private Calendar startTime;
    private Calendar endTime;

    public Boolean getAccept() {
        return accept;
    }

    public void setAccept(Boolean accept) {
        this.accept = accept;
    }

    private Boolean accept;

    public String getMonitorAuthorizeToEmail() {
        return monitorAuthorizeToEmail;
    }

    public void setMonitorAuthorizeToEmail(String monitorAuthorizeToEmail) {
        this.monitorAuthorizeToEmail = monitorAuthorizeToEmail;
    }

    public BaseUser getAuthorize() {
        return authorize;
    }

    public void setAuthorize(BaseUser authorize) {
        this.authorize = authorize;
    }

    public BaseUser getAuthorizeTo() {
        return authorizeTo;
    }

    public void setAuthorizeTo(BaseUser authorizeTo) {
        this.authorizeTo = authorizeTo;
    }

    public Calendar getStartTime() {
        return startTime;
    }

    public void setStartTime(Calendar startTime) {
        this.startTime = startTime;
    }

    public Calendar getEndTime() {
        return endTime;
    }

    public void setEndTime(Calendar endTime) {
        this.endTime = endTime;
    }
}
