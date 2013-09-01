package com.gogowise.domain;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class ClassType extends AbstractPersistence {
    private String name;
    @ManyToOne
    private ClassType parent ;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ClassType getParent() {
        return parent;
    }

    public void setParent(ClassType parent) {
        this.parent = parent;
    }
}
