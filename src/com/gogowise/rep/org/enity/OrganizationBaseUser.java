package com.gogowise.rep.org.enity;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.user.enity.RoleType;

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

    /*---------------------definition of teacher status--------------*/
    public static final Short USER_STATUS_UNCONFIRMED = 1;
    public static final Short USER_STATUS_CONFIRMED = 3;
    public static final Short USER_STATUS_UNACCEPTED = 2;
    public static final Short USER_STATUS_DISABLED = 4;
    @ManyToOne
    private BaseUser user;
    @ManyToOne
    private Organization org;

    private String email;


    private Short userStatus = USER_STATUS_UNCONFIRMED;
    private Short previousStatus = USER_STATUS_UNCONFIRMED;
    private Integer roleType = RoleType.ROLE_TYPE_STUDENT;

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
