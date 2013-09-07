package com.gogowise.dao.live;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.live.LiveChannelNewEvent;
import com.gogowise.domain.Pagination;

import java.util.List;

public interface LiveChannelNewEventDao extends ModelDao<LiveChannelNewEvent> {

    public List<LiveChannelNewEvent> findLatestNews(Pagination pagination);
}
