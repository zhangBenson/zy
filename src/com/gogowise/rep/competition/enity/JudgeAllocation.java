package com.gogowise.rep.competition.enity;

import com.gogowise.common.utils.Constants;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
@DiscriminatorValue(Constants.TYPE_JUDGE_STRING)
public class JudgeAllocation extends Allocation implements Allocationable {
                 @ManyToOne
    private CompetitionSession competitionSession;
    public CompetitionSession getCompetitionSession() {
        return competitionSession;
    }

    public void setCompetitionSession(CompetitionSession competitionSession) {
        this.competitionSession = competitionSession;
    }
}
