package com.gogowise.repository.system;

import com.gogowise.repository.ModelDao;
import com.gogowise.domain.system.GoGoWiseAnnounce;
import com.gogowise.domain.Pagination;

import java.util.List;


public interface GoGoWiseAnnounceDao extends ModelDao<GoGoWiseAnnounce> {

    public List<GoGoWiseAnnounce> findLatestAnnounce(Pagination pagination);
}
