package com.gogowise.dao.impl;

import com.gogowise.dao.AllocationDao;
import com.gogowise.domain.Allocation;
import org.springframework.stereotype.Repository;

/**
 * Created by IntelliJ IDEA.
 * User: Benson
 * Date: 11-8-7
 * Time: 下午8:23
 * To change this template use File | Settings | File Templates.
 */
@Repository("allocationDao")
public class AllocationDaoImpl extends ModelDaoImpl<Allocation> implements AllocationDao {

    public Boolean findByCompetitionIdAndUserId(Integer cId, Integer userId) {
        return this.find("from Allocation sa where sa.singUpInfo.user.id =? and sa.competitionSession.competitionPhase.competition.id =?", userId, cId).size() > 0;
    }

}
