package com.gogowise.rep.live;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.live.live.ShowNewEvent;

import java.util.List;

public interface ShowNewEventDao extends ModelDao<ShowNewEvent> {

    public List<ShowNewEvent> findLatestNews(Pagination pagination);

    public List<ShowNewEvent> findByShowID(Integer showID, Pagination pagination);
}
