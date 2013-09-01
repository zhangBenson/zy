package com.gogowise.domain;

import com.gogowise.utils.Constants;

import javax.persistence.*;

@Entity
@DiscriminatorValue(Constants.TYPE_HOST_STRING)
public class HostAllocation extends Allocation implements Allocationable {
    @ManyToOne
    private CompetitionSession competitionSession;

    public CompetitionSession getCompetitionSession() {
        return competitionSession;
    }

    public void setCompetitionSession(CompetitionSession competitionSession) {
        this.competitionSession = competitionSession;
    }

}
