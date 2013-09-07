package com.gogowise.repository.live;


import com.gogowise.repository.ModelDaoImpl;
import com.gogowise.domain.live.SeasonIncreasedShowFans;
import org.springframework.stereotype.Repository;


import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-6-29
 * Time: 下午1:11
 * To change this template use File | Settings | File Templates.
 */
@Repository("seasonIncreasedShowFansDao")
public class SeasonIncreasedShowFansDaoImpl extends ModelDaoImpl<SeasonIncreasedShowFans> implements SeasonIncreasedShowFansDao{
    public SeasonIncreasedShowFans findByShowYearAndSeason(Integer showID, Integer year, Integer season) {
        String hql = "From SeasonIncreasedShowFans sisf where sisf.myShow.id=? and sisf.year=? and sisf.season=?";
        List<SeasonIncreasedShowFans> seasonIncreasedShowFansList = this.find(hql,showID,year,season);
        if(seasonIncreasedShowFansList.size() == 0){
            return null;
        }
        return seasonIncreasedShowFansList.get(0);
    }
}
