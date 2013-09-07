package com.gogowise.rep.competition;

import java.util.List;

import com.gogowise.rep.ModelDaoImpl;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.gogowise.rep.competition.enity.CompetitionPhase;
import org.springframework.stereotype.Repository;

/**
 * Created by IntelliJ IDEA.
 * User: Benson
 * Date: 11-8-7
 * Time: 下午8:23
 * To change this template use File | Settings | File Templates.
 */
@Repository("competitionPhaseDao")
public class CompetitionPhaseDaoImpl extends ModelDaoImpl<CompetitionPhase> implements CompetitionPhaseDao {


    public List<CompetitionPhase> listByCompetitionId(int id) {
        DetachedCriteria criteria = DetachedCriteria.forClass(CompetitionPhase.class);
        criteria.add(Restrictions.eq("competition.id", id));
        return this.find(criteria);
    }
}
