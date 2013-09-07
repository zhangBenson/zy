package com.gogowise.rep.competition.enity;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.common.utils.Constants;
import org.hibernate.annotations.DiscriminatorOptions;

import javax.persistence.*;

@Entity
@DiscriminatorOptions(force = true)
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "discriminator", discriminatorType = DiscriminatorType.INTEGER)
public class Allocation extends AbstractPersistence implements Allocationable {


    @OneToOne
    private SingUpInfo singUpInfo;
    private String comments;

    private Boolean confirmed = false;
    private String code;
    private Integer mark;


    @ManyToOne
    @JoinColumn(insertable = false, updatable = false)
    private CompetitionSession competitionSession;

    public CompetitionSession getCompetitionSession() {
        return competitionSession;
    }

    public void setCompetitionSession(CompetitionSession competitionSession) {
        this.competitionSession = competitionSession;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }


    public SingUpInfo getSingUpInfo() {
        return singUpInfo;
    }

    public void setSingUpInfo(SingUpInfo singUpInfo) {
        this.singUpInfo = singUpInfo;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }


    public Boolean getConfirmed() {
        return confirmed;
    }

    public void setConfirmed(Boolean confirmed) {
        this.confirmed = confirmed;
    }

    public boolean isAllocated() {
        return this.getSingUpInfo() != null && this.getSingUpInfo().getUser() != null
                && this.getSingUpInfo().getUser().getEmail() != null;
    }

    public Integer getMark() {
        return mark;
    }

    public void setMark(Integer mark) {
        this.mark = mark;
    }

    public void setEmail(String email) {
        if (confirmed) return;
        if (this.getSingUpInfo() != null && this.getSingUpInfo().getUser() != null) {
            this.getSingUpInfo().getUser().setEmail(email);
        } else {
            if (this.getSingUpInfo() == null) {
                this.setSingUpInfo(new SingUpInfo());
            }
            if (this.getSingUpInfo().getUser() == null) {
                this.getSingUpInfo().setUser(new BaseUser());
            }
            this.getSingUpInfo().getUser().setEmail(email);
        }
    }

    public String getEmail() {
        if (this.getSingUpInfo() != null && this.getSingUpInfo().getUser() != null) {
            return this.getSingUpInfo().getUser().getEmail();
        } else {
            return null;
        }
    }

    public Integer getUserId() {
        if (this.getSingUpInfo() == null) return null;
        return this.singUpInfo.getUser().getId();
    }

    public String getNickName() {
        if (this.getSingUpInfo() == null) return null;
        return this.getSingUpInfo().getUser().getNickName();
    }

    public Integer getAllocationType(){
        if ( this instanceof SingerAllocation) {
            return Constants.TYPE_SINGER;
        } else if(this instanceof  JudgeAllocation){
            return  Constants.TYPE_JUDGE;
        } else if (this instanceof  HostAllocation){
            return  Constants.TYPE_HOST;
        }
        return  null;
    }

}
