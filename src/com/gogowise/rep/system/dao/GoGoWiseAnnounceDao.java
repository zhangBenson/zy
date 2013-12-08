package com.gogowise.rep.system.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.system.enity.GoGoWiseAnnounce;
import com.gogowise.rep.Pagination;

import java.util.List;


public interface GoGoWiseAnnounceDao extends ModelDao<GoGoWiseAnnounce> {

    public List<GoGoWiseAnnounce> findLatestAnnounce(Pagination pagination);
}
