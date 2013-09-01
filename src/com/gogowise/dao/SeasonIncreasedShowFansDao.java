package com.gogowise.dao;

import com.gogowise.domain.SeasonIncreasedShowFans;


public interface SeasonIncreasedShowFansDao extends ModelDao<SeasonIncreasedShowFans>{

    public SeasonIncreasedShowFans findByShowYearAndSeason(Integer showID, Integer year,Integer season);

}
