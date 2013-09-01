package com.gogowise.domain;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
public class CompetitionPhase extends AbstractPersistence {
    private String name;
    @OneToOne
    private Competition competition;
    private Integer status;
    private Integer type;
    @Temporal(TemporalType.DATE)
    private Date startDate;
    @Temporal(TemporalType.DATE)
    private Date endDate;
    @OneToMany(mappedBy = "competitionPhase")
    private List<CompetitionSession> competitionSessions;


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Competition getCompetition() {
        return competition;
    }

    public void setCompetition(Competition competition) {
        this.competition = competition;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public List<CompetitionSession> getCompetitionSessions() {
        return competitionSessions;
    }

    public void setCompetitionSessions(List<CompetitionSession> competitionSessions) {
        this.competitionSessions = competitionSessions;
    }
}
