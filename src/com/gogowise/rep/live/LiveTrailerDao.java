package com.gogowise.rep.live;

import com.gogowise.rep.ModelDao;
import com.gogowise.domain.live.LiveTrailer;
import com.gogowise.domain.Pagination;

import java.util.List;



public interface LiveTrailerDao extends ModelDao<LiveTrailer> {

    public List<LiveTrailer> findByPublishTime(Pagination pagination);
}
