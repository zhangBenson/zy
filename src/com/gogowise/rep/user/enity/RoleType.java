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
    public final static String TEACHER = "teacher";
    public final static String STUDENT = "student";

    public final static String getRoleNameById(Integer roleId){
        switch (roleId){
            case 1: return ADMIN;
            case 2: return ORG_CREATOR;
            case 3: return ORG_REVIEWER;
            case 4: return GRANT;
            case 5: return TEACHER;
            case 6: return STUDENT;
        }
        return "undefined";
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
