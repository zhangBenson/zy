package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.rep.course.dao.*;
import com.gogowise.rep.course.enity.ClassMembership;
import com.gogowise.rep.course.enity.CourseClass;
import com.gogowise.rep.course.enity.QuestionResult;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.enity.BaseUser;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-3
 * Time: 上午10:31
 * To change this template use File | Settings | File Templates.
 */

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class ClassRoomAction extends BasicAction {
    /**
     *
     */
    private static final long serialVersionUID = 4643718717641950564L;
    private CourseDao courseDao;
    private BaseUserDao baseUserDao;
    private SeniorClassRoomDao seniorClassRoomDao;

    private Integer status;
    private BaseUser user;
    private ClassDao classDao;
    private CourseClass courseClass;

    private String resultMessage;
    private ClassMembership classMembership;
    private ClassMembershipDao classMembershipDao;

    @Autowired
    private QuestionResultDao questionResultDao;


    @Action(value = "ajaxChangeUserStatusInClass")
    public void ajaxChangeUserStatusInClass() throws IOException {
        if (this.getSessionUserId() == null) {
            resultMessage = "error";
        } else {
            user = baseUserDao.findById(this.getSessionUserId());
            courseClass = classDao.findById(this.getCourseClass().getId());

            ClassMembership record = classMembershipDao.findByUserAndClassId(user.getId(), courseClass.getId());

            if (record == null) {
                record = new ClassMembership();
                record.setUser(user);
                record.setCourseClass(courseClass);
                record.setStatus(status);
                classMembershipDao.persistAbstract(record);
            } else {
                if (record.getStatus() < status) {
                    record.setStatus(status);
                    classMembershipDao.persist(record);
                }
            }
            resultMessage = "success";
        }

        PrintWriter out = ServletActionContext.getResponse().getWriter();
        out.print(resultMessage);
        out.close();
    }

    /**
     * 按照记录来初始化学生完成课程classes的情况
     *
     * @return
     */
    @Action(value = "initClassMembershipInfoWithOld")
    public void initClassMembershipInfoWithOld() {
        List<QuestionResult> questionResults = questionResultDao.findAll();
        for (QuestionResult questionResult : questionResults) {
            BaseUser user = questionResult.getOwner();
            CourseClass classTemp = questionResult.getCourseClass();

            ClassMembership cm = classMembershipDao.findByUserAndClassId(user.getId(), classTemp.getId());

            if (cm == null) {
                cm = new ClassMembership();
                cm.setStatus(Constants.Class_User_Status_Finish);
                cm.setUser(user);
                cm.setCourseClass(classTemp);
                classMembershipDao.persistAbstract(cm);
            } else {
                cm.setStatus(Constants.Class_User_Status_Finish);
                classMembershipDao.persist(cm);
            }
        }
    }


    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public SeniorClassRoomDao getSeniorClassRoomDao() {
        return seniorClassRoomDao;
    }

    public void setSeniorClassRoomDao(SeniorClassRoomDao seniorClassRoomDao) {
        this.seniorClassRoomDao = seniorClassRoomDao;
    }

    public String getResultMessage() {
        return resultMessage;
    }

    public void setResultMessage(String resultMessage) {
        this.resultMessage = resultMessage;
    }

    public ClassMembership getClassMembership() {
        return classMembership;
    }

    public void setClassMembership(ClassMembership classMembership) {
        this.classMembership = classMembership;
    }

    public ClassMembershipDao getClassMembershipDao() {
        return classMembershipDao;
    }

    public void setClassMembershipDao(ClassMembershipDao classMembershipDao) {
        this.classMembershipDao = classMembershipDao;
    }

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public ClassDao getClassDao() {
        return classDao;
    }

    public void setClassDao(ClassDao classDao) {
        this.classDao = classDao;
    }

    public CourseClass getCourseClass() {
        return courseClass;
    }

    public void setCourseClass(CourseClass courseClass) {
        this.courseClass = courseClass;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }


}
