package com.gogowise.rep.org.enity;

import com.gogowise.common.utils.Constants;
import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.enity.BaseUser;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import java.util.Calendar;

/**
 * Created by IntelliJ IDEA.
 * User: 苑永志
 * Date: 11-10-24
 * Time: 下午3:09
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class OrganizationBaseUser extends AbstractPersistence {

    public final static  Integer ORG_ROLE_TYPE_AUTH = 1;

    @ManyToOne
    private BaseUser user;
    @ManyToOne
    private Organization org;

    private Short userStatus = Constants.USER_STATUS_UNCONFIRMED;
    private Short previousStatus = Constants.USER_STATUS_UNCONFIRMED;
    private Integer roleType = Constants.ROLE_TYPE_STUDENT;

    private Calendar createDate = Calendar.getInstance();

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public Organization getOrg() {
        return org;
    }

    public void setOrg(Organization org) {
        this.org = org;
    }

    public Calendar getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Calendar createDate) {
        this.createDate = createDate;
    }

    public Integer getRoleType() {
        return roleType;
    }

    public void setRoleType(Integer roleType) {
        this.roleType = roleType;
    }

    public Short getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(Short userStatus) {
        this.userStatus = userStatus;
    }

    public Short getPreviousStatus() {
        return previousStatus;
    }

    public void setPreviousStatus(Short previousStatus) {
        this.previousStatus = previousStatus;
    }
}
