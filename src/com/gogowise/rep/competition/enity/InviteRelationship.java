package com.gogowise.rep.competition.enity;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.enity.BaseUser;

import javax.persistence.*;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-9-29
 * Time: 下午12:54
 * To change this template use File | Settings | File Templates.
 */
@Entity

public class InviteRelationship extends AbstractPersistence {


   @OneToOne
    private BaseUser inviter;        //我被邀请id
     @OneToOne
    private  BaseUser inviteder;
     @OneToOne
    private CompetitionSession competitionSessionId;
    /*getter and setter*/
    private  String invitedCode;


    public CompetitionSession getCompetitionSessionId() {
        return competitionSessionId;
    }

    public void setCompetitionSessionId(CompetitionSession competitionSessionId) {
        this.competitionSessionId = competitionSessionId;
    }

    public BaseUser getInviter() {
        return inviter;
    }

    public void setInviter(BaseUser inviter) {
        this.inviter = inviter;
    }

    public BaseUser getInviteder() {
        return inviteder;
    }

    public String getInvitedCode() {
        return invitedCode;
    }

    public void setInvitedCode(String invitedCode) {
        this.invitedCode = invitedCode;
    }

    @Override
    public String toString() {
        return "InviteRelationship{" +
                ", inviter=" + inviter.getId()+   "邀请"+
                ", inviteder=" + inviteder.getId() +  "参加"+
                ", competitionSessionId=" + competitionSessionId +
                '}';
    }

    public void setInviteder(BaseUser inviteder) {
        this.inviteder = inviteder;
    }



}
