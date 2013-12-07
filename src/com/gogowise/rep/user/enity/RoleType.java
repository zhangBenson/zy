package com.gogowise.rep.user.enity;

import com.gogowise.rep.AbstractPersistence;

import javax.persistence.Entity;

@Entity
public class RoleType extends AbstractPersistence {
    private String roleName;

    public final static String ADMIN = "admin";
    public final static String ORG_CREATOR = "orgCreator";
    public final static String ORG_REVIEWER = "orgReviewer";
    public final static String GRANT = "grant";

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
