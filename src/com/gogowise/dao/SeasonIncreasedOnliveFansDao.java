package com.gogowise.dao;

import com.gogowise.domain.SeasonIncreasedOnliveFans;

import java.util.Calendar;

public interface SeasonIncreasedOnliveFansDao extends ModelDao<SeasonIncreasedOnliveFans>{

    public SeasonIncreasedOnliveFans findByLiveAndCalendar(Integer liveID, Integer year ,Integer season);
}
