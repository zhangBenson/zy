package com.gogowise.repository.competition;

import java.util.List;

import com.gogowise.repository.ModelDao;
import com.gogowise.domain.competition.CompetitionPhase;

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
