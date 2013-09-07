package com.gogowise.repository.system;

import com.gogowise.repository.ModelDaoImpl;
import com.gogowise.domain.system.GoGoWiseAnnounce;
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
