package com.gogowise.action.course.vclass;

import com.gogowise.action.BasicAction;
import com.gogowise.action.valueobject.VirtualClassRoomSession;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.Utils;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.dao.ClassDao;
import com.gogowise.rep.course.dao.SeniorClassRoomDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.CourseClass;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.enity.BaseUser;
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

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class VirtualClassRoomAction extends BasicAction {
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


    @Action(value = "openVirtualClassRoom", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".openVirtualClassRoom"),
            @Result(name = ERROR, type = Constants.RESULT_NAME_TILES, location = ".notExist")})
    public String openVirtualClassRoom() {
        if (this.getCourseClass().getId() != null) {
            courseClass = classDao.findById(this.getCourseClass().getId());
            if(courseClass == null ) return ERROR;
            Course course = courseClass.getCourse();
            if( course.getTeacher() == null ) return ERROR;

            if (course.getTeacher() != null && this.getSessionUserId() == course.getTeacher().getId()) {
                VirtualClassRoomSession virtualClassRoomSession = new VirtualClassRoomSession();
                initTeacherSession(virtualClassRoomSession);
                XStream xstream = new XStream();
                xstream.alias("Session", VirtualClassRoomSession.class);
                OutputStream output = new ByteArrayOutputStream();
                xstream.marshal(virtualClassRoomSession, new CompactWriter(new OutputStreamWriter(output)));
                this.setInitSeesionString(output.toString());
                this.setFlashPatch("flash/Teacher_1.swf");
                this.setRoleType(1);
                courseClass.setTeacherEntered(true);
                classDao.persistAbstract(courseClass);
                return SUCCESS;
            } else {
                VirtualClassRoomSession virtualClassRoomSession = new VirtualClassRoomSession();
                initStudentSession(virtualClassRoomSession);
                XStream xstream = new XStream();
                xstream.alias("Session", VirtualClassRoomSession.class);
                OutputStream output = new ByteArrayOutputStream();
                xstream.marshal(virtualClassRoomSession, new CompactWriter(new OutputStreamWriter(output)));
                this.setInitSeesionString(output.toString());
                this.setFlashPatch("flash/Student_1.swf");
                this.setRoleType(2);
                return SUCCESS;

            }
        }
        return ERROR;
    }


    private void initTeacherSession(VirtualClassRoomSession virtualClassRoomSession) {
        virtualClassRoomSession.initWithSession(this.getCourseClass());
        BaseUser user = baseUserDao.findById(this.getSessionUserId());
        virtualClassRoomSession.setUserID(Utils.getEmptyInteger(user.getId()));
        virtualClassRoomSession.setUserName(Utils.getEmptyString(user.getNickName()));
        virtualClassRoomSession.setUserLogo(Utils.getEmptyString(user.getPic()));
    }

    private void initStudentSession(VirtualClassRoomSession virtualClassRoomSession) {
        virtualClassRoomSession.initWithSession(this.getCourseClass());
        BaseUser user = baseUserDao.findById(this.getSessionUserId());
        virtualClassRoomSession.setUserID(user.getId());
        virtualClassRoomSession.setUserName(user.getNickName());
        virtualClassRoomSession.setUserLogo(Utils.getEmptyString(user.getPic()));

        Course course = classDao.findById(virtualClassRoomSession.getClassID()).getCourse();
        virtualClassRoomSession.setMasterID( course.getTeacher().getId() );
        virtualClassRoomSession.setMasterName( course.getTeacher().getNickName() );
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
