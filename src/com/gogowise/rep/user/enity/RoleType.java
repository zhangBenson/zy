package com.gogowise.rep.user.enity;

import com.gogowise.rep.AbstractPersistence;
import org.apache.commons.collections.BidiMap;
import org.apache.commons.collections.bidimap.DualHashBidiMap;

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

    private static final BidiMap roleMap = new DualHashBidiMap();

    static {
        roleMap.put(1, ADMIN);
        roleMap.put(2, ORG_CREATOR);
        roleMap.put(3, ORG_REVIEWER);
        roleMap.put(4, GRANT);
        roleMap.put(5, TEACHER);
        roleMap.put(6, STUDENT);
    }

    public final static String getRoleNameById(Integer roleId){
        return roleMap.get(roleId) == null ? "undefined" : (String) roleMap.get(roleId);
    }

    public final static Integer getIdByRoleName(String roleName) {
        return (Integer) roleMap.inverseBidiMap().get(roleName);
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
