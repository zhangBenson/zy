package com.gogowise.action.meeting;


import com.gogowise.action.BasicAction;
import com.gogowise.action.valueobject.*;
import com.gogowise.dao.org.OrgMeetingDao;
import com.gogowise.dao.org.OrgMeetingMemberDao;
import com.gogowise.dao.org.OrganizationDao;
import com.gogowise.dao.system.MatterDao;
import com.gogowise.dao.user.BaseUserDao;
import com.gogowise.domain.*;
import com.gogowise.utils.Constants;
import com.gogowise.utils.EmailUtil;
import com.gogowise.utils.MD5;
import com.gogowise.utils.Utils;
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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class OrgMeetingAction extends BasicAction{
    private BaseUserDao baseUserDao;
    private OrgMeetingDao orgMeetingDao;
    private OrgMeeting orgMeeting;
    private List<OrgMeeting> orgMeetings = new ArrayList<OrgMeeting>();
    private OrgMeetingMemberDao orgMeetingMemberDao;
    private List<String> memberEmails = new ArrayList<String>();
    private Map<Integer, String> orgs = new HashMap<Integer, String>();
    private OrganizationDao organizationDao;
    private Organization organization;
    private String email;
    private String initSeesionString;
    private String flashPatch;
    private MatterDao matterDao;

    @Action(value = "initOrgMeeting",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".initOrgMeeting"),
                                                  @Result(name = ERROR,type = Constants.RESULT_NAME_TILES,location = ".noRight")})
    public String initOrgMeeting(){
        Organization orgTmp = organizationDao.findMyOrg(this.getSessionUserId());
        if (orgTmp == null) return ERROR;
        orgs.put(orgTmp.getId(), orgTmp.getSchoolName());
        return SUCCESS;
    }

   @Action(value = "saveOrgMeeting",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "myfirstPage"}),
                                                 @Result(name = INPUT,type = Constants.RESULT_NAME_TILES,location = ".initOrgMeeting")})
    public String saveOrgMeeting(){
        Organization org = organizationDao.findById(this.getOrgMeeting().getOrganization().getId());
        if(org!=null){
            orgMeeting.setOrganization(org);
        }
        if(orgMeeting.getHostManEmail().equals(this.getSessionUserEmail())){
            BaseUser user =  baseUserDao .findById(this.getSessionUserId());
            orgMeeting.setHostMan(user);
        }
        orgMeetingDao.persistAbstract(orgMeeting);
        DateFormat dateFormat = new SimpleDateFormat(this.getText("dateformat.forclass"));
        Calendar startTime = Calendar.getInstance();
        startTime.setTime(orgMeeting.getStartTime().getTime());
        if(!orgMeeting.getHostManEmail().equals(this.getSessionUserEmail())){
            String serialNo=  this.getSessionNickName()+(new SimpleDateFormat("yyyyddMMHHmmssms").format(Calendar.getInstance().getTime()));
            Matter matter =new Matter(Calendar.getInstance(),serialNo,Matter.MATTER_ORGMEETING_HOSTMAN,baseUserDao.findByEmail(this.getSessionUserEmail()),MD5.endCode(orgMeeting.getHostManEmail()),orgMeeting.getHostManEmail(),null,null,null,orgMeeting,false);

            String href2hostMan = getBasePath()+ "/orgMeetingEmailConfirm.html?orgMeeting.id="+orgMeeting.getId()+"&orgMeeting.hostManEmail="+ MD5.endCode(orgMeeting.getHostManEmail())+"&user.email="+orgMeeting.getHostManEmail();
            EmailUtil.sendMail(orgMeeting.getHostManEmail(), this.getText("org.meeting.email.to.host.title", new String[]{org.getSchoolName()}), Constants.CSS + this.getText("org.meeting.email.to.host.content", new String[]{
                    orgMeeting.getHostManEmail(),
                    org.getSchoolName(),
                    org.getSchoolName(),
                    dateFormat.format(Utils.changeBaseOnTimeZone4Action(startTime).getTime()),
                    orgMeeting.getContent(),
                    href2hostMan,
                    href2hostMan,
                    orgMeeting.getHostManEmail()
            }), "text/html;charset=utf-8");
            matterDao.persistAbstract(matter);


        }
        for(String email : memberEmails){
            OrgMeetingMember orgMeetingMember = new OrgMeetingMember();
            orgMeetingMember.setOrgMeeting(orgMeeting);
            orgMeetingMember.setMemberEmail(email);
            if(email.equals(this.getSessionUserEmail())) {
                BaseUser u = baseUserDao.findById(this.getSessionUserId());
                orgMeetingMember.setMember(u);
                orgMeetingMember.setAccept(true);
            }
            orgMeetingMemberDao.persistAbstract(orgMeetingMember);
            String serialNo=  this.getSessionNickName()+(new SimpleDateFormat("yyyyddMMHHmmssms").format(Calendar.getInstance().getTime()));
            Matter matter =new Matter(Calendar.getInstance(),serialNo,Matter.MATTER_ORGMEETING,baseUserDao.findByEmail(this.getSessionUserEmail()),MD5.endCode(email),email,null,null,null,orgMeeting,false);


            String href2Member = getBasePath()+"/orgMeetingEmailConfirm.html?orgMeeting.id="+orgMeeting.getId()+"&email="+MD5.endCode(email)+"&user.email="+email;
            if(!email.equals(this.getSessionUserEmail())){
                 EmailUtil.sendMail(email,this.getText("org.meeting.email.to.member.title",new String[]{org.getSchoolName()}),Constants.CSS+this.getText("org.meeting.email.to.member.content",new String[]{
                    email,
                    org.getSchoolName(),
                    org.getSchoolName(),
                    dateFormat.format(startTime.getTime()),
                    orgMeeting.getContent(),
                    href2Member,
                    href2Member,
                    email
                 }),"text/html;charset=utf-8");
                matterDao.persistAbstract(matter);

            }
        }

        return SUCCESS;
    }

    @Action(value = "orgMeetingEmailConfirm",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "myfirstPage"})})
    public String orgMeetingEmailConfirm(){
        OrgMeeting _orgMeeting = orgMeetingDao.findById(this.getOrgMeeting().getId());
        BaseUser user = baseUserDao.findById(this.getSessionUserId());
        if(this.getOrgMeeting().getHostManEmail()!=null&&this.getOrgMeeting().getHostManEmail().equals(MD5.endCode(_orgMeeting.getHostManEmail()))){
            _orgMeeting.setHostMan(user);
            orgMeetingDao.persistAbstract(_orgMeeting);
        }else {
            List<OrgMeetingMember> orgMeetingMembers = orgMeetingMemberDao.findByMeeting(_orgMeeting.getId());
            for(OrgMeetingMember orgMeetingMember:orgMeetingMembers){
                if(MD5.endCode(orgMeetingMember.getMemberEmail()).equals(this.getEmail())){
                    orgMeetingMember.setMember(user);
                    orgMeetingMember.setAccept(true);
                    orgMeetingMemberDao.persistAbstract(orgMeetingMember);
                }
            }
        }
        return SUCCESS;
    }


   @Action(value = "startMeeting",results = {@Result(name = "one2one",type = Constants.RESULT_NAME_TILES,location = ".orgMeetingOne2one"),
                                               @Result(name = "one2two",type = Constants.RESULT_NAME_TILES,location = ".orgMeetingOne2two"),
                                               @Result(name = "one2three",type = Constants.RESULT_NAME_TILES,location = ".orgMeetingOne2three"),
                                               @Result(name = ERROR,type = Constants.RESULT_NAME_TILES,location = ".notExist")})
    public String startMeeting(){
       orgMeeting = orgMeetingDao.findById(this.getOrgMeeting().getId());
       BaseUser user = baseUserDao.findById(this.getSessionUserId());
       if(orgMeeting.getOrgMeetingMembers().size() == 1){
           ClassSession classSession = new ClassSession();
           classSession.initSessionWithMeeting(orgMeeting,user);
            XStream xstream = new XStream();
            xstream.alias("Session", ClassSession.class);
            OutputStream output = new ByteArrayOutputStream();
            xstream.marshal(classSession, new CompactWriter(new OutputStreamWriter(output)));
            this.setInitSeesionString(output.toString());
            if(orgMeeting.getHostMan()!=null && this.getSessionUserId() == orgMeeting.getHostMan().getId()){
               this.setFlashPatch("flash/Teacher_1_to_1.swf");
            }else {
                this.setFlashPatch("flash/Student_1_to_1.swf");
            }
            return "one2one";
       }else if(orgMeeting.getOrgMeetingMembers().size() == 2){
           if(orgMeeting.getHostMan()!=null && this.getSessionUserId() == orgMeeting.getHostMan().getId()){
               One2twoTeacherSession one2twoTeacherSession = new One2twoTeacherSession();
               one2twoTeacherSession.initSessionWithMeeting(orgMeeting,user);
               XStream xstream = new XStream();
               xstream.alias("Session", One2twoTeacherSession.class);
               OutputStream output = new ByteArrayOutputStream();
               xstream.marshal(one2twoTeacherSession, new CompactWriter(new OutputStreamWriter(output)));
               this.setInitSeesionString(output.toString());
               this.setFlashPatch("flash/Teacher_1_to_2.swf");
           }else {
               One2twoStudentSession one2twoStudentSession = new One2twoStudentSession();
               one2twoStudentSession.initSessionWithMeeting(orgMeeting,user,user.getEmail());
               XStream xstream = new XStream();
               xstream.alias("Session", One2twoStudentSession.class);
               OutputStream output = new ByteArrayOutputStream();
               xstream.marshal(one2twoStudentSession, new CompactWriter(new OutputStreamWriter(output)));
               this.setInitSeesionString(output.toString());
               this.setFlashPatch("flash/Student_1_to_2.swf");
           }
           return "one2two";
       }else if(orgMeeting.getOrgMeetingMembers().size() == 3){
           if(orgMeeting.getHostMan()!=null && this.getSessionUserId() == orgMeeting.getHostMan().getId()){
               One2threeTeacherSession one2threeTeacherSession = new One2threeTeacherSession();
               one2threeTeacherSession.initSessionWithMeeting(orgMeeting , user);
               XStream xstream = new XStream();
               xstream.alias("Session", One2threeTeacherSession.class);
               OutputStream output = new ByteArrayOutputStream();
               xstream.marshal(one2threeTeacherSession, new CompactWriter(new OutputStreamWriter(output)));
               this.setInitSeesionString(output.toString());
               this.setFlashPatch("flash/Teacher_1_to_3.swf");
           }else {
               One2threeStudentSession one2threeStudentSession = new One2threeStudentSession();
               one2threeStudentSession.initSessionWithMeeting(orgMeeting , user ,user.getEmail());
               XStream xstream = new XStream();
               xstream.alias("Session", One2threeStudentSession.class);
               OutputStream output = new ByteArrayOutputStream();
               xstream.marshal(one2threeStudentSession, new CompactWriter(new OutputStreamWriter(output)));
               this.setInitSeesionString(output.toString());
               this.setFlashPatch("flash/Student_1_to_3.swf");
           }
           return "one2three";
       }
       return ERROR;

    }



    //=============getter and setter ======================================


    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public OrgMeetingDao getOrgMeetingDao() {
        return orgMeetingDao;
    }

    public void setOrgMeetingDao(OrgMeetingDao orgMeetingDao) {
        this.orgMeetingDao = orgMeetingDao;
    }

    public OrgMeeting getOrgMeeting() {
        return orgMeeting;
    }

    public void setOrgMeeting(OrgMeeting orgMeeting) {
        this.orgMeeting = orgMeeting;
    }

    public List<OrgMeeting> getOrgMeetings() {
        return orgMeetings;
    }

    public void setOrgMeetings(List<OrgMeeting> orgMeetings) {
        this.orgMeetings = orgMeetings;
    }

    public OrgMeetingMemberDao getOrgMeetingMemberDao() {
        return orgMeetingMemberDao;
    }

    public void setOrgMeetingMemberDao(OrgMeetingMemberDao orgMeetingMemberDao) {
        this.orgMeetingMemberDao = orgMeetingMemberDao;
    }

    public List<String> getMemberEmails() {
        List<String> finalEmails = new ArrayList<String>();
        for (String email : memberEmails) {
            if (!email.equals("")) {
                finalEmails.add(email);
            }
        }
        return finalEmails;
    }

    public void setMemberEmails(List<String> memberEmails) {
        this.memberEmails = memberEmails;
    }

    public Map<Integer, String> getOrgs() {
        return orgs;
    }

    public void setOrgs(Map<Integer, String> orgs) {
        this.orgs = orgs;
    }

    public OrganizationDao getOrganizationDao() {
        return organizationDao;
    }

    public void setOrganizationDao(OrganizationDao organizationDao) {
        this.organizationDao = organizationDao;
    }

    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public MatterDao getMatterDao() {
        return matterDao;
    }

    public void setMatterDao(MatterDao matterDao) {
        this.matterDao = matterDao;
    }
}
