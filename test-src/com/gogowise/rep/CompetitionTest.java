package com.gogowise.rep;

import com.gogowise.rep.competition.*;
import com.gogowise.rep.competition.enity.*;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.common.utils.MD5;
import com.gogowise.common.utils.Utils;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;
import java.util.List;


public class CompetitionTest {

    private CompetitionPhaseDao competitionPhaseDao;
    private CompetitionDao competitionDao;
    private CompetitionSessionDao competitionSessionDao;
    private SubjectDao subjectDao;
    private BaseUserDao baseUserDao;
    private SingUpDao singUpDao;
    private SingUpInfo singUpInfo;
    private AllocationDao allocationDao;
    private CourseDao courseDao;

    @Before
    public void setUp() throws Exception {
        String[] config = new String[]{
                "applicationContext.xml"};

        ApplicationContext ctx = new ClassPathXmlApplicationContext(config);
        competitionPhaseDao = (CompetitionPhaseDao) ctx.getBean("competitionPhaseDao");
        competitionDao = (CompetitionDao) ctx.getBean("competitionDao");
        competitionSessionDao = (CompetitionSessionDao) ctx.getBean("competitionSessionDao");
        subjectDao = (SubjectDao) ctx.getBean("subjectDao");
        baseUserDao = (BaseUserDao) ctx.getBean("baseUserDao");
        singUpDao = (SingUpDao) ctx.getBean("singUpDao");
        allocationDao = (AllocationDao) ctx.getBean("allocationDao");
        courseDao = (CourseDao) ctx.getBean("courseDao");

    }

    @After
    public void tearDown() throws Exception {

    }


    @Test
    public void save() {

        Subject subject = new Subject();
        subject.setName("湖南大赛");
        List<Subject> ss = subjectDao.findByExample(subject);
        if (ss.size() > 0) {
            return;
        }
        for (int i = 0; i < 1; i++) {
            saveSingUp(i);
        }
        BaseUser bu = baseUserDao.findById(1);
        subject.setOwner(bu);
        subjectDao.persistAbstract(subject);
        Competition co = new Competition();
        co.setSubject(subject);
        co.setName("第一届");
        co.setStartDate(new Date());

        co.setEndDate(new Date());
        co.setPhone("12321421321");
        co.setSingUpEndDate(new Date());
        co.setSingUpEndDate(new Date());
        competitionDao.persistAbstract(co);
        CompetitionPhase ch = new CompetitionPhase();
        ch.setName("第一阶段");
        ch.setCompetition(co);
        ch.setType(1);
        competitionPhaseDao.persistAbstract(ch);
        saveSession(ch);
    }


    private void saveSession(CompetitionPhase ch) {
        CompetitionSession cs = new CompetitionSession();
        cs.setDate(Utils.getToday());
        cs.setStartTime(14.0);
        cs.setEndTime(18.0);
        HostAllocation h = new HostAllocation();
        h.setSingUpInfo(singUpInfo);
        cs.setHostAllocation(h);
        cs.setCompetitionPhase(ch);
        competitionSessionDao.saveAll(cs);
    }


    private void saveSingUp(int i) {
        SingUpInfo s = new SingUpInfo();
        s.setBlogUrl("blog url" + i);
        s.setDescription("你好吗？我现在GOOD" + i);
        s.setEnounce("加油");
//        s.setIdCard("dir card" + i);
        s.setCellPhone(Long.valueOf("13807482200"));
        BaseUser user = new BaseUser();
//        user.setUserId("zlhades" + i);
        user.setEmail("zlhades@hotmail.com");
        user.setUserName("张林");
        user.setNickName("Benson");
        user.setPassword(MD5.endCode("123"));
        user.setSexy(true);
        user.setLockedOut(false);

        baseUserDao.persistAbstract(user);
        s.setUser(user);

        singUpDao.persistAll(s);
        if (i == 0) {
            singUpInfo = s;
        }
        SingUpInfo newSignup = singUpDao.findById(s.getId());
    }

    @Test
    public void testLoad() {
        competitionPhaseDao.listByCompetitionId(1);
        singUpDao.findSessionByTypeForSelector(1, 1);
        competitionSessionDao.findById(1);
        allocationDao.find("from Allocation al where al.competitionSession.id = ?",1);
         competitionSessionDao.find("select  cs from CompetitionSession cs, Allocation al where cs.id = al.competitionSession.id and cs.id =?", 1);

    }
}
