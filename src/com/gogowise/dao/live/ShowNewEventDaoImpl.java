package com.gogowise.dao.live;

import com.gogowise.dao.ModelDao;
import com.gogowise.dao.live.LiveChannelDao;
import com.gogowise.domain.Pagination;
import com.gogowise.domain.ShowNewEvent;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("showNewEventDao")
public class ShowNewEventDaoImpl extends ModelDao.ModelDaoImpl<ShowNewEvent> implements LiveChannelDao.ShowNewEventDao {
    public List<ShowNewEvent> findLatestNews(Pagination pagination) {
        String hql = "From ShowNewEvent sne order by sne.id desc";
        return this.find(hql,pagination);
    }

    public List<ShowNewEvent> findByShowID(Integer showID, Pagination pagination) {
        String hql = "From ShowNewEvent sne where sne.myShow.id=? order by sne.id desc";
        return this.find(hql,pagination,showID);
    }
}
