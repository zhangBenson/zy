package com.gogowise.action.interview;

import com.gogowise.action.BasicAction;
import com.gogowise.action.valueobject.InterviewCandidatureSession;
import com.gogowise.action.valueobject.InterviewMasterSession;
import com.gogowise.dao.org.ChangeResponserHistoryDao;
import com.gogowise.dao.user.BaseUserDao;
import com.gogowise.domain.Interview;
import com.gogowise.domain.Pagination;
import com.gogowise.utils.Constants;
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

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-4-3
 * Time: 下午1:15
 * To change this template use File | Settings | File Templates.
 */

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class DataInteractSessionAction extends BasicAction{
    private BaseUserDao baseUserDao;
    private ChangeResponserHistoryDao.InterviewDao interviewDao;
    private Interview interview;
    private Pagination page;
    private String initSeesionString;
    private String flashPatch;
    private Integer roleType;

    @Action(value = "interviewVideo",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".interviewVideo")})
    public String InterviewVideo(){
        interview = interviewDao.findById(this.getInterview().getId());
        if(interview.getInterviewer() != null&&this.getSessionUserId() == interview.getInterviewer().getId()){
            InterviewMasterSession interviewMasterSession = new InterviewMasterSession();
            interviewMasterSession.initWithSession(interview);
            interviewMasterSession.setUserID(this.getSessionUserId());
            interviewMasterSession.setUserName(this.getSessionNickName());

            XStream xstream = new XStream();
            xstream.alias("Session", InterviewMasterSession.class);
            OutputStream output = new ByteArrayOutputStream();
            xstream.marshal(interviewMasterSession, new CompactWriter(new OutputStreamWriter(output)));
            this.setInitSeesionString(output.toString());
            this.setFlashPatch("flash/Interview_Master.swf");
            this.setRoleType(1);
        }else {
            InterviewCandidatureSession interviewCandidatureSession = new InterviewCandidatureSession();
            interviewCandidatureSession.initWithSession(interview);
            interviewCandidatureSession.setUserID(this.getSessionUserId());
            interviewCandidatureSession.setUserName(this.getSessionNickName());
            XStream xstream = new XStream();
            xstream.alias("Session", InterviewCandidatureSession.class);
            OutputStream output = new ByteArrayOutputStream();
            xstream.marshal(interviewCandidatureSession, new CompactWriter(new OutputStreamWriter(output)));
            this.setInitSeesionString(output.toString());
            this.setFlashPatch("flash/Interview_Candidature.swf");
        }
        return SUCCESS;
    }



    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public ChangeResponserHistoryDao.InterviewDao getInterviewDao() {
        return interviewDao;
    }

    public void setInterviewDao(ChangeResponserHistoryDao.InterviewDao interviewDao) {
        this.interviewDao = interviewDao;
    }

    public Interview getInterview() {
        return interview;
    }

    public void setInterview(Interview interview) {
        this.interview = interview;
    }

    public Pagination getPage() {
        return page;
    }

    public void setPage(Pagination page) {
        this.page = page;
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

    public Integer getRoleType() {
        return roleType;
    }

    public void setRoleType(Integer roleType) {
        this.roleType = roleType;
    }
}
