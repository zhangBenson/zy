package com.gogowise.rep.org.enity;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.enity.BaseUser;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-4-19
 * Time: 上午11:04
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class OrgMeetingMember extends AbstractPersistence {
    @ManyToOne
    private OrgMeeting orgMeeting;
    @OneToOne
    private BaseUser member;
    private String memberEmail;
    private Boolean accept = false;

    public OrgMeeting getOrgMeeting() {
        return orgMeeting;
    }

    public void setOrgMeeting(OrgMeeting orgMeeting) {
        this.orgMeeting = orgMeeting;
    }

    public BaseUser getMember() {
        return member;
    }

    public void setMember(BaseUser member) {
        this.member = member;
    }

    public String getMemberEmail() {
        return memberEmail;
    }

    public void setMemberEmail(String memberEmail) {
        this.memberEmail = memberEmail;
    }

    public Boolean getAccept() {
        return accept;
    }

    public void setAccept(Boolean accept) {
        this.accept = accept;
    }
}
