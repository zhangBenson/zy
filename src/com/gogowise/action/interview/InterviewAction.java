package com.gogowise.action.interview;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.org.InterviewAppointerDao;
import com.gogowise.rep.org.InterviewDao;
import com.gogowise.rep.org.OrganizationDao;
import com.gogowise.rep.system.MatterDao;
import com.gogowise.rep.user.BaseUserDao;
import com.gogowise.rep.live.live.Matter;
import com.gogowise.rep.org.org.Interview;
import com.gogowise.rep.org.org.InterviewAppointer;
import com.gogowise.rep.org.org.Organization;
import com.gogowise.rep.user.user.BaseUser;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.EmailUtil;
import com.gogowise.common.utils.Utils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-4-1
 * Time: 上午10:34
 * To change this template use File | Settings | File Templates.
 */
@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)

public class InterviewAction extends BasicAction{
    private InterviewDao interviewDao;
    private Interview interview;
    private BaseUserDao baseUserDao;
    private BaseUser user;
    private OrganizationDao organizationDao;
    private String interviewerEmail;
    private List<String> intervieweeEmails = new ArrayList<String>();
    private InterviewAppointerDao interviewAppointerDao;
    private Integer identityType;    // 0 represent interviewer and 1 represent interviewee
    private MatterDao matterDao;



    @Action(value="saveInterview",results={@Result(name=SUCCESS,type= Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "myfirstPage"}),
                                             @Result(name = INPUT,type = Constants.RESULT_NAME_TILES,location = ".orgInterview")})
    public String saveInterview(){
        String matterSrialNo=this.getSessionNickName()+(new SimpleDateFormat("yyyyddMMHHmmssms").format(Calendar.getInstance().getTime()));
        Organization organization = organizationDao.findById(interview.getOrganization().getId());
        this.getInterview().setOrganization(organization);
        if(this.getInterview().getInterviewerEmail().equals(this.getSessionUserEmail())){
            BaseUser interviewer =  baseUserDao.findByEmail(this.getSessionUserEmail());
            this.getInterview().setInterviewer(interviewer);
        }
        interviewDao.persistAbstract(this.getInterview());

         DateFormat dateFormat = new SimpleDateFormat(this.getText("global.display.hour.minute"));
       // String stTime = dateFormat.format(this.getInterview().getStartTime().getTime());
         Calendar emailStartTime = Calendar.getInstance();

         emailStartTime.setTime(this.getInterview().getStartTime().getTime());
         String css = "<style type=\"text/css\">\n" +
                 "#rvmDiv #logoDiv { background-image: url(http://www.gogowise.com/images/logo.jpg); background-repeat: no-repeat; height: 65px; margin-left: 45px; }\n" +
                 "#rvmDiv #rvmcontentDiv ul .welcomeTittle { margin-left: 30px; }\n" +
                 "#rvmDiv { float: left; width: 100%; font-family: \"微软雅黑\", \"宋体\", \"Lucida Sans Unicode\", \"Lucida Grande\", sans-serif; }\n" +
                 "#logoDiv { float: left; width: 100%; }\n" +
                 "#rvmcontentDiv { float: left; width: 100%; }\n" +
                 "#rvmDiv #rvmcontentDiv ul li { list-style-type: none; }\n" +
                 "#rvmDiv #rvmcontentDiv .orangeWords { color: rgb(255,155,55); }\n" +
                 "#rvmDiv #rvmcontentDiv ul .lastWords { margin-top: 50px; }\n" +
                 "table, tr, td { border-collapse:collapse; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: #09F; border-right-color: #09F; border-bottom-color: #09F; border-left-color: #09F; }\n" +
                 "tr.odd { background-color:#CEFFFF; }\n" +
                 "</style>";

        //=====================邮件处理部分，to interviewer============================
        StringBuilder employees = new StringBuilder();
        for(String email : intervieweeEmails){
            employees.append(email+";");
        }
        if(!this.getSessionUserEmail().equals(this.getInterview().getInterviewerEmail())){


            Matter matter =new Matter(Calendar.getInstance(),matterSrialNo,Matter.MATTER_INTERVIEW_INTERVIEWER,baseUserDao.findByEmail(this.getSessionUserEmail()),null,this.getInterview().getInterviewerEmail(),null,this.getInterview(),null,null,false);
            matterDao.persistAbstract(matter);




        String href1 = getBasePath()+"/interviewEmailHandle.html?interview.id="+this.getInterview().getId()+"&identityType=0&user.email="+interview.getInterviewerEmail();
        EmailUtil.sendMail(this.getInterview().getInterviewerEmail(), this.getText("org.interviewer.email.title",new String[]{organization.getSchoolName()}), css+this.getText("org.interviewer.email.content",new String[]{
               organization.getSchoolName(),
               organization.getSchoolName(),
               dateFormat.format(Utils.changeBaseOnTimeZone4Action(emailStartTime).getTime()),
               interview.getContent(),
               employees.toString(),
               href1,href1,
               this.getInterview().getInterviewerEmail()
         }), "text/html;charset=utf-8");


        }
        //=====================邮件处理部分，to interviewee============================
         for(String email : intervieweeEmails){
             matterSrialNo=matterSrialNo+1;
             Matter matter =new Matter(Calendar.getInstance(),matterSrialNo,Matter.MATTER_INTERVIEW_INTERVIEWEE,baseUserDao.findByEmail(this.getSessionUserEmail()),null,email,null,this.getInterview(),null,null,false);
            matterDao.persistAbstract(matter);

             InterviewAppointer interviewAppointer = new InterviewAppointer();
             interviewAppointer.setInterview(this.getInterview());
             interviewAppointer.setIntervieweeEmail(email);
             interviewAppointerDao.persistAbstract(interviewAppointer);

             String href = getBasePath()+"/interviewEmailHandle.html?interview.id="+this.getInterview().getId()+"&identityType=1&user.email="+email;
             EmailUtil.sendMail(email,this.getText("org.interviewee.email.title",new String[]{organization.getSchoolName()}),css+this.getText("org.interviewee.email.content",new String[]{
                     organization.getSchoolName(),
                     organization.getSchoolName(),
                     dateFormat.format(emailStartTime.getTime()),
                     this.getInterview().getContent(),
                     href,href, email
             }),"text/html;charset=utf-8");


         }
        return SUCCESS;
    }

    @Action(value = "interviewEmailHandle",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "myfirstPage"})})
    public String interviewEmailHandle(){
        if(this.getIdentityType()== Constants.IDENTITY_TYPE_OF_INTERVIEWEE){     //interviewee's email handle
                 interview = interviewDao.findById(this.getInterview().getId());
                 BaseUser interviewee = baseUserDao.findByEmail(this.getUser().getEmail());
                 InterviewAppointer interviewAppointer = interviewAppointerDao.findByInterviewAndUser(interview.getId(),interviewee.getEmail());
                 if(interviewAppointer!=null){
                     interviewAppointer.setAccept(true);
                     interviewAppointer.setInterviewee(interviewee);
                     interviewAppointerDao.persistAbstract(interviewAppointer);
                 }
        } else if(this.getIdentityType()== Constants.IDENTITY_TYPE_OF_INTERVIEWER){
                 interview = interviewDao.findById(this.getInterview().getId());
                 BaseUser interviewer  = baseUserDao.findByEmail(this.getUser().getEmail());
                 interview.setInterviewer(interviewer);
                 interviewDao.persistAbstract(interview);
        }
        return SUCCESS;
    }

     public void validateSaveInterview(){

    }


    public InterviewDao getInterviewDao() {
        return interviewDao;
    }

    public void setInterviewDao(InterviewDao interviewDao) {
        this.interviewDao = interviewDao;
    }

    public Interview getInterview() {
        return interview;
    }

    public void setInterview(Interview interview) {
        this.interview = interview;
    }

    public OrganizationDao getOrganizationDao() {
        return organizationDao;
    }

    public void setOrganizationDao(OrganizationDao organizationDao) {
        this.organizationDao = organizationDao;
    }

    public String getInterviewerEmail() {
        return interviewerEmail;
    }

    public void setInterviewerEmail(String interviewerEmail) {
        this.interviewerEmail = interviewerEmail;
    }

    public List<String> getIntervieweeEmails() {
       List<String> finalEmails = new ArrayList<String>();
        for (String email : intervieweeEmails) {
            if (!email.equals("")) {
                finalEmails.add(email);
            }
        }
        return finalEmails;
    }

    public void setIntervieweeEmails(List<String> intervieweeEmails) {
        this.intervieweeEmails = intervieweeEmails;
    }

    public InterviewAppointerDao getInterviewAppointerDao() {
        return interviewAppointerDao;
    }

    public void setInterviewAppointerDao(InterviewAppointerDao interviewAppointerDao) {
        this.interviewAppointerDao = interviewAppointerDao;
    }

    public Integer getIdentityType() {
        return identityType;
    }

    public void setIdentityType(Integer identityType) {
        this.identityType = identityType;
    }

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public MatterDao getMatterDao() {
        return matterDao;
    }

    public void setMatterDao(MatterDao matterDao) {
        this.matterDao = matterDao;
    }
}
