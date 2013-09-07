package com.gogowise.rep.live;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.live.enity.ShowNewEvent;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("showNewEventDao")
public class ShowNewEventDaoImpl extends ModelDaoImpl<ShowNewEvent> implements ShowNewEventDao{
    public List<ShowNewEvent> findLatestNews(Pagination pagination) {
        String hql = "From ShowNewEvent sne order by sne.id desc";
        return this.find(hql,pagination);
    }

    public List<ShowNewEvent> findByShowID(Integer showID, Pagination pagination) {
        String hql = "From ShowNewEvent sne where sne.myShow.id=? order by sne.id desc";
        return this.find(hql,pagination,showID);
    }
}
