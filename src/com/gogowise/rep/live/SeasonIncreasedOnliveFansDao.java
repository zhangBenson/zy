package com.gogowise.rep.live;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.live.enity.SeasonIncreasedOnliveFans;

public interface SeasonIncreasedOnliveFansDao extends ModelDao<SeasonIncreasedOnliveFans> {

    public SeasonIncreasedOnliveFans findByLiveAndCalendar(Integer liveID, Integer year ,Integer season);
}
