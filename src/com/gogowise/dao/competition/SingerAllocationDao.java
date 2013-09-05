package com.gogowise.dao.competition;

import java.util.List;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.SingerAllocation;

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
