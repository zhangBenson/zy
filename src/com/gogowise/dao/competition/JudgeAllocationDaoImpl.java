package com.gogowise.dao.competition;

import com.gogowise.dao.ModelDao;
import com.gogowise.dao.competition.CompetitionPhaseDaoImpl;
import com.gogowise.domain.JudgeAllocation;
import org.springframework.stereotype.Repository;

/**
 * Created by IntelliJ IDEA.
 * User: Benson
 * Date: 11-8-7
 * Time: 下午8:23
 * To change this template use File | Settings | File Templates.
 */
 @Repository("judgeAllocationDao")
public class JudgeAllocationDaoImpl extends ModelDao.ModelDaoImpl<JudgeAllocation> implements CompetitionPhaseDaoImpl.JudgeAllocationDao {


}
