package com.gogowise.rep.org.org;


import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.user.BaseUser;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import java.util.Calendar;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-5-13
 * Time: 下午10:12
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class OrgMaterial extends AbstractPersistence {
    @OneToOne
    private BaseUser provider;
    private String description;
    private Calendar provideTime;
    private String fullPath;
    private String sourceTitle;
    private Double fullSize = 0.0;
    @OneToOne
    private Organization organization;

    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    public String getSourceTitle() {
        return sourceTitle;
    }

    public void setSourceTitle(String sourceTitle) {
        this.sourceTitle = sourceTitle;
    }

    public String getFullPath() {

        return fullPath;
    }

    public void setFullPath(String fullPath) {
        this.fullPath = fullPath;
    }


    public String getDescription() {

        return description;
    }

    public Calendar getProvideTime() {
        return provideTime;
    }

    public void setProvideTime(Calendar provideTime) {
        this.provideTime = provideTime;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BaseUser getProvider() {

        return provider;
    }

    public void setProvider(BaseUser provider) {
        this.provider = provider;
    }

    public Double getFullSize() {
        return fullSize;
    }

    public void setFullSize(Double fullSize) {
        this.fullSize = fullSize;
    }
}
