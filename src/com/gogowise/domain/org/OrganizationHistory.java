package com.gogowise.domain.org;

import com.gogowise.domain.AbstractPersistence;
import com.gogowise.domain.user.BaseUser;

import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Entity
public class OrganizationHistory extends AbstractPersistence {
    @OneToOne
    private BaseUser responser;
     @OneToOne
    private BaseUser agent;
     @OneToOne
    private Organization organization;

    public BaseUser getResponser() {
        return responser;
    }

    public void setResponser(BaseUser responser) {
        this.responser = responser;
    }

    public BaseUser getAgent() {
        return agent;
    }

    public void setAgent(BaseUser agent) {
        this.agent = agent;
    }

    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }
}
