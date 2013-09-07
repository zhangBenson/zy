package com.gogowise.repository.live;

import com.gogowise.repository.ModelDao;
import com.gogowise.domain.live.SeasonIncreasedShowFans;


public interface SeasonIncreasedShowFansDao extends ModelDao<SeasonIncreasedShowFans> {

    public SeasonIncreasedShowFans findByShowYearAndSeason(Integer showID, Integer year,Integer season);

}
