package com.gogowise.rep.competition;

import java.util.List;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.competition.enity.SingerAllocation;

/**
 * Created by IntelliJ IDEA.
 * User: Benson
 * Date: 11-8-7
 * Time: 下午8:23
 * To change this template use File | Settings | File Templates.
 */
public interface SingerAllocationDao extends ModelDao<SingerAllocation> {
    public List<SingerAllocation> findByUserId(Integer id);

    public Boolean findByCompetitionIdAndUserId(Integer cId, Integer userId);
}
