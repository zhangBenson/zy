package com.gogowise.dao.competition;

import java.util.List;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.CompetitionPhase;

/**
 * Created by IntelliJ IDEA.
 * User: Benson
 * Date: 11-8-7
 * Time: 下午8:23
 * To change this template use File | Settings | File Templates.
 */
public interface CompetitionPhaseDao extends ModelDao<CompetitionPhase> {
       public List<CompetitionPhase> listByCompetitionId(int id ) ;
}
