package com.gogowise.rep.competition.enity;


import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.enity.BaseUser;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import java.util.Date;

@Entity
public class CompetitionComments extends AbstractPersistence {
    @OneToOne
    private BaseUser owner;
    @OneToOne
    private BaseUser to;
    private Date date;
    private String description;
    private int mark;
    @OneToOne
    private CompetitionSession competitionSession;

    public BaseUser getOwner() {
        return owner;
    }

    public void setOwner(BaseUser owner) {
        this.owner = owner;
    }

    public BaseUser getTo() {
        return to;
    }

    public void setTo(BaseUser to) {
        this.to = to;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getMark() {
        return mark;
    }

    public void setMark(int mark) {
        this.mark = mark;
    }

    public CompetitionSession getCompetitionSession() {
        return competitionSession;
    }

    public void setCompetitionSession(CompetitionSession competitionSession) {
        this.competitionSession = competitionSession;
    }
}
