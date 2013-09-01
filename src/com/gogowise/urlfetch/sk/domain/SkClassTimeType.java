package com.gogowise.urlfetch.sk.domain;

import com.gogowise.urlfetch.AbstractUrlFetchPersistence;

import javax.persistence.Entity;

@Entity
public class SkClassTimeType extends AbstractUrlFetchPersistence {
    private String name;
    private Integer typeId;
    private Integer parentId;
    private boolean hasChild = false;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
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

    public boolean isSame(SkClassTimeType obj) {
        if (this.getName() == null) return false;
        return this.getName().equalsIgnoreCase(obj.getName());
    }

    public boolean isHasChild() {
        return hasChild;
    }

    public void setHasChild(boolean hasChild) {
        this.hasChild = hasChild;
    }


}
