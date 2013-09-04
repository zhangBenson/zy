package com.gogowise.dao.system;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.GoGoWiseAnnounce;
import com.gogowise.domain.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface GoGoWiseAnnounceDao extends ModelDao<GoGoWiseAnnounce> {

    public List<GoGoWiseAnnounce> findLatestAnnounce(Pagination pagination);

    @Repository("goGoWiseAnnounceDao")
    class GoGoWiseAnnounceDaoImpl extends ModelDaoImpl<GoGoWiseAnnounce> implements GoGoWiseAnnounceDao{

        public List<GoGoWiseAnnounce> findLatestAnnounce(Pagination pagination) {
            String hql = "From GoGoWiseAnnounce gga order by gga.publishTime desc";
            return this.find(hql,pagination);
        }
    }
}
