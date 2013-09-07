package com.gogowise.rep.competition;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.competition.enity.HostAllocation;
import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Benson
 * Date: 11-8-7
 * Time: 下午8:23
 * To change this template use File | Settings | File Templates.
 */
@Repository("hostAllocationDao")
public class HostAllocationDaoImpl extends ModelDaoImpl<HostAllocation> implements HostAllocationDao {

    public Boolean findByCompetitionIdAndUserId(Integer cId, Integer userId) {
        Criteria c = this.createCriteria(HostAllocation.class);
        c.add(Restrictions.eq("singUpInfo.user.id", userId));
        c.add(Restrictions.eq("competitionSession.competitionPhase.competition.id", userId));
        c.setProjection(Projections.count("id"));
        List<Integer> i = c.list();
        return i.get(0) > 0;
    }

}
