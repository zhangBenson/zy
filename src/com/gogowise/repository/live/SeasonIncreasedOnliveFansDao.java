package com.gogowise.repository.live;

import com.gogowise.repository.ModelDao;
import com.gogowise.domain.live.SeasonIncreasedOnliveFans;

public interface SeasonIncreasedOnliveFansDao extends ModelDao<SeasonIncreasedOnliveFans> {

    public SeasonIncreasedOnliveFans findByLiveAndCalendar(Integer liveID, Integer year ,Integer season);
}
