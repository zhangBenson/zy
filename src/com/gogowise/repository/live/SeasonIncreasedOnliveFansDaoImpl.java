package com.gogowise.repository.live;

import com.gogowise.repository.ModelDaoImpl;
import com.gogowise.domain.live.SeasonIncreasedOnliveFans;
import org.springframework.stereotype.Repository;

@Repository("seasonIncreasedOnliveFansDao")
public class SeasonIncreasedOnliveFansDaoImpl extends ModelDaoImpl<SeasonIncreasedOnliveFans> implements SeasonIncreasedOnliveFansDao {

    public SeasonIncreasedOnliveFans findByLiveAndCalendar(Integer liveID, Integer year ,Integer season) {
        String hql = "From SeasonIncreasedOnliveFans sisf where sisf.liveChannel.id=? and sisf.year=? and sisf.season=?";
        return this.findFist(hql,liveID,year,season);
    }
}
