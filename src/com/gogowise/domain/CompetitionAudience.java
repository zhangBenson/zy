package com.gogowise.domain;

import javax.persistence.Entity;
import javax.persistence.OneToOne;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-10-17
 * Time: 下午3:29
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class CompetitionAudience extends  AbstractPersistence{
    @OneToOne
    private BaseUser audience;
    @OneToOne
    private CompetitionSession competitionSession;

    public CompetitionSession getCompetitionSession() {
        return competitionSession;
    }

    public void setCompetitionSession(CompetitionSession competitionSession) {
        this.competitionSession = competitionSession;
    }

    public BaseUser getAudience() {
        return audience;
    }

    public void setAudience(BaseUser audience) {
        this.audience = audience;
    }
}
