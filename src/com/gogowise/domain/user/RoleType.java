package com.gogowise.domain.user;

import com.gogowise.domain.AbstractPersistence;

import javax.persistence.Entity;

@Entity
public class RoleType  extends AbstractPersistence {
    private String roleName;

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
