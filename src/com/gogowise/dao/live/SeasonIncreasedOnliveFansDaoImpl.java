package com.gogowise.dao.live;

import com.gogowise.dao.ModelDao;
import com.gogowise.dao.live.LiveChannelNewEventDao;
import com.gogowise.domain.SeasonIncreasedOnliveFans;
import org.springframework.stereotype.Repository;

@Repository("seasonIncreasedOnliveFansDao")
public class SeasonIncreasedOnliveFansDaoImpl extends ModelDao.ModelDaoImpl<SeasonIncreasedOnliveFans> implements LiveChannelNewEventDao.SeasonIncreasedOnliveFansDao {

    public SeasonIncreasedOnliveFans findByLiveAndCalendar(Integer liveID, Integer year ,Integer season) {
        String hql = "From SeasonIncreasedOnliveFans sisf where sisf.liveChannel.id=? and sisf.year=? and sisf.season=?";
        return this.findFist(hql,liveID,year,season);
    }
}
