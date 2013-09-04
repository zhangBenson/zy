package com.gogowise.dao.competition;

import java.util.List;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.JudgeAllocation;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.gogowise.domain.CompetitionPhase;
import org.springframework.stereotype.Repository;

/**
 * Created by IntelliJ IDEA.
 * User: Benson
 * Date: 11-8-7
 * Time: 下午8:23
 * To change this template use File | Settings | File Templates.
 */
@Repository("competitionPhaseDao")
public class CompetitionPhaseDaoImpl extends ModelDao.ModelDaoImpl<CompetitionPhase> implements CompetitionPhaseDao {


    public List<CompetitionPhase> listByCompetitionId(int id) {
        DetachedCriteria criteria = DetachedCriteria.forClass(CompetitionPhase.class);
        criteria.add(Restrictions.eq("competition.id", id));
        return this.find(criteria);
    }

    /**
     * Created by IntelliJ IDEA.
     * User: Benson
     * Date: 11-8-7
     * Time: 下午8:23
     * To change this template use File | Settings | File Templates.
     */
    public static interface JudgeAllocationDao extends ModelDao<JudgeAllocation> {

    }
}
