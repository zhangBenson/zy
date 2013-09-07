package com.gogowise.dao.live;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.Pagination;
import com.gogowise.domain.live.ShowNewEvent;

import java.util.List;

public interface ShowNewEventDao extends ModelDao<ShowNewEvent> {

    public List<ShowNewEvent> findLatestNews(Pagination pagination);

    public List<ShowNewEvent> findByShowID(Integer showID, Pagination pagination);
}
