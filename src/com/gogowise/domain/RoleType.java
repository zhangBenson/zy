package com.gogowise.domain;

import javax.persistence.Entity;

@Entity
public class RoleType  extends AbstractPersistence{
    private String roleName;

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
