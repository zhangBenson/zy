package com.gogowise.dao;

import com.gogowise.domain.LiveTrailer;
import com.gogowise.domain.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;



public interface LiveTrailerDao extends ModelDao<LiveTrailer>{

    public List<LiveTrailer> findByPublishTime(Pagination pagination);
}
