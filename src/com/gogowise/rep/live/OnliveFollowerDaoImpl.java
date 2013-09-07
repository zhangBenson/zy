package com.gogowise.rep.live;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.live.enity.OnliveFollower;
import com.gogowise.rep.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("onliveFollowerDao")
public class OnliveFollowerDaoImpl extends ModelDaoImpl<OnliveFollower> implements OnliveFollowerDao{

    public OnliveFollower findByLiveAndUser(Integer onliveID, Integer userID) {
        String hql = "select onf From OnliveFollower onf where onf.liveChannel.id=? and onf.follower.id=?";
        return this.findFist(hql,onliveID,userID);
    }

    public List<OnliveFollower> findHottestOnlive(Pagination pagination) {
        String hql = "select distinct ofl from OnliveFollower ofl group by ofl.liveChannel.id order by count(ofl) desc";
        return this.find(hql,pagination);
    }

    public List<OnliveFollower> findByOnlive(Integer onliveID, Pagination pagination) {
        String hql = "From OnliveFollower ofl where ofl.liveChannel.id=? order by ofl.id desc";
        return this.find(hql,pagination,onliveID);
    }
}
