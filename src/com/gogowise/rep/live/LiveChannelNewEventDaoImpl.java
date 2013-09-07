package com.gogowise.rep.live;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.live.live.LiveChannelNewEvent;
import com.gogowise.rep.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("liveChannelNewEventDao")
public class LiveChannelNewEventDaoImpl extends ModelDaoImpl<LiveChannelNewEvent> implements LiveChannelNewEventDao{

    public List<LiveChannelNewEvent> findLatestNews(Pagination pagination) {
        String hql = "From LiveChannelNewEvent lcne order by lcne.id desc";
        return this.find(hql,pagination);
    }
}
