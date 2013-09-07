package com.gogowise.rep.system;

import com.gogowise.rep.ModelDao;
import com.gogowise.domain.system.GoGoWiseAnnounce;
import com.gogowise.domain.Pagination;

import java.util.List;


public interface GoGoWiseAnnounceDao extends ModelDao<GoGoWiseAnnounce> {

    public List<GoGoWiseAnnounce> findLatestAnnounce(Pagination pagination);
}
