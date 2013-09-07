package com.gogowise.action.show;

import com.gogowise.action.BasicAction;
import com.gogowise.action.valueobject.One2ManyStudentSession;
import com.gogowise.action.valueobject.One2ManyTeacherSession;
import com.gogowise.rep.user.BaseUserDao;
import com.gogowise.rep.live.MyShowDao;
import com.gogowise.rep.live.SeasonIncreasedShowFansDao;
import com.gogowise.rep.live.ShowTermsDao;
import com.gogowise.rep.user.user.BaseUser;
import com.gogowise.rep.live.live.MyShow;
import com.gogowise.rep.live.live.SeasonIncreasedShowFans;
import com.gogowise.rep.live.live.ShowTerms;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.Utils;
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
import java.util.Calendar;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class ShowVideoSessionAction extends BasicAction{
    private MyShow myShow;
    private MyShowDao myShowDao;
    private ShowTerms showTerms;
    private ShowTermsDao showTermsDao;
    private SeasonIncreasedShowFansDao seasonIncreasedShowFansDao;
    private BaseUser baseUser;
    private BaseUserDao baseUserDao;
    private String initSeesionString;
    private String flashPatch;
    private Integer roleType;

    @Action(value = "startShow",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".startShow")})
    public String startShow(){
        showTerms = showTermsDao.findById(this.getShowTerms().getId());
        myShow = showTerms.getMyShow();
        myShow.setTotalInviteNum((myShow.getTotalInviteNum()==null ?0:myShow.getTotalInviteNum())+1);
        myShowDao.persistAbstract(myShow);

         SeasonIncreasedShowFans sisf = seasonIncreasedShowFansDao.findByShowYearAndSeason(myShow.getId(), Utils.getCurrentCalender().get(Calendar.YEAR),Utils.getSeasonOfYear(Utils.getCurrentCalender().get(Calendar.MONTH)));
        if(sisf != null){
            sisf.setInviteNum(sisf.getInviteNum()+1);
            seasonIncreasedShowFansDao.persistAbstract(sisf);
        }else {
            SeasonIncreasedShowFans curr = new SeasonIncreasedShowFans();
            curr.setMyShow(myShow);
            curr.setYear(Utils.getCurrentCalender().get(Calendar.YEAR));
            curr.setSeason(Utils.getSeasonOfYear(Utils.getCurrentCalender().get(Calendar.MONTH)));
            curr.setInviteNum(1);
            seasonIncreasedShowFansDao.persistAbstract(curr);
        }

        if(this.getSessionUserId().equals(showTerms.getMyShow().getOwner().getId())){
               One2ManyTeacherSession one2ManyTeacherSession = new One2ManyTeacherSession();
               one2ManyTeacherSession.initWithSessionForShow(showTerms,baseUserDao.findById(this.getSessionUserId()));
               XStream xstream = new XStream();
               xstream.alias("Session", One2ManyTeacherSession.class);
               OutputStream output = new ByteArrayOutputStream();
               xstream.marshal(one2ManyTeacherSession, new CompactWriter(new OutputStreamWriter(output)));
               this.setInitSeesionString(output.toString());
               this.setFlashPatch("flash/Teacher_1_to_M.swf");
               this.setRoleType(1);
               return SUCCESS;
        }else {
                One2ManyStudentSession one2ManyStudentSession = new One2ManyStudentSession();
                one2ManyStudentSession.initWithSessionForShow(showTerms,baseUserDao.findById(this.getSessionUserId()));
                XStream xstream = new XStream();
                xstream.alias("Session", One2ManyStudentSession.class);
                OutputStream output = new ByteArrayOutputStream();
                xstream.marshal(one2ManyStudentSession, new CompactWriter(new OutputStreamWriter(output)));
                this.setInitSeesionString(output.toString());
                this.setRoleType(2);
                this.setFlashPatch("flash/Student_1_to_M.swf");
                return SUCCESS;
        }
    }

    public MyShow getMyShow() {
        return myShow;
    }

    public void setMyShow(MyShow myShow) {
        this.myShow = myShow;
    }

    public MyShowDao getMyShowDao() {
        return myShowDao;
    }

    public void setMyShowDao(MyShowDao myShowDao) {
        this.myShowDao = myShowDao;
    }

    public BaseUser getBaseUser() {
        return baseUser;
    }

    public void setBaseUser(BaseUser baseUser) {
        this.baseUser = baseUser;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
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

    public ShowTerms getShowTerms() {
        return showTerms;
    }

    public void setShowTerms(ShowTerms showTerms) {
        this.showTerms = showTerms;
    }

    public ShowTermsDao getShowTermsDao() {
        return showTermsDao;
    }

    public void setShowTermsDao(ShowTermsDao showTermsDao) {
        this.showTermsDao = showTermsDao;
    }

    public Integer getRoleType() {
        return roleType;
    }

    public void setRoleType(Integer roleType) {
        this.roleType = roleType;
    }

    public SeasonIncreasedShowFansDao getSeasonIncreasedShowFansDao() {
        return seasonIncreasedShowFansDao;
    }

    public void setSeasonIncreasedShowFansDao(SeasonIncreasedShowFansDao seasonIncreasedShowFansDao) {
        this.seasonIncreasedShowFansDao = seasonIncreasedShowFansDao;
    }
}
