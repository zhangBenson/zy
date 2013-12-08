package com.gogowise.action.competition;

import com.gogowise.action.BasicAction;
import com.gogowise.action.valueobject.Session;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.competition.CompetitionAudienceDao;
import com.gogowise.rep.competition.CompetitionSessionDao;
import com.gogowise.rep.user.dao.InviteRelationshipDao;
import com.gogowise.rep.competition.enity.CompetitionAudience;
import com.gogowise.rep.competition.enity.CompetitionSession;
import com.gogowise.rep.competition.enity.InviteRelationship;
import com.gogowise.rep.competition.enity.SingerAllocation;
import com.gogowise.common.utils.Constants;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.CompactWriter;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class CompetitionSessionAction extends BasicAction {

    /**
     *
     */
    private static final long serialVersionUID = 2637053226710240716L;
    private CompetitionSessionDao competitionSessionDao;
    private InviteRelationshipDao inviteRelationshipDao;
    private CompetitionAudienceDao competitionAudienceDao;


    private CompetitionSession competitionSession;
    private List<CompetitionSession> sessions = new ArrayList<CompetitionSession>();
    private Pagination pagination = new Pagination();
    private String initSeesionString;
    private String flashPatch;
    private boolean fromHost = false;
    private List<InviteRelationship> inviteRelationships = new ArrayList<InviteRelationship>();
    private List<CompetitionAudience> competitionAudiences = new ArrayList<CompetitionAudience>();

    public String init() {
        if (this.competitionSession.getId() != null) {
            competitionSession = competitionSessionDao.findById(this.competitionSession.getId());
        } else if (this.competitionSession.getCompetitionPhase() != null && this.competitionSession.getCompetitionPhase().getId() != null) {
            competitionSession = competitionSessionDao.createSessionWithPhase(this.competitionSession.getCompetitionPhase().getId());
        }
        for (int i = 0; i < 9 && competitionSession.getSingerAllocations().size() < Constants.MAX_SINGER_SIZE; i++) {
            SingerAllocation sa = new SingerAllocation();
            sa.setCompetitionSession(this.competitionSession);
            competitionSession.getSingerAllocations().add(sa);
        }
        return SUCCESS;
    }


    public String openSession() {
        this.init();
        Session session = new Session();
        initParty(session);

        XStream xstream = new XStream();
        xstream.alias("Session", Session.class);
        OutputStream output = new ByteArrayOutputStream();
        xstream.marshal(session, new CompactWriter(new OutputStreamWriter(output)));
        this.setInitSeesionString(output.toString());
        Integer type = session.getType();
        initFlashPath(type);
        return SUCCESS;
    }

    private void initFlashPath(Integer type) {
        if (type == Constants.TYPE_HOST) this.flashPatch = "flash/PartyMaster.swf";
        else if (type == null) this.flashPatch = "flash/PartyAnony.swf";
        else this.flashPatch = "flash/PartyGuest.swf";
    }

    private void initParty(Session session) {
        this.getCompetitionSession().setAllocationUserId(super.getSessionUserId());
        session.initWithPo(this.getCompetitionSession());
        session.setUserName(super.getSessionNickName());
        if (session.getType() == null && super.getSessionUserId() != null) {
            session.setType(4);
        }

    }

    public String partyMessage() {
        return SUCCESS;
    }

    @Action(value = "partyMessageOne2Three", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".partyMessageOne2Three")})
    public String partyMessageOne2Three() {
        return SUCCESS;
    }


    public String groupCompetition() throws Exception {
        return SUCCESS;
    }

    public String live() throws Exception {     //直播
        sessions = competitionSessionDao.findOngoing(pagination);
        return SUCCESS;
    }

    public String age() throws Exception {
        //花絮
        sessions = competitionSessionDao.findAge(pagination);
        return SUCCESS;
    }

    public String forcast() throws Exception {  //预告

        sessions = competitionSessionDao.findForcast(pagination);
        return SUCCESS;
    }

    public String mySession() throws Exception { //我的赛事

        sessions = competitionSessionDao.findForcastByUser(super.getSessionUserId(), pagination);
        for (int i = 0; i < sessions.size(); i++) {
            sessions.get(i).setAllocationUserId(super.getSessionUserId());
        }
        competitionAudiences = finalCompetitionAudience(competitionAudienceDao.findCompetitionByUserId(super.getSessionUserId(), pagination));
        return SUCCESS;
    }

    //    public String myInfoSession() throws Exception { //我的首页
//
//        inviteRelationships = inviteRelationshipDao.queryRelationByUserId(super.getSessionUserId(), pagination);
//
//        sessions = competitionSessionDao.findForcastByUser(super.getSessionUserId(), pagination);
//        for (int i = 0; i < sessions.size(); i++) {
//            sessions.get(i).setAllocationUserId(super.getSessionUserId());
//        }
//        competitionAudiences=finalCompetitionAudience(competitionAudienceDao.findCompetitionByUserId(super.getSessionUserId(),pagination));
//        return SUCCESS;
//    }
    private List<CompetitionAudience> finalCompetitionAudience(List<CompetitionAudience> competitionAudiences) { //filter the Competition which time is not fit
        List<CompetitionAudience> list = new ArrayList<CompetitionAudience>();
        Long current_time = System.currentTimeMillis();
        for (CompetitionAudience competitionAudience : competitionAudiences) {
            Double sys_time = competitionAudience.getCompetitionSession().getDate().getTime() + competitionAudience.getCompetitionSession().getEndTime() * 60 * 60 * 1000;
            if (current_time < sys_time) {
                list.add(competitionAudience);
            }
        }
        return list;
    }

    public String save() throws Exception { //创建栏目
        this.competitionSessionDao.saveAll(this.getCompetitionSession());
        return SUCCESS;
    }

    public CompetitionSessionDao getCompetitionSessionDao() {
        return competitionSessionDao;
    }

    public void setCompetitionSessionDao(CompetitionSessionDao competitionSessionDao) {
        this.competitionSessionDao = competitionSessionDao;
    }

    public CompetitionSession getCompetitionSession() {
        return competitionSession;
    }

    public void setCompetitionSession(CompetitionSession competitionSession) {
        this.competitionSession = competitionSession;
    }

    public List<CompetitionSession> getSessions() {
        return sessions;
    }

    public void setSessions(List<CompetitionSession> sessions) {
        this.sessions = sessions;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public String getInitSeesionString() {
        return initSeesionString;
    }

    public void setInitSeesionString(String initSeesionString) {
        this.initSeesionString = initSeesionString;
    }

    public String getFlashPatch() {
        return flashPatch;
    }

    public void setFlashPatch(String flashPatch) {
        this.flashPatch = flashPatch;
    }

    public boolean isFromHost() {
        return fromHost;
    }

    public void setFromHost(boolean fromHost) {
        this.fromHost = fromHost;
    }

    public InviteRelationshipDao getInviteRelationshipDao() {
        return inviteRelationshipDao;
    }

    public void setInviteRelationshipDao(InviteRelationshipDao inviteRelationshipDao) {
        this.inviteRelationshipDao = inviteRelationshipDao;
    }

    public List<InviteRelationship> getInviteRelationships() {
        return inviteRelationships;
    }

    public void setInviteRelationships(List<InviteRelationship> inviteRelationships) {
        this.inviteRelationships = inviteRelationships;
    }

    public CompetitionAudienceDao getCompetitionAudienceDao() {
        return competitionAudienceDao;
    }

    public void setCompetitionAudienceDao(CompetitionAudienceDao competitionAudienceDao) {
        this.competitionAudienceDao = competitionAudienceDao;
    }

    public List<CompetitionAudience> getCompetitionAudiences() {
        return competitionAudiences;
    }

    public void setCompetitionAudiences(List<CompetitionAudience> competitionAudiences) {
        this.competitionAudiences = competitionAudiences;
    }
}
