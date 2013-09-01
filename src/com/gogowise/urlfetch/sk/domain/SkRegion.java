package com.gogowise.urlfetch.sk.domain;

import com.gogowise.urlfetch.AbstractUrlFetchPersistence;

import javax.persistence.Entity;

@Entity
public class SkRegion extends AbstractUrlFetchPersistence {
    private String name;
    private Integer regId;
    private Integer parentId;
    private boolean hasChild = false;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getRegId() {
        return regId;
    }

    public void setRegId(Integer regId) {
        this.regId = regId;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Boolean getHasChild() {
        return hasChild;
    }

    public void setHasChild(Boolean hasChild) {
        this.hasChild = hasChild;
    }

    public boolean isSame(SkRegion obj) {
        if (this.getName() == null) return false;
        return this.getName().equalsIgnoreCase(obj.getName());
    }


}
