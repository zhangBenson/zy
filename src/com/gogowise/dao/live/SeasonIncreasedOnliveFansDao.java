package com.gogowise.dao.live;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.SeasonIncreasedOnliveFans;

import java.util.Calendar;

public interface SeasonIncreasedOnliveFansDao extends ModelDao<SeasonIncreasedOnliveFans> {

    public SeasonIncreasedOnliveFans findByLiveAndCalendar(Integer liveID, Integer year ,Integer season);
}
