package com.gogowise.dao.live;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.live.SeasonIncreasedShowFans;


public interface SeasonIncreasedShowFansDao extends ModelDao<SeasonIncreasedShowFans> {

    public SeasonIncreasedShowFans findByShowYearAndSeason(Integer showID, Integer year,Integer season);

}
