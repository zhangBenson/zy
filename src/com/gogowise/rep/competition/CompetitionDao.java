package com.gogowise.rep.competition;

import com.gogowise.rep.ModelDao;
import com.gogowise.domain.competition.Competition;

/**
 * Created by IntelliJ IDEA.
 * User: Benson
 * Date: 11-8-7
 * Time: 下午8:23
 * To change this template use File | Settings | File Templates.
 */
public interface CompetitionDao extends ModelDao<Competition> {
    public Boolean findByCompetitionIdAndUserId(Integer cId, Integer userId);
}
