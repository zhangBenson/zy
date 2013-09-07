package com.gogowise.rep.live;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.live.enity.LiveChannelNewEvent;
import com.gogowise.rep.Pagination;

import java.util.List;

public interface LiveChannelNewEventDao extends ModelDao<LiveChannelNewEvent> {

    public List<LiveChannelNewEvent> findLatestNews(Pagination pagination);
}
