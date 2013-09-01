package com.gogowise.domain;


import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import java.util.Calendar;


@Entity
public class OrganizationComment extends AbstractPersistence {
    private String description;
    @ManyToOne
    private BaseUser commenter;

    @ManyToOne
    private Organization organization;

    @OneToOne
    private BaseUser toFriend;

    private Calendar createDate=Calendar.getInstance();

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BaseUser getCommenter() {
        return commenter;
    }

    public void setCommenter(BaseUser commenter) {
        this.commenter = commenter;
    }

    public BaseUser getToFriend() {
        return toFriend;
    }

    public void setToFriend(BaseUser toFriend) {
        this.toFriend = toFriend;
    }

    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    public Calendar getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Calendar createDate) {
        this.createDate = createDate;
    }
}
