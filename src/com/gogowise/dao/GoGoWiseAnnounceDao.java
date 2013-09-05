package com.gogowise.dao;

import com.gogowise.domain.GoGoWiseAnnounce;
import com.gogowise.domain.Pagination;

import java.util.List;


public interface GoGoWiseAnnounceDao extends ModelDao<GoGoWiseAnnounce>{

    public List<GoGoWiseAnnounce> findLatestAnnounce(Pagination pagination);
}
