package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.action.valueobject.*;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.course.dao.ClassDao;
import com.gogowise.rep.course.dao.SeniorClassRoomDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.CourseClass;
import com.gogowise.rep.course.enity.SeniorClassRoom;
import com.gogowise.rep.user.enity.BaseUser;
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
import java.util.List;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class VedioSessionDataAction extends BasicAction {
    private BaseUserDao baseUserDao;
    private SeniorClassRoomDao seniorClassRoomDao;
    private ClassDao classDao;
    private CourseClass courseClass;
    private Pagination page;
    private String initSeesionString;
    private String flashPatch;
    private Integer roleType;                  //进入虚拟教室的人的身份，1为老师，2为学生
    private Boolean courseOnline = false;
    private String inviteFriendHref;


    @Action(value = "studentClass", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".roomStudent"),
            @Result(name = ERROR, type = Constants.RESULT_NAME_TILES, location = ".notExist")})
    public String toRoomStudent() {
        if (this.getCourseClass().getId() != null) {
            courseClass = classDao.findById(this.getCourseClass().getId());
            inviteFriendHref = getBasePath() + "/courseOnlineAudit.html?courseClass.id=" + courseClass.getId() + "&courseOnline=true";
            Course course = courseClass.getCourse();
            One2ManyStudentSession one2ManyStudentSession = new One2ManyStudentSession();
            initOne2manyStudentSession(one2ManyStudentSession);
            XStream xstream = new XStream();
            xstream.alias("Session", One2ManyStudentSession.class);
            OutputStream output = new ByteArrayOutputStream();
            xstream.marshal(one2ManyStudentSession, new CompactWriter(new OutputStreamWriter(output)));
            this.setInitSeesionString(output.toString());
            this.setRoleType(1);
            return SUCCESS;
        }
        return ERROR;
    }


    @Action(value = "lecturerClass", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".roomLecturer"),
            @Result(name = ERROR, type = Constants.RESULT_NAME_TILES, location = ".notExist")})
    public String toRoomLecturer() {
        if (this.getCourseClass().getId() != null) {
            courseClass = classDao.findById(this.getCourseClass().getId());
            inviteFriendHref = getBasePath() + "/courseOnlineAudit.html?courseClass.id=" + courseClass.getId() + "&courseOnline=true";

            Course course = courseClass.getCourse();
            One2ManyTeacherSession one2ManyTeacherSession = new One2ManyTeacherSession();
            one2ManyTeacherSession.initWithSession(courseClass);
            initOne2manyTeacherSession(one2ManyTeacherSession);

            XStream xstream = new XStream();
            xstream.alias("Session", One2ManyTeacherSession.class);
            OutputStream output = new ByteArrayOutputStream();
            xstream.marshal(one2ManyTeacherSession, new CompactWriter(new OutputStreamWriter(output)));
            this.setInitSeesionString(output.toString());
            this.setRoleType(1);
            courseClass.setTeacherEntered(true);
            classDao.persistAbstract(courseClass);
            return SUCCESS;
        }
        return ERROR;
    }


    @Action(value = "playerClass", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".roomPlayer"),
            @Result(name = ERROR, type = Constants.RESULT_NAME_TILES, location = ".notExist")})
    public String toRoomPlayer() {
        if (this.getCourseClass().getId() != null) {
            courseClass = classDao.findById(this.getCourseClass().getId());
            inviteFriendHref = getBasePath() + "/courseOnlineAudit.html?courseClass.id=" + courseClass.getId() + "&courseOnline=true";
            Course course = courseClass.getCourse();
            One2ManyPlayerSession one2ManyPlayerSession = new One2ManyPlayerSession();
            initOne2manyPlayerSession(one2ManyPlayerSession);

            /*One2ManyStudentSession one2ManyStudentSession = new One2ManyStudentSession();
            initOne2manyStudentSession(one2ManyStudentSession);*/

            XStream xstream = new XStream();
            xstream.alias("Session", One2ManyPlayerSession.class);
            OutputStream output = new ByteArrayOutputStream();
            xstream.marshal(one2ManyPlayerSession, new CompactWriter(new OutputStreamWriter(output)));
            this.setInitSeesionString(output.toString());
            this.setRoleType(1);
            return SUCCESS;
        }
        return ERROR;
    }


    private void initOne2manyTeacherSession(One2ManyTeacherSession one2ManyTeacherSession) {
        one2ManyTeacherSession.initWithSession(this.getCourseClass());
        BaseUser user = baseUserDao.findById(this.getSessionUserId());
        one2ManyTeacherSession.setUserID(Utils.getEmptyInteger(user.getId()));
        one2ManyTeacherSession.setUserName(Utils.getEmptyString(user.getNickName()));
        if (user.getPic() != null) {
            one2ManyTeacherSession.setUserLogo(user.getPic());
        }
    }


    private void initOne2manyStudentSession(One2ManyStudentSession one2ManyStudentSession) {
        one2ManyStudentSession.initWithSession(this.getCourseClass());
        BaseUser user = baseUserDao.findById(this.getSessionUserId());
        one2ManyStudentSession.setUserID(user.getId());
        one2ManyStudentSession.setUserName(user.getNickName());
        if (user.getPic() != null)
            one2ManyStudentSession.setUserLogo(user.getPic());
    }

    private void initOne2manyPlayerSession(One2ManyPlayerSession one2ManyPlayerSession) {
        one2ManyPlayerSession.initWithSession(this.getCourseClass());
        if (this.getSessionUserId() == null) {
            one2ManyPlayerSession.setUserID(-1);
        } else {
            BaseUser user = baseUserDao.findById(this.getSessionUserId());
            one2ManyPlayerSession.setUserID(user.getId());
            one2ManyPlayerSession.setUserName(user.getNickName());
            if (user.getPic() != null) {
                one2ManyPlayerSession.setUserLogo(user.getPic());
            }
        }
    }


    //================================= getter and setter================
    public CourseClass getCourseClass() {
        return courseClass;
    }

    public void setCourseClass(CourseClass courseClass) {
        this.courseClass = courseClass;
    }

    public ClassDao getClassDao() {
        return classDao;
    }

    public void setClassDao(ClassDao classDao) {
        this.classDao = classDao;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public SeniorClassRoomDao getSeniorClassRoomDao() {
        return seniorClassRoomDao;
    }

    public void setSeniorClassRoomDao(SeniorClassRoomDao seniorClassRoomDao) {
        this.seniorClassRoomDao = seniorClassRoomDao;
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

    public Boolean getCourseOnline() {
        return courseOnline;
    }

    public void setCourseOnline(Boolean courseOnline) {
        this.courseOnline = courseOnline;
    }

    public String getInviteFriendHref() {
        return inviteFriendHref;
    }

    public void setInviteFriendHref(String inviteFriendHref) {
        this.inviteFriendHref = inviteFriendHref;
    }
}
