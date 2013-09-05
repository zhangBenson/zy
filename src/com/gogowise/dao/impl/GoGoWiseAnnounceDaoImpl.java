package com.gogowise.dao.impl;

import com.gogowise.dao.GoGoWiseAnnounceDao;
import com.gogowise.dao.ModelDao;
import com.gogowise.domain.GoGoWiseAnnounce;
import com.gogowise.domain.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("goGoWiseAnnounceDao")
public class GoGoWiseAnnounceDaoImpl extends ModelDaoImpl<GoGoWiseAnnounce> implements GoGoWiseAnnounceDao{

    public List<GoGoWiseAnnounce> findLatestAnnounce(Pagination pagination) {
        String hql = "From GoGoWiseAnnounce gga order by gga.publishTime desc";
        return this.find(hql,pagination);
    }
}
