package com.gogowise.dao.live;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.LiveTrailer;
import com.gogowise.domain.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;



public interface LiveTrailerDao extends ModelDao<LiveTrailer> {

    public List<LiveTrailer> findByPublishTime(Pagination pagination);
}
