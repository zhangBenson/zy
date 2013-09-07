package com.gogowise.repository.competition;

import com.gogowise.repository.ModelDaoImpl;
import com.gogowise.domain.competition.CompetitionAudience;
import com.gogowise.domain.Pagination;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-10-17
 * Time: 下午3:40
 * To change this template use File | Settings | File Templates.
 */
@Repository("competitionAudienceDao")
public class CompetitionAudienceDaoImpl extends ModelDaoImpl<CompetitionAudience> implements CompetitionAudienceDao{

    public List<CompetitionAudience> findCompetitionByUserId(Integer Uid, Pagination page) {
        return  this.find("From CompetitionAudience ca where ca.audience.id=?", Uid);
    }

    public void saveCompetitionAudience(CompetitionAudience competitionAudience) {
        this.persistAbstract(competitionAudience);
    }

    public CompetitionAudience findCompetitionAudienceByUserIdCid(Integer Uid, Integer Cid) {
        List<CompetitionAudience> competitionAudiences = new ArrayList<CompetitionAudience>();
        competitionAudiences = this.find("From CompetitionAudience ca where ca.audience.id=? and ca.competitionSession.id=?",Uid,Cid);
       if(competitionAudiences==null||competitionAudiences.size()==0){
           return null;
       }
        return competitionAudiences.get(0);
    }
}
