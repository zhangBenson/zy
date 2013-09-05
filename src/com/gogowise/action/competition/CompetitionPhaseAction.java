package com.gogowise.action.competition;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.CompetitionPhaseDao;
import com.gogowise.domain.CompetitionPhase;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class CompetitionPhaseAction extends BasicAction {


    /**
     *
     */
    private static final long serialVersionUID = -255534466390947024L;
    private CompetitionPhaseDao competitionPhaseDao;
    private List<CompetitionPhase> competitionPhases;
    private CompetitionPhase competitionPhase;
    private Integer competitionId;
    private Integer competitionPhaseId;

    public String init() throws Exception {
        if (this.competitionPhase != null && this.getCompetitionPhase().getId() != null) {
            competitionPhase = competitionPhaseDao.findById(this.getCompetitionPhase().getId());
        }

        return SUCCESS;
    }

    public String save() throws Exception {
        this.competitionPhaseDao.persistAbstract(this.getCompetitionPhase());
        return SUCCESS;
    }

    public String list() throws Exception {
        competitionId = 1;
        if (competitionId != 0)
            competitionPhases = competitionPhaseDao.listByCompetitionId(this.competitionId);
        return SUCCESS;
    }

    public String personalInfo() {
        competitionPhase = competitionPhaseDao.findById(this.competitionPhaseId);
        return SUCCESS;
    }
//==================================getter and setter


    public CompetitionPhase getCompetitionPhase() {
        return competitionPhase;
    }

    public void setCompetitionPhase(CompetitionPhase competitionPhase) {
        this.competitionPhase = competitionPhase;
    }

    public Integer getCompetitionPhaseId() {
        return competitionPhaseId;
    }

    public void setCompetitionPhaseId(Integer competitionPhaseId) {
        this.competitionPhaseId = competitionPhaseId;
    }

    public void setCompetitionPhaseDao(CompetitionPhaseDao competitionPhaseDao) {
        this.competitionPhaseDao = competitionPhaseDao;
    }

    public CompetitionPhaseDao getCompetitionPhaseDao() {
        return competitionPhaseDao;
    }

    public List<CompetitionPhase> getCompetitionPhases() {
        return competitionPhases;
    }

    public void setCompetitionPhases(List<CompetitionPhase> competitionPhases) {
        this.competitionPhases = competitionPhases;
    }

    public Integer getCompetitionId() {
        return competitionId;
    }

    public void setCompetitionId(Integer competitionId) {
        this.competitionId = competitionId;
    }
}
