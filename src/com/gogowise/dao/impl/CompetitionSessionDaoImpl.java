package com.gogowise.dao.impl;

import com.gogowise.dao.*;
import com.gogowise.domain.*;
import com.gogowise.utils.Utils;
import org.hibernate.Criteria;
import org.hibernate.criterion.*;
import org.hibernate.sql.JoinType;
import org.springframework.stereotype.Repository;

import java.util.Calendar;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Benson
 * Date: 11-8-7
 * Time: 下午8:23
 * To change this template use File | Settings | File Templates.
 */
@Repository("competitionSessionDao")
public class CompetitionSessionDaoImpl extends ModelDaoImpl<CompetitionSession> implements CompetitionSessionDao {
    private CompetitionPhaseDao competitionPhaseDao;
    private HostAllocationDao hostAllocationDao;
    private JudgeAllocationDao judgeAllocationDao;
    private SingerAllocationDao singerAllocationDao;
    private SingUpDao singUpDao;
    private BaseUserDao baseUserDao;


    public CompetitionSession createSessionWithPhase(Integer id) {
        CompetitionSession cs = new CompetitionSession();
        cs.setCompetitionPhase(competitionPhaseDao.findById(id));
        return cs;
    }

    private void copyForSave(CompetitionSession vo, CompetitionSession po) {
        po.setDate(vo.getDate());
        po.setStartTime(vo.getStartTime());
        po.setEndTime(vo.getEndTime());
        po.setName(vo.getName());
        po.setCompetitionPhase(vo.getCompetitionPhase());

        po.initAllocation();

        po.getHostAllocation().setSingUpInfo(this.getOrCreateSingUpInfo(vo.getHostAllocation().getEmail()));

        int i = 0;
        for (SingerAllocation sa : vo.getSingerAllocations()) {
            po.getSingerAllocations().get(i).setSingUpInfo(this.getOrCreateSingUpInfo(sa.getEmail()));
            i++;
        }

        int j = 0;
        for (JudgeAllocation ja : vo.getJudgeAllocations()) {
            po.getJudgeAllocations().get(j).setSingUpInfo(singUpDao.findSingUpInfoByEmail(ja.getEmail()));
            j++;
        }

    }

    private SingUpInfo getOrCreateSingUpInfo(String email) {
        SingUpInfo singUpInfo = singUpDao.findSingUpInfoByEmail(email);
        if (singUpInfo != null) return singUpInfo;

        BaseUser bs = baseUserDao.findByEmail(email);
        if (bs == null) return null;
        else {
            singUpInfo = new SingUpInfo();
            singUpInfo.setUser(bs);
            singUpDao.persistAll(singUpInfo);
            return singUpInfo;
        }
    }


    public void saveAll(CompetitionSession competitionSession) {
        CompetitionSession sessionForSave;
        if (competitionSession.getId() != null) {
            sessionForSave = this.findById(competitionSession.getId());
        } else {
            sessionForSave = new CompetitionSession();
        }
        copyForSave(competitionSession, sessionForSave);

//        SimpleDateFormat bartDateFormat = new SimpleDateFormat("MMMMdd");
//        String name = bartDateFormat.format(sessionForSave.getDate()) + "日" + sessionForSave.getStartTime() + "点到" + sessionForSave.getEndTime() + "点场";
//        sessionForSave.setName(name);
        this.persist(sessionForSave);
    }

    @SuppressWarnings("unchecked")
    public List<CompetitionSession> findOngoing(Pagination page) {
        Criteria count = createOngoinCriteria().setProjection(Projections.count("id"));
        List<Long> countNumber = count.list();
        page.setTotalSize(countNumber.get(0));

        Criteria c = createOngoinCriteria();
        c.setFirstResult(page.getFirstRecord()).setMaxResults(page.getPageSize());
        c.addOrder(Order.desc("startTime"));
        return c.list();
    }


    @SuppressWarnings("unchecked")
    public List<CompetitionSession> findAge(Pagination page) {
        Criteria c = createAgeCriteria();
        c.setFirstResult(page.getFirstRecord()).setMaxResults(page.getPageSize());
        c.addOrder(Order.desc("startTime"));

        Criteria count = createAgeCriteria().setProjection(Projections.count("id"));
        List<Long> countNumber = count.list();
        page.setTotalSize(countNumber.get(0));

        return c.list();
    }
    
    @SuppressWarnings("unchecked")
    public List<CompetitionSession> findForcast(Pagination page) {
        Criteria c = createForcastCriteria();
        c.setFirstResult(page.getFirstRecord()).setMaxResults(page.getPageSize());
        c.addOrder(Order.desc("startTime"));

        Criteria count = createForcastCriteria().setProjection(Projections.count("id"));
        List<Long> countNumber = count.list();
        page.setTotalSize(countNumber.get(0));

        return c.list();
    }

    @SuppressWarnings("unchecked")
    public List<CompetitionSession> findForcastByUser(Integer id, Pagination page) {
        Criteria c = createMyForcastCriteria(id);
        c.setFirstResult(page.getFirstRecord()).setMaxResults(page.getPageSize());
        c.addOrder(Order.desc("startTime"));

        Criteria count = createMyForcastCriteria(id).setProjection(Projections.count("id"));
        List<Long> countNumber = count.list();
        page.setTotalSize(countNumber.get(0));

        return c.list();
    }
    @SuppressWarnings("unchecked")
    public List<CompetitionSession> findAgeByUser(Integer id, Pagination page) {
        Criteria c = createMyAgeCriteria(id);
        c.setFirstResult(page.getFirstRecord()).setMaxResults(page.getPageSize());
        c.addOrder(Order.desc("startTime"));

        Criteria count = createMyAgeCriteria(id).setProjection(Projections.count("id"));
        List<Long> countNumber = count.list();
        page.setTotalSize(countNumber.get(0));

        return c.list();
    }

    private Criteria createMyAgeCriteria(Integer id) {
        Criteria c = this.createAgeCriteria();
        c.createAlias("singerAllocations", "c",  JoinType.LEFT_OUTER_JOIN);
        c.createAlias("c.singUpInfo", "s",  JoinType.LEFT_OUTER_JOIN);
        c.createAlias("s.user", "u",  JoinType.LEFT_OUTER_JOIN);
        c.add(Property.forName("u.id").eq(id));
        return c;
    }

    private Criteria createMyForcastCriteria(Integer id) {
        Criteria c = this.createForcastCriteria();
        c.createAlias("allAllocations", "c",  JoinType.LEFT_OUTER_JOIN);
        c.createAlias("c.singUpInfo", "s",  JoinType.LEFT_OUTER_JOIN);
        c.createAlias("s.user", "u",  JoinType.LEFT_OUTER_JOIN);
        c.add(Property.forName("u.id").eq(id));
        return c;
    }

    private Criteria createForcastCriteria() {
        Calendar start = Calendar.getInstance();
        Criteria dc = this.getSession().createCriteria(CompetitionSession.class);

        SimpleExpression eqDate = Restrictions.gt("date", Utils.getToday());

        SimpleExpression time = Restrictions.ge("startTime", start.get(Calendar.HOUR_OF_DAY) + start.get(Calendar.MINUTE) / 60.);
        SimpleExpression date = Restrictions.eq("date", Utils.getToday());
        LogicalExpression andExp = Restrictions.and(time, date);
        LogicalExpression orExp = Restrictions.or(eqDate, andExp);
        dc.add(orExp);
        return dc;
    }

    private Criteria createOngoinCriteria() {
        Calendar start = Calendar.getInstance();
        start.add(Calendar.MINUTE, 10);
        Calendar end = Calendar.getInstance();
        Criteria dc = this.getSession().createCriteria(CompetitionSession.class);
        dc.add(Restrictions.eq("date", Utils.getToday()));

        dc.add(Restrictions.lt("startTime", start.get(Calendar.HOUR_OF_DAY) + start.get(Calendar.MINUTE) / 60.))
                .add(Restrictions.ge("endTime", end.get(Calendar.HOUR_OF_DAY) + end.get(Calendar.MINUTE) / 60.));

        return dc;
    }

    private Criteria createAgeCriteria() {
        Calendar end = Calendar.getInstance();
        Criteria dc = this.getSession().createCriteria(CompetitionSession.class);
        SimpleExpression eqDate = Restrictions.lt("date", Utils.getToday());

        SimpleExpression time = Restrictions.le("endTime", end.get(Calendar.HOUR_OF_DAY) + end.get(Calendar.MINUTE) / 60.);
        SimpleExpression date = Restrictions.eq("date", Utils.getToday());
        LogicalExpression andExp = Restrictions.and(time, date);
        LogicalExpression orExp = Restrictions.or(eqDate, andExp);
        dc.add(orExp);
        return dc;
    }


    public CompetitionPhaseDao getCompetitionPhaseDao() {
        return competitionPhaseDao;
    }

    public void setCompetitionPhaseDao(CompetitionPhaseDao competitionPhaseDao) {
        this.competitionPhaseDao = competitionPhaseDao;
    }

    public HostAllocationDao getHostAllocationDao() {
        return hostAllocationDao;
    }

    public void setHostAllocationDao(HostAllocationDao hostAllocationDao) {
        this.hostAllocationDao = hostAllocationDao;
    }

    public JudgeAllocationDao getJudgeAllocationDao() {
        return judgeAllocationDao;
    }

    public void setJudgeAllocationDao(JudgeAllocationDao judgeAllocationDao) {
        this.judgeAllocationDao = judgeAllocationDao;
    }

    public SingerAllocationDao getSingerAllocationDao() {
        return singerAllocationDao;
    }

    public void setSingerAllocationDao(SingerAllocationDao singerAllocationDao) {
        this.singerAllocationDao = singerAllocationDao;
    }

    public SingUpDao getSingUpDao() {
        return singUpDao;
    }

    public void setSingUpDao(SingUpDao singUpDao) {
        this.singUpDao = singUpDao;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }
}
