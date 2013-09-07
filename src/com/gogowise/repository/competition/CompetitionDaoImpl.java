package com.gogowise.repository.competition;

import com.gogowise.repository.ModelDaoImpl;
import com.gogowise.domain.competition.Competition;
import org.springframework.stereotype.Repository;

/**
 * Created by IntelliJ IDEA.
 * User: Benson
 * Date: 11-8-7
 * Time: 下午8:23
 * To change this template use File | Settings | File Templates.
 */
@Repository("competitionDao")
public class CompetitionDaoImpl extends ModelDaoImpl<Competition> implements CompetitionDao {


    private SingerAllocationDao singerAllocationDao;

     public Boolean findByCompetitionIdAndUserId(Integer cId, Integer userId) {
         if(userId == null) return  false;
         else return singerAllocationDao.findByCompetitionIdAndUserId(cId, userId)  ;
     }

    public void setSingerAllocationDao(SingerAllocationDao singerAllocationDao) {
        this.singerAllocationDao = singerAllocationDao;
    }

    public SingerAllocationDao getSingerAllocationDao() {
        return singerAllocationDao;
    }
}
