package com.gogowise.rep.system;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.system.system.GoGoWiseAnnounce;
import com.gogowise.rep.Pagination;

import java.util.List;


public interface GoGoWiseAnnounceDao extends ModelDao<GoGoWiseAnnounce> {

    public List<GoGoWiseAnnounce> findLatestAnnounce(Pagination pagination);
}
