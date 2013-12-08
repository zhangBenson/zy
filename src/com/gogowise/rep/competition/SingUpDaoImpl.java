package com.gogowise.rep.competition;

import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.dao.CommentsDao;
import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.competition.enity.Competition;
import com.gogowise.rep.competition.enity.CompetitionSession;
import com.gogowise.rep.competition.enity.SingUpInfo;
import com.gogowise.rep.competition.enity.SingerAllocation;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.user.enity.Comments;
import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("singUpDao")
public class SingUpDaoImpl extends ModelDaoImpl<SingUpInfo> implements SingUpDao {

    private CompetitionSessionDao competitionSessionDao;
    private CompetitionDao competitionDao;
    private BaseUserDao baseUserDao;
    private SingerAllocationDao singerAllocationDao;
    private CommentsDao commentsDao;

    public Integer logon(String email, String password) {
        return baseUserDao.logon(email, password).getId();
    }

    public BaseUser findUserByEmail(String email) {
        return baseUserDao.findByEmail(email);
    }

    public BaseUser findUserById(Integer id) {
        return baseUserDao.findById(id);
    }

    public CompetitionSession findSessionById(Integer id) {
        return competitionSessionDao.findById(id);
    }

    public boolean isAllocationByUserId(Integer userId, Integer competitionId) {
        List<SingerAllocation> sas = singerAllocationDao.findByUserId(userId);
        for (SingerAllocation sa : sas) {
            if (competitionId.equals(sa.getCompetitionSession().getCompetitionPhase().getCompetition().getId())) {
                return true;
            }
        }
        return false;
    }

    public void persistAllocation(SingerAllocation sa) {
        singerAllocationDao.persist(sa);
    }

    public void persistAll(SingUpInfo singUpInfo) {
        baseUserDao.persistAbstract(singUpInfo.getUser());
        super.persistAbstract(singUpInfo);
    }

    public List<CompetitionSession> findForcastByUser(Integer id, Pagination page) {
        return competitionSessionDao.findForcastByUser(id, page);
    }

    public List<CompetitionSession> findForcast(Pagination page) {
        return competitionSessionDao.findForcast(page);
    }

    public List<CompetitionSession> findOngoing(Pagination page) {
        return competitionSessionDao.findOngoing(page);
    }

    public List<CompetitionSession> findAgeByUser(Integer id, Pagination page) {
        return competitionSessionDao.findAgeByUser(id, page);
    }

    @SuppressWarnings("unchecked")
    public List<SingUpInfo> findByPage(Pagination page) {
        Criteria c = this.createCriteria(SingUpInfo.class).setMaxResults(page.getPageSize()).setFirstResult(page.getFirstRecord());
        Criteria ccount = this.createCriteria(SingUpInfo.class).setProjection(Projections.count("id"));
        List<SingUpInfo> ret = c.list();
        List<Long> count = ccount.list();
        page.setTotalSize(count.get(0));
        return ret;
    }

    public List<Comments> findCommentsByUser(Integer userId) {
        return commentsDao.find("select * from Comments c where c.to.id = ?", userId);
    }

    public SingUpInfo findSingUpInfoByUserId(Integer id) {
        List<SingUpInfo> singUpInfos = this.find("select su from SingUpInfo su  where su.user.id = ?", id);
        return singUpInfos.size() == 0 ? null : singUpInfos.get(0);
    }

    public SingUpInfo findSingUpInfoByEmail(String email) {
        List<SingUpInfo> singUpInfos = this.find("select su from SingUpInfo su  where su.user.email = ?", email);
        return singUpInfos.size() == 0 ? null : singUpInfos.get(0);
    }

    public Map<String, String> findSessionByTypeForSelector(Integer competitionId, Integer type) {
        Map<String, String> ret = new HashMap<String, String>();
//        List<CompetitionSession> cs = competitionSessionDao.find("select cs from CompetitionSession cs where cs.competitionPhase.type=? and cs.competitionPhase.competition.id=? and cs.singerAllocations.size <9", competitionId, type);
//        List<CompetitionSession> cs = competitionSessionDao.find("select cs from CompetitionSession cs where cs.competitionPhase.type=? and cs.competitionPhase.competition.id=? and cs.allocatedNumber<9", competitionId, type);
        List<CompetitionSession> cs = competitionSessionDao.find("select max(cs) from CompetitionSession cs join cs.singerAllocations sa where cs.competitionPhase.type=? and cs.competitionPhase.competition.id=? group by cs having count(sa.singUpInfo.id) < 9 ", competitionId, type);
        for (CompetitionSession competitionSession : cs) {
            String key = competitionSession.getId().toString();
            String value = competitionSession.getDisplayName();
//            String value = competitionSession.getName();
            ret.put(key, value);
        }
        return ret;
    }

    @SuppressWarnings("unchecked")
    public List<Comments> listComments(Integer userId, Pagination page) {
        Criteria c = this.createListCommentsCriteria(userId);
        c.setFirstResult(page.getFirstRecord()).setMaxResults(page.getPageSize());

        Criteria count = this.createListCommentsCriteria(userId);
        count.setProjection(Projections.count("id"));
        List<Long> countNumber = count.list();
        page.setTotalSize(countNumber.get(0));
        return c.list();
    }

    @SuppressWarnings("unchecked")
    public List<Comments> listAllComments(Integer userId) {
        Criteria c = this.createListCommentsCriteria(userId);
        return c.list();
    }

    private Criteria createListCommentsCriteria(Integer userId) {
        Criteria c = commentsDao.createCriteria(Comments.class);
        c.add(Restrictions.eq("to.id", userId));
        return c;
    }

    public void saveComments(Comments comments) {
        commentsDao.persistAbstract(comments);
    }

    public Competition findCompetitionById(Integer id) {
        return competitionDao.findById(id);
    }


    public CompetitionSessionDao getCompetitionSessionDao() {
        return competitionSessionDao;
    }

    public void setCompetitionSessionDao(CompetitionSessionDao competitionSessionDao) {
        this.competitionSessionDao = competitionSessionDao;
    }

    public void setCompetitionDao(CompetitionDao competitionDao) {
        this.competitionDao = competitionDao;
    }

    public CompetitionDao getCompetitionDao() {
        return competitionDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setSingerAllocationDao(SingerAllocationDao singerAllocationDao) {
        this.singerAllocationDao = singerAllocationDao;
    }

    public SingerAllocationDao getSingerAllocationDao() {
        return singerAllocationDao;
    }

    public void setCommentsDao(CommentsDao commentsDao) {
        this.commentsDao = commentsDao;
    }

    public CommentsDao getCommentsDao() {
        return commentsDao;
    }
}
