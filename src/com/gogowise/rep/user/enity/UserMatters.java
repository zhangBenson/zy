package com.gogowise.rep.user.enity;


import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.OneToOne;

import com.gogowise.rep.AbstractPersistence;
@Entity
public class UserMatters extends AbstractPersistence {

    @OneToOne
    private BaseUser user;

    private Boolean viewed = false;
    private Calendar createTime;

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public Boolean getViewed() {
        return viewed;
    }

    public void setViewed(Boolean viewed) {
        this.viewed = viewed;
    }

    public Calendar getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Calendar createTime) {
        this.createTime = createTime;
    }
}
