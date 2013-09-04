package com.gogowise.dao.competition;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Benson
 * Date: 11-8-7
 * Time: 下午8:23
 * To change this template use File | Settings | File Templates.
 */
@Repository("competitionDao")
public class CompetitionDaoImpl extends ModelDao.ModelDaoImpl<Competition> implements CompetitionDao {


    private SingerAllocationDao singerAllocationDao;

     public Boolean findByCompetitionIdAndUserId(Integer cId, Integer userId) {
         if(userId == null) return  false;
         else return singerAllocationDao.findByCompetitionIdAndUserId(cId, userId)  ;
     }

    public void setSingerAllocationDao(SingerAllocationDao singerAllocationDao) {
        this.singerAllocationDao = singerAllocationDao;
    }

    public SingerAllocationDao getSingerAllocationDao() {
        return singerAllocationDao;
    }

    /**
     * Created by IntelliJ IDEA.
     * User: Benson
     * Date: 11-8-7
     * Time: 下午8:23
     * To change this template use File | Settings | File Templates.
     */
    public static interface SingerAllocationDao extends ModelDao<SingerAllocation> {
        public List<SingerAllocation> findByUserId(Integer id);

        public Boolean findByCompetitionIdAndUserId(Integer cId, Integer userId);
    }

    /**
     * Created by IntelliJ IDEA.
     * User: Benson
     * Date: 11-8-7
     * Time: 下午8:23
     * To change this template use File | Settings | File Templates.
     */
    public static interface SingUpDao extends ModelDao<SingUpInfo> {

        public SingUpInfo findSingUpInfoByUserId(Integer Id);

        public Map<String, String> findSessionByTypeForSelector(Integer competitionId, Integer type);

        public SingUpInfo findSingUpInfoByEmail(String email);

        public Competition findCompetitionById(Integer id);

        public BaseUser findUserById(Integer id);

        public CompetitionSession findSessionById(Integer id);

        public void persistAllocation(SingerAllocation sa);

        public boolean isAllocationByUserId(Integer userId, Integer competitionId);

        public List<SingUpInfo> findByPage(Pagination page);

        public List<CompetitionSession> findForcastByUser(Integer id, Pagination page);

        public List<CompetitionSession> findAgeByUser(Integer id, Pagination page);

        public void saveComments(Comments comments);

        public List<Comments> listAllComments(Integer userId);

        public List<CompetitionSession> findOngoing(Pagination page);

        public List<CompetitionSession> findForcast(Pagination page);

        public Integer logon(String email, String password);

        public BaseUser findUserByEmail(String email);

        public void persistAll(SingUpInfo singUpInfo);
    }

    public static interface SubjectDao extends ModelDao<Subject>{

    }
}
