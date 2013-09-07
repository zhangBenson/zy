package com.gogowise.repository.live;

import com.gogowise.repository.ModelDaoImpl;
import com.gogowise.domain.Pagination;
import com.gogowise.domain.live.ShowFans;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository("showFansDao")
public class ShowFansDaoImpl extends ModelDaoImpl<ShowFans> implements ShowFansDao {
    public List<ShowFans> findByShow(Integer showId, Pagination pagination) {
        String hql = "From ShowFans sf where sf.myShow.id = ?";
        return this.find(hql,pagination,showId);
    }

    public ShowFans findByUserAndShow(Integer userID, Integer showID) {
        String hql = "From ShowFans sf where sf.fan.id=? and sf.myShow.id = ?";
        return this.findFist(hql,userID,showID);
    }
}
