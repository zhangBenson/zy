package com.gogowise.rep.user.user;

import com.gogowise.rep.AbstractPersistence;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class BaseUserRoleType extends AbstractPersistence {
    @ManyToOne
    private BaseUser baseUser;
    @ManyToOne
    private RoleType roleType;

    public BaseUser getBaseUser() {
        return baseUser;
    }

    public void setBaseUser(BaseUser baseUser) {
        this.baseUser = baseUser;
    }

    public RoleType getRoleType() {
        return roleType;
    }

    public void setRoleType(RoleType roleType) {
        this.roleType = roleType;
    }
}
