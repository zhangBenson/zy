package com.gogowise.domain.org;

import com.gogowise.domain.AbstractPersistence;
import com.gogowise.domain.user.BaseUser;

import javax.persistence.Entity;
import javax.persistence.OneToOne;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-3
 * Time: 上午9:26
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class ChangeResponserHistory extends AbstractPersistence {
    @OneToOne
    private BaseUser currentResponser;
    @OneToOne
    private BaseUser newResponser;
    @OneToOne
    private Organization organization;

    private String effectiveCode;

    public BaseUser getCurrentResponser() {
        return currentResponser;
    }

    public void setCurrentResponser(BaseUser currentResponser) {
        this.currentResponser = currentResponser;
    }

    public BaseUser getNewResponser() {
        return newResponser;
    }

    public void setNewResponser(BaseUser newResponser) {
        this.newResponser = newResponser;
    }

    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    public String getEffectiveCode() {
        return effectiveCode;
    }

    public void setEffectiveCode(String effectiveCode) {
        this.effectiveCode = effectiveCode;
    }
}
