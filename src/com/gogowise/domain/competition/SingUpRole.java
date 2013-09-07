package com.gogowise.domain.competition;

import com.gogowise.domain.AbstractPersistence;

import javax.persistence.Entity;

@Entity
public class SingUpRole extends AbstractPersistence {
    public int role;
    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }


}
