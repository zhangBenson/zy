package com.gogowise.dao;

import com.gogowise.domain.LiveChannelNewEvent;
import com.gogowise.domain.Pagination;

import java.util.List;

public interface LiveChannelNewEventDao extends ModelDao<LiveChannelNewEvent>{

    public List<LiveChannelNewEvent> findLatestNews(Pagination pagination);
}
