package com.gogowise.domain.live;

import com.gogowise.domain.AbstractPersistence;
import com.gogowise.domain.user.BaseUser;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-7-16
 * Time: 上午10:52
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class MemberOfLiveChannel extends AbstractPersistence {
    @OneToOne
    private BaseUser member;
    private String  memberEmail;
    @ManyToOne
    private ChannelTerms channelTerms;
    private Integer type;
    private Boolean acceptInvite = false;
    public BaseUser getMember() {
        return member;
    }

    public void setMember(BaseUser member) {
        this.member = member;
    }

    public ChannelTerms getChannelTerms() {
        return channelTerms;
    }

    public void setChannelTerms(ChannelTerms channelTerms) {
        this.channelTerms = channelTerms;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getMemberEmail() {
        return memberEmail;
    }

    public void setMemberEmail(String memberEmail) {
        this.memberEmail = memberEmail;
    }

    public Boolean getAcceptInvite() {
        return acceptInvite;
    }

    public void setAcceptInvite(Boolean acceptInvite) {
        this.acceptInvite = acceptInvite;
    }
}
