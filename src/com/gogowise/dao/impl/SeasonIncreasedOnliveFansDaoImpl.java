package com.gogowise.dao.impl;

import com.gogowise.dao.SeasonIncreasedOnliveFansDao;
import com.gogowise.domain.SeasonIncreasedOnliveFans;
import com.gogowise.utils.Utils;
import org.springframework.stereotype.Repository;

import java.util.Calendar;

@Repository("seasonIncreasedOnliveFansDao")
public class SeasonIncreasedOnliveFansDaoImpl extends ModelDaoImpl<SeasonIncreasedOnliveFans> implements SeasonIncreasedOnliveFansDao {

    public SeasonIncreasedOnliveFans findByLiveAndCalendar(Integer liveID, Integer year ,Integer season) {
        String hql = "From SeasonIncreasedOnliveFans sisf where sisf.liveChannel.id=? and sisf.year=? and sisf.season=?";
        return this.findFist(hql,liveID,year,season);
    }
}
