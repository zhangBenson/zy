package com.gogowise.rep.live;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.live.live.LiveTrailer;
import com.gogowise.rep.Pagination;

import java.util.List;



public interface LiveTrailerDao extends ModelDao<LiveTrailer> {

    public List<LiveTrailer> findByPublishTime(Pagination pagination);
}
