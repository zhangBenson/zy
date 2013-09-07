package com.gogowise.rep.live;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.live.enity.SeasonIncreasedShowFans;


public interface SeasonIncreasedShowFansDao extends ModelDao<SeasonIncreasedShowFans> {

    public SeasonIncreasedShowFans findByShowYearAndSeason(Integer showID, Integer year,Integer season);

}
