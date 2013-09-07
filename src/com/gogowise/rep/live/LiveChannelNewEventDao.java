package com.gogowise.rep.live;

import com.gogowise.rep.ModelDao;
import com.gogowise.domain.live.LiveChannelNewEvent;
import com.gogowise.domain.Pagination;

import java.util.List;

public interface LiveChannelNewEventDao extends ModelDao<LiveChannelNewEvent> {

    public List<LiveChannelNewEvent> findLatestNews(Pagination pagination);
}
