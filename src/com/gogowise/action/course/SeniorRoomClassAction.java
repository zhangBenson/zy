package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.user.BaseUserDao;
import com.gogowise.rep.course.CourseDao;
import com.gogowise.rep.course.SeniorClassRoomDao;
import com.gogowise.domain.course.SeniorClassRoom;
import com.gogowise.common.utils.Constants;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-4
 * Time: 下午6:53
 * To change this template use File | Settings | File Templates.
 */
@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class SeniorRoomClassAction extends BasicAction {
    /**
     *
     */
    private static final long serialVersionUID = -6732813693820191473L;
    private SeniorClassRoomDao seniorClassRoomDao;
    private BaseUserDao baseUserDao;
    private CourseDao courseDao;
    private SeniorClassRoom seniorClassRoom;

    @Action(value = "saveSeniorClassRoom")
    public void saveSeniorClassRoom() throws IOException {
        String msg = seniorClassRoomDao.saveSeniorClassRoom(seniorClassRoom.getCourse().getId(), (Integer) ActionContext.getContext().getSession().get(Constants.SESSION_USER_ID));
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        if (msg != null) {
            out.println(msg);
        }
    }

//    private Boolean identityTell(Course course,Integer userId){
//       // return true suggest that the user is already an menber of the coures
//       Integer teacherid = course.getTeacher().getId();
//       Integer cameraManid = course.getCameraMan().getId();
//       Organization org = course.getOrganization();
//        if(teacherid.equals(userId)||cameraManid.equals(userId)){
//            return true;
//        }
//        if(org!=null){
//           if(!org.isVirtual()){
//              if(org.getResponsiblePerson().getId().equals(userId)){
//                     return true;
//              }
//           }
//        }
//        return false;
//    }
//
//    private Boolean existInRoom(Integer cid,Integer uid){
//        SeniorClassRoom scr = seniorClassRoomDao.findClassRoomByCourseAndStudent(cid,uid);
//        if(scr != null){
//            return true;
//        }
//        return false;
//    }

    public SeniorClassRoomDao getSeniorClassRoomDao() {
        return seniorClassRoomDao;
    }

    public void setSeniorClassRoomDao(SeniorClassRoomDao seniorClassRoomDao) {
        this.seniorClassRoomDao = seniorClassRoomDao;
    }

    public SeniorClassRoom getSeniorClassRoom() {
        return seniorClassRoom;
    }

    public void setSeniorClassRoom(SeniorClassRoom seniorClassRoom) {
        this.seniorClassRoom = seniorClassRoom;
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
}
