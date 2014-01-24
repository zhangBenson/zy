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

    @Action(value = "one2oneAnony", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".one2oneAnonySession")})
    public String One2OneAnonySession(){
        if (this.getCourseClass().getId() != null) {
            courseClass = classDao.findById(this.getCourseClass().getId());
        }
        One2OneAnonySession one2OneAnonySession = new One2OneAnonySession();
        initOne2oneAnonySession(one2OneAnonySession);
        XStream xstream = new XStream();
        xstream.alias("Session", One2OneAnonySession.class);
        OutputStream output = new ByteArrayOutputStream();
        xstream.marshal(one2OneAnonySession, new CompactWriter(new OutputStreamWriter(output)));
        this.setInitSeesionString(output.toString());
        this.setFlashPatch("flash/Anony_1_to_1.swf");
        this.setRoleType(2);
        return SUCCESS;
    }

    @Action(value = "one2twoSession",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".one2twoSession"),
                                                  @Result(name = ERROR,type = Constants.RESULT_NAME_TILES,location = ".notExist")})
     public String One2twoSession(){
        if (this.getCourseClass().getId() != null) {
            courseClass = classDao.findById(this.getCourseClass().getId());
            inviteFriendHref = getBasePath()+"/courseOnlineAudit.html?courseClass.id="+courseClass.getId()+"&courseOnline=true";
            Course course = courseClass.getCourse();
            if(course.getTeacher()!=null&&this.getSessionUserId()==course.getTeacher().getId()){
                One2twoTeacherSession one2twoTeacherSession = new One2twoTeacherSession();
                initOne2twoTeacherSession(one2twoTeacherSession);
                XStream xstream = new XStream();
                xstream.alias("Session", One2twoTeacherSession.class);
                OutputStream output = new ByteArrayOutputStream();
                xstream.marshal(one2twoTeacherSession, new CompactWriter(new OutputStreamWriter(output)));
                this.setInitSeesionString(output.toString());
                this.setFlashPatch("flash/Teacher_1_to_2.swf");
                this.setRoleType(1);
                courseClass.setTeacherEntered(true);
                classDao.persistAbstract(courseClass);
                return SUCCESS;
            }else {
                One2twoStudentSession one2twoStudentSession = new One2twoStudentSession();
                initOne2twoStudentSession(one2twoStudentSession);
                XStream xstream = new XStream();
                xstream.alias("Session", One2twoStudentSession.class);
                OutputStream output = new ByteArrayOutputStream();
                xstream.marshal(one2twoStudentSession, new CompactWriter(new OutputStreamWriter(output)));
                this.setInitSeesionString(output.toString());
                this.setFlashPatch("flash/Student_1_to_2.swf");
                this.setRoleType(2);
                return SUCCESS;
            }
        }
        return ERROR;
    }

    @Action(value = "one2threeSession",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".one2threeSession"),
                                                     @Result(name = ERROR,type = Constants.RESULT_NAME_TILES,location = ".notExist")})
    public String One2threeSession(){
        if (this.getCourseClass().getId() != null) {
            courseClass = classDao.findById(this.getCourseClass().getId());
            inviteFriendHref = getBasePath()+"/courseOnlineAudit.html?courseClass.id="+courseClass.getId()+"&courseOnline=true";
            Course course = courseClass.getCourse();
            if(course.getTeacher()!=null&&this.getSessionUserId()==course.getTeacher().getId()){
                One2threeTeacherSession one2threeTeacherSession = new One2threeTeacherSession();
                initOne2threeTeacherSession(one2threeTeacherSession);
                XStream xstream = new XStream();
                xstream.alias("Session", One2threeTeacherSession.class);
                OutputStream output = new ByteArrayOutputStream();
                xstream.marshal(one2threeTeacherSession, new CompactWriter(new OutputStreamWriter(output)));
                this.setInitSeesionString(output.toString());
                this.setFlashPatch("flash/Teacher_1_to_3.swf");
                this.setRoleType(1);
                courseClass.setTeacherEntered(true);
                classDao.persistAbstract(courseClass);
                return SUCCESS;
            }else {
                One2threeStudentSession one2threeStudentSession = new One2threeStudentSession();
                initOne2threeStudentSession(one2threeStudentSession);
                XStream xstream = new XStream();
                xstream.alias("Session", One2threeStudentSession.class);
                OutputStream output = new ByteArrayOutputStream();
                 xstream.marshal(one2threeStudentSession, new CompactWriter(new OutputStreamWriter(output)));
                this.setInitSeesionString(output.toString());
                this.setFlashPatch("flash/Student_1_to_3.swf");
                this.setRoleType(2);
                return SUCCESS;

            }
        }
        return ERROR;
    }


    @Action(value = "one2manySession",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".one2manySession"),
                                                     @Result(name = ERROR,type = Constants.RESULT_NAME_TILES,location = ".notExist")})
    public String one2manySession(){
       if (this.getCourseClass().getId() != null) {
           courseClass = classDao.findById(this.getCourseClass().getId());
           inviteFriendHref = getBasePath()+"/courseOnlineAudit.html?courseClass.id="+courseClass.getId()+"&courseOnline=true";
           Course course = courseClass.getCourse();
           if(course.getTeacher()!=null&&this.getSessionUserId()==course.getTeacher().getId()){
               One2ManyTeacherSession one2ManyTeacherSession = new One2ManyTeacherSession();
               initOne2manyTeacherSession(one2ManyTeacherSession);
               XStream xstream = new XStream();
               xstream.alias("Session", One2ManyTeacherSession.class);
               OutputStream output = new ByteArrayOutputStream();
               xstream.marshal(one2ManyTeacherSession, new CompactWriter(new OutputStreamWriter(output)));
               this.setInitSeesionString(output.toString());
               this.setFlashPatch("flash/Teacher_1.swf");
               this.setRoleType(1);
               courseClass.setTeacherEntered(true);
               classDao.persistAbstract(courseClass);
               return SUCCESS;
           }else {
               One2ManyStudentSession one2ManyStudentSession = new One2ManyStudentSession();
               initOne2manyStudentSession(one2ManyStudentSession);
               XStream xstream = new XStream();
               xstream.alias("Session", One2ManyStudentSession.class);
               OutputStream output = new ByteArrayOutputStream();
                xstream.marshal(one2ManyStudentSession, new CompactWriter(new OutputStreamWriter(output)));
               this.setInitSeesionString(output.toString());
               this.setFlashPatch("flash/Student_1.swf");
               this.setRoleType(2);
               return SUCCESS;
           }
       }
       return ERROR;
   }


    @Action(value = "studentClass",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".roomStudent"),
                                                     @Result(name = ERROR,type = Constants.RESULT_NAME_TILES,location = ".notExist")})
    public String toRoomStudent(){
       if (this.getCourseClass().getId() != null) {
           courseClass = classDao.findById(this.getCourseClass().getId());
           inviteFriendHref = getBasePath()+"/courseOnlineAudit.html?courseClass.id="+courseClass.getId()+"&courseOnline=true";
           Course course = courseClass.getCourse();
//           if(course.getTeacher()!=null&&this.getSessionUserId()==course.getTeacher().getId()){
//               One2ManyTeacherSession one2ManyTeacherSession = new One2ManyTeacherSession();
//               initOne2manyTeacherSession(one2ManyTeacherSession);
//               XStream xstream = new XStream();
//               xstream.alias("Session", One2ManyTeacherSession.class);
//               OutputStream output = new ByteArrayOutputStream();
//               xstream.marshal(one2ManyTeacherSession, new CompactWriter(new OutputStreamWriter(output)));
//               this.setInitSeesionString(output.toString());
//               this.setFlashPatch("flash/Teacher_1_to_M.swf");
//               this.setRoleType(1);
//               courseClass.setTeacherEntered(true);
//               classDao.persistAbstract(courseClass);
//               return SUCCESS;
//           }else {
               One2ManyStudentSession one2ManyStudentSession = new One2ManyStudentSession();
               initOne2manyStudentSession(one2ManyStudentSession);
               XStream xstream = new XStream();
               xstream.alias("Session", One2ManyStudentSession.class);
               OutputStream output = new ByteArrayOutputStream();
                xstream.marshal(one2ManyStudentSession, new CompactWriter(new OutputStreamWriter(output)));
               this.setInitSeesionString(output.toString());
//               this.setFlashPatch("flash/Student_1_to_M.swf");
               this.setRoleType(2);
               return SUCCESS;
//
//           }
       }
       return ERROR;
   }


    @Action(value = "lecturerClass",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".roomLecturer"),
                                                     @Result(name = ERROR,type = Constants.RESULT_NAME_TILES,location = ".notExist")})
    public String toRoomLecturer(){
       if (this.getCourseClass().getId() != null) {
           courseClass = classDao.findById(this.getCourseClass().getId());
           inviteFriendHref = getBasePath()+"/courseOnlineAudit.html?courseClass.id="+courseClass.getId()+"&courseOnline=true";

           Course course = courseClass.getCourse();
           One2ManyTeacherSession one2ManyTeacherSession = new One2ManyTeacherSession();
           initOne2manyTeacherSession(one2ManyTeacherSession);
           XStream xstream = new XStream();
           xstream.alias("Session", One2ManyTeacherSession.class);
           OutputStream output = new ByteArrayOutputStream();
           xstream.marshal(one2ManyTeacherSession, new CompactWriter(new OutputStreamWriter(output)));
           this.setInitSeesionString(output.toString());
//           this.setFlashPatch("flash/Teacher_1_to_M.swf");
           this.setRoleType(1);
           courseClass.setTeacherEntered(true);
           classDao.persistAbstract(courseClass);
           return SUCCESS;
       }
       return ERROR;
   }


    @Action(value = "playerClass",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".roomPlayer"),
                                                     @Result(name = ERROR,type = Constants.RESULT_NAME_TILES,location = ".notExist")})
    public String toRoomPlayer(){
       if (this.getCourseClass().getId() != null) {
           courseClass = classDao.findById(this.getCourseClass().getId());
           inviteFriendHref = getBasePath()+"/courseOnlineAudit.html?courseClass.id="+courseClass.getId()+"&courseOnline=true";

           Course course = courseClass.getCourse();
           One2ManyTeacherSession one2ManyTeacherSession = new One2ManyTeacherSession();
           initOne2manyTeacherSession(one2ManyTeacherSession);
           XStream xstream = new XStream();
           xstream.alias("Session", One2ManyTeacherSession.class);
           OutputStream output = new ByteArrayOutputStream();
           xstream.marshal(one2ManyTeacherSession, new CompactWriter(new OutputStreamWriter(output)));
           this.setInitSeesionString(output.toString());
//           this.setFlashPatch("flash/Teacher_1_to_M.swf");
           this.setRoleType(1);
           courseClass.setTeacherEntered(true);
           classDao.persistAbstract(courseClass);
           return SUCCESS;
       }
       return ERROR;
   }




    @Action(value = "startSupervision",results = {@Result(name = "one2one",type = Constants.RESULT_NAME_TILES,location = ".openClassSession"),
                                                     @Result(name = "one2two",type = Constants.RESULT_NAME_TILES,location = ".one2twoSession"),
                                                     @Result(name = "one2three",type = Constants.RESULT_NAME_TILES,location = ".one2threeSession"),
                                                     @Result(name = "one2many",type = Constants.RESULT_NAME_TILES,location = ".one2manySession"),
                                                     @Result(name = ERROR,type = Constants.RESULT_NAME_TILES,location = ".notExist")})
    public String startSupervision(){
        if (this.getCourseClass().getId() != null) {
             courseClass = classDao.findById(this.getCourseClass().getId());
//             Calendar startTime = Calendar.getInstance();
//             startTime.setTime(courseClass.getDate().getTime());
//             startTime.add(Calendar.MINUTE,-30);
//             if(Utils.getCurrentCalender().before(startTime) || Utils.getCurrentCalender().after(courseClass.getFinished())){
//                 return "courseBlog";
//             }
             Course course = courseClass.getCourse();
             this.setRoleType(3);//teacher is 1,student is 2,anonymous is 3
             if(course.getTeachingNum() == 1){
                 One2OneAnonySession one2OneAnonySession = new One2OneAnonySession();
                 initOne2oneAnonySession(one2OneAnonySession);
                 XStream xstream = new XStream();
                 xstream.alias("Session", One2OneAnonySession.class);
                 OutputStream output = new ByteArrayOutputStream();
                 xstream.marshal(one2OneAnonySession, new CompactWriter(new OutputStreamWriter(output)));
                 this.setInitSeesionString(output.toString());
                 if(courseOnline != null && courseOnline == true){
                     this.setFlashPatch("flash/Anony_1_to_1.swf");
                 }else {
                     this.setFlashPatch("flash/Monitor_1_to_1.swf");
                 }
                 return "one2one";
             }else if(course.getTeachingNum() == 2){
                 One2TwoAnonySession one2TwoAnonySession = new One2TwoAnonySession();
                 initOne2TwoAnonySession(one2TwoAnonySession);
                 XStream xStream = new XStream();
                 xStream.alias("Session",One2TwoAnonySession.class);
                 OutputStream output = new ByteArrayOutputStream();
                 xStream.marshal(one2TwoAnonySession,new CompactWriter(new OutputStreamWriter(output)));
                 this.setInitSeesionString(output.toString());
                  if(courseOnline != null && courseOnline == true){
                     this.setFlashPatch("flash/Anony_1_to_2.swf");
                 }else {
                     this.setFlashPatch("flash/Monitor_1_to_2.swf");
                  }
                 return "one2two";
             }else if(course.getTeachingNum() == 3){
                 One2ThreeAnonySession one2ThreeAnonySession = new One2ThreeAnonySession();
                 initOne2ThreeAnonySession(one2ThreeAnonySession);
                 XStream xstream = new XStream();
                 xstream.alias("Session", One2ThreeAnonySession.class);
                 OutputStream output = new ByteArrayOutputStream();
                 xstream.marshal(one2ThreeAnonySession, new CompactWriter(new OutputStreamWriter(output)));
                 this.setInitSeesionString(output.toString());
                  if(courseOnline != null && courseOnline == true){
                     this.setFlashPatch("flash/Anony_1_to_3.swf");
                 }else {
                     this.setFlashPatch("flash/Monitor_1_to_3.swf");
                  }
                 return "one2three";
             }else if(course.getTeachingNum() == 4){
                 One2ManyAnonySession one2ManyAnonySession = new One2ManyAnonySession();
                 initOne2ManyAnonySession(one2ManyAnonySession);
                 XStream xstream = new XStream();
                 xstream.alias("Session", One2ManyAnonySession.class);
                 OutputStream output = new ByteArrayOutputStream();
                 xstream.marshal(one2ManyAnonySession, new CompactWriter(new OutputStreamWriter(output)));
                 this.setInitSeesionString(output.toString());
                  if(courseOnline != null && courseOnline == true){
                     this.setFlashPatch("flash/Anony_1_to_M.swf");
                 }else {
                     this.setFlashPatch("flash/Monitor_1_to_M.swf");
                  }
                 return "one2many";
             }
        }
        return ERROR;
    }

    @Action(value = "courseOnlineAudit",results = {@Result(name = "one2one",type = Constants.RESULT_NAME_TILES,location = ".openClassSession"),
                                                       @Result(name = "one2two",type = Constants.RESULT_NAME_TILES,location = ".one2twoSession"),
                                                       @Result(name = "one2three",type = Constants.RESULT_NAME_TILES,location = ".one2threeSession"),
                                                       @Result(name = "one2many",type = Constants.RESULT_NAME_TILES,location = ".one2manySession"),
                                                       @Result(name = "courseBlog",type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "voaCourseBlog","course.id","${courseClass.course.id}"}),
                                                       @Result(name = ERROR,type = Constants.RESULT_NAME_TILES,location = ".notExist")})
      public String courseOnline(){
          if (this.getCourseClass().getId() != null) {
               courseClass = classDao.findById(this.getCourseClass().getId());
               Calendar startTime = Calendar.getInstance();
               startTime.setTime(courseClass.getDate().getTime());
               startTime.add(Calendar.MINUTE,-30);
               if(Utils.getCurrentCalender().before(startTime) || Utils.getCurrentCalender().after(courseClass.getFinished())){
                     return "courseBlog";
               }
               Course course = courseClass.getCourse();
               inviteFriendHref = getBasePath()+"/courseOnlineAudit.html?courseClass.id="+courseClass.getId()+"&courseOnline=true";
               this.setRoleType(3);//teacher is 1,student is 2,anonymous is 3
               if(course.getTeachingNum() == 1){
                   One2OneAnonySession one2OneAnonySession = new One2OneAnonySession();
                   initOne2oneAnonySession(one2OneAnonySession);
                   XStream xstream = new XStream();
                   xstream.alias("Session", One2OneAnonySession.class);
                   OutputStream output = new ByteArrayOutputStream();
                   xstream.marshal(one2OneAnonySession, new CompactWriter(new OutputStreamWriter(output)));
                   this.setInitSeesionString(output.toString());
                   if(courseOnline != null && courseOnline == true){
                       this.setFlashPatch("flash/Anony_1_to_1.swf");
                   }else {
                       this.setFlashPatch("flash/Monitor_1_to_1.swf");
                   }
                   return "one2one";
               }else if(course.getTeachingNum() == 2){
                   One2TwoAnonySession one2TwoAnonySession = new One2TwoAnonySession();
                   initOne2TwoAnonySession(one2TwoAnonySession);
                   XStream xStream = new XStream();
                   xStream.alias("Session",One2TwoAnonySession.class);
                   OutputStream output = new ByteArrayOutputStream();
                   xStream.marshal(one2TwoAnonySession,new CompactWriter(new OutputStreamWriter(output)));
                   this.setInitSeesionString(output.toString());
                    if(courseOnline != null && courseOnline == true){
                       this.setFlashPatch("flash/Anony_1_to_2.swf");
                   }else {
                       this.setFlashPatch("flash/Monitor_1_to_2.swf");
                    }
                   return "one2two";
               }else if(course.getTeachingNum() == 3){
                   One2ThreeAnonySession one2ThreeAnonySession = new One2ThreeAnonySession();
                   initOne2ThreeAnonySession(one2ThreeAnonySession);
                   XStream xstream = new XStream();
                   xstream.alias("Session", One2ThreeAnonySession.class);
                   OutputStream output = new ByteArrayOutputStream();
                   xstream.marshal(one2ThreeAnonySession, new CompactWriter(new OutputStreamWriter(output)));
                   this.setInitSeesionString(output.toString());
                    if(courseOnline != null && courseOnline == true){
                       this.setFlashPatch("flash/Anony_1_to_3.swf");
                   }else {
                       this.setFlashPatch("flash/Monitor_1_to_3.swf");
                    }
                   return "one2three";
               }else if(course.getTeachingNum() == 4){
                   One2ManyAnonySession one2ManyAnonySession = new One2ManyAnonySession();
                   initOne2ManyAnonySession(one2ManyAnonySession);
                   XStream xstream = new XStream();
                   xstream.alias("Session", One2ManyAnonySession.class);
                   OutputStream output = new ByteArrayOutputStream();
                   xstream.marshal(one2ManyAnonySession, new CompactWriter(new OutputStreamWriter(output)));
                   this.setInitSeesionString(output.toString());
                    if(courseOnline != null && courseOnline == true){
                       this.setFlashPatch("flash/Anony_1_to_M.swf");
                   }else {
                       this.setFlashPatch("flash/Monitor_1_to_M.swf");
                    }
                   return "one2many";
               }
          }
          return ERROR;
      }



    private void initOne2oneAnonySession(One2OneAnonySession one2OneAnonySession){
        one2OneAnonySession.initWithSession(this.getCourseClass());
        if(this.getSessionUserId() != null){
                BaseUser user = baseUserDao.findById(this.getSessionUserId());
                one2OneAnonySession.setUserID(Utils.getEmptyInteger(user.getId()));
                one2OneAnonySession.setUserName(Utils.getEmptyString(user.getNickName()));
        }else {
              one2OneAnonySession.setUserName("Anony"+(this.getCourseClass().getAnonyNum()==null? new Integer(0):courseClass.getAnonyNum()).toString());
              if(courseClass.getAnonyNum()!=null){
                  courseClass.setAnonyNum(courseClass.getAnonyNum()+1);
              }else {
                  courseClass.setAnonyNum(1);
              }
              classDao.persistAbstract(courseClass);
        }
        List<SeniorClassRoom> seniorClassRooms = seniorClassRoomDao.findClassRoomByCourseId(courseClass.getCourse().getId());
        if (seniorClassRooms.size() != 0) {
                one2OneAnonySession.setStudentID1(seniorClassRooms.get(0).getStudent().getId());
                one2OneAnonySession.setStudentName1(seniorClassRooms.get(0).getStudent().getNickName());
                one2OneAnonySession.setStudentLogo(seniorClassRooms.get(0).getStudent().getPic());
        }
        one2OneAnonySession.setType(4);
    }

    private void initOne2TwoAnonySession(One2TwoAnonySession one2TwoAnonySession){
        one2TwoAnonySession.initWithSession(this.getCourseClass());
        if(this.getSessionUserId() != null){
                BaseUser user = baseUserDao.findById(this.getSessionUserId());
                one2TwoAnonySession.setUserID(Utils.getEmptyInteger(user.getId()));
                one2TwoAnonySession.setUserName(Utils.getEmptyString(user.getNickName()));
        }else {
              one2TwoAnonySession.setUserName("Anony"+(this.getCourseClass().getAnonyNum()==null? new Integer(0):courseClass.getAnonyNum()).toString());
              if(courseClass.getAnonyNum()!=null){
                  courseClass.setAnonyNum(courseClass.getAnonyNum()+1);
              }else {
                  courseClass.setAnonyNum(1);
              }
              classDao.persistAbstract(courseClass);
        }
        List<SeniorClassRoom> seniorClassRooms = seniorClassRoomDao.findClassRoomByCourseId(courseClass.getCourse().getId());
        if(seniorClassRooms.size()!=0){
            one2TwoAnonySession.setStudentID1(seniorClassRooms.get(0).getStudent().getId());
            one2TwoAnonySession.setStudentName1(seniorClassRooms.get(0).getStudent().getNickName());
            one2TwoAnonySession.setStudentLogo1(seniorClassRooms.get(0).getStudent().getPic());
            if(seniorClassRooms.size()>1){
                one2TwoAnonySession.setStudentID2(seniorClassRooms.get(1).getStudent().getId());
                one2TwoAnonySession.setStudentName2(seniorClassRooms.get(1).getStudent().getNickName());
                one2TwoAnonySession.setStudentLogo2(seniorClassRooms.get(1).getStudent().getPic());
            }
        }
        one2TwoAnonySession.setType(4);
    }

    private void initOne2ThreeAnonySession(One2ThreeAnonySession one2ThreeAnonySession){
        one2ThreeAnonySession.initWithSession(this.getCourseClass());
        if(this.getSessionUserId()!=null){
            BaseUser user = baseUserDao.findById(this.getSessionUserId());
            one2ThreeAnonySession.setUserID(Utils.getEmptyInteger(user.getId()));
            one2ThreeAnonySession.setUserName(Utils.getEmptyString(user.getNickName()));
        }else {
              one2ThreeAnonySession.setUserName("Anony"+(this.getCourseClass().getAnonyNum()==null? new Integer(0):courseClass.getAnonyNum()).toString());
              if(courseClass.getAnonyNum()!=null){
                  courseClass.setAnonyNum(courseClass.getAnonyNum()+1);
              }else {
                  courseClass.setAnonyNum(1);
              }
              classDao.persistAbstract(courseClass);
        }
        List<SeniorClassRoom> seniorClassRooms = seniorClassRoomDao.findClassRoomByCourseId(courseClass.getCourse().getId());
        if(seniorClassRooms.size()!=0){
            one2ThreeAnonySession.setStudentID1(seniorClassRooms.get(0).getStudent().getId());
            one2ThreeAnonySession.setStudentName1(seniorClassRooms.get(0).getStudent().getNickName());
            one2ThreeAnonySession.setStudentLogo1(seniorClassRooms.get(0).getStudent().getPic());
            if(seniorClassRooms.size()>1){
                one2ThreeAnonySession.setStudentID2(seniorClassRooms.get(1).getStudent().getId());
                one2ThreeAnonySession.setStudentName2(seniorClassRooms.get(1).getStudent().getNickName());
                one2ThreeAnonySession.setStudentLogo2(seniorClassRooms.get(1).getStudent().getPic());
            }
            if(seniorClassRooms.size()>2){
                one2ThreeAnonySession.setStudentID3(seniorClassRooms.get(2).getStudent().getId());
                one2ThreeAnonySession.setStudentName3(seniorClassRooms.get(2).getStudent().getNickName());
                one2ThreeAnonySession.setStudentLogo3(seniorClassRooms.get(2).getStudent().getPic());
            }
        }
        one2ThreeAnonySession.setType(4);

    }

    private void initOne2ManyAnonySession(One2ManyAnonySession one2ManyAnonySession){
        one2ManyAnonySession.initWithSession(this.courseClass);
        if(this.getSessionUserId()!=null){
              BaseUser user = baseUserDao.findById(this.getSessionUserId());
              one2ManyAnonySession.setUserID(Utils.getEmptyInteger(user==null?0:user.getId()));
              one2ManyAnonySession.setUserName(Utils.getEmptyString(user==null?"":user.getNickName()));
        }else {
              one2ManyAnonySession.setUserName("Anony"+(this.getCourseClass().getAnonyNum()==null? new Integer(0):courseClass.getAnonyNum()).toString());
              if(courseClass.getAnonyNum()!=null){
                  courseClass.setAnonyNum(courseClass.getAnonyNum()+1);
              }else {
                  courseClass.setAnonyNum(1);
              }
              classDao.persistAbstract(courseClass);
        }
        one2ManyAnonySession.setType(4);
    }

    private void initOne2twoTeacherSession(One2twoTeacherSession one2twoTeacherSession){
        one2twoTeacherSession.initWithSession(this.getCourseClass());
        BaseUser user = baseUserDao.findById(this.getSessionUserId());
        one2twoTeacherSession.setUserID(user.getId());
        one2twoTeacherSession.setUserName(user.getNickName());
        List<SeniorClassRoom> seniorClassRooms = seniorClassRoomDao.findClassRoomByCourseId(courseClass.getCourse().getId());
        if(seniorClassRooms.size() != 0){
            if(seniorClassRooms.get(0)!=null){
                one2twoTeacherSession.setStudentID1(seniorClassRooms.get(0).getStudent().getId());
                one2twoTeacherSession.setStudentName1(seniorClassRooms.get(0).getStudent().getNickName());
            }
            if(seniorClassRooms.size()>1){
               one2twoTeacherSession.setStudentID2(seniorClassRooms.get(1).getStudent().getId());
               one2twoTeacherSession.setStudentName2(seniorClassRooms.get(1).getStudent().getNickName());
            }

        }
    }

    private void initOne2twoStudentSession(One2twoStudentSession one2twoStudentSession){
        one2twoStudentSession.initWithSession(this.getCourseClass());
        BaseUser user = baseUserDao.findById(this.getSessionUserId());
        one2twoStudentSession.setUserID(user.getId());
        one2twoStudentSession.setUserName(user.getNickName());
        List<SeniorClassRoom> seniorClassRooms = seniorClassRoomDao.findClassRoomByCourseId(courseClass.getCourse().getId());
        if(seniorClassRooms.size()!=0){
            if(seniorClassRooms.get(0)!=null){
                if(seniorClassRooms.get(0).getStudent().getId()!=this.getSessionUserId()){
                   one2twoStudentSession.setStudentID1(seniorClassRooms.get(0).getStudent().getId());
                   one2twoStudentSession.setStudentName1(seniorClassRooms.get(0).getStudent().getNickName());
                }else {
                    if(seniorClassRooms.size()>1){
                      one2twoStudentSession.setStudentID1(seniorClassRooms.get(1).getStudent().getId());
                      one2twoStudentSession.setStudentName1(seniorClassRooms.get(1).getStudent().getNickName());
                    }
                }
            }
        }
    }


    private void initOne2threeTeacherSession(One2threeTeacherSession one2threeTeacherSession){
        one2threeTeacherSession.initWithSession(this.getCourseClass());
        BaseUser user = baseUserDao.findById(this.getSessionUserId());
        one2threeTeacherSession.setUserID(user.getId());
        one2threeTeacherSession.setUserName(user.getNickName());
        List<SeniorClassRoom> seniorClassRooms = seniorClassRoomDao.findClassRoomByCourseId(courseClass.getCourse().getId());
        if(seniorClassRooms.size()!=0){
            one2threeTeacherSession.setStudentID1(seniorClassRooms.get(0).getStudent().getId());
            one2threeTeacherSession.setStudentName1(seniorClassRooms.get(0).getStudent().getNickName());
            if(seniorClassRooms.size()>1){
                one2threeTeacherSession.setStudentID2(seniorClassRooms.get(1).getStudent().getId());
                one2threeTeacherSession.setStudentName2(seniorClassRooms.get(1).getStudent().getNickName());
            }
            if(seniorClassRooms.size()>2){
                one2threeTeacherSession.setStudentID3(seniorClassRooms.get(2).getStudent().getId());
                one2threeTeacherSession.setStudentName3(seniorClassRooms.get(2).getStudent().getNickName());
            }
        }
    }

    private void initOne2threeStudentSession(One2threeStudentSession one2threeStudentSession){
        one2threeStudentSession.initWithSession(this.getCourseClass());
        BaseUser user = baseUserDao.findById(this.getSessionUserId());
        one2threeStudentSession.setUserID(Utils.getEmptyInteger(user.getId()));
        one2threeStudentSession.setUserName(Utils.getEmptyString(user.getNickName()));
        List<SeniorClassRoom> seniorClassRooms = seniorClassRoomDao.findClassRoomByCourseId(courseClass.getCourse().getId());
        Integer studentNum = seniorClassRooms.size();
        if(studentNum==3){
            if(seniorClassRooms.get(0).getStudent().getId()==this.getSessionUserId()){
                one2threeStudentSession.setStudentID1(seniorClassRooms.get(1).getStudent().getId());
                one2threeStudentSession.setStudentName1(seniorClassRooms.get(1).getStudent().getNickName());
                one2threeStudentSession.setStudentID2(seniorClassRooms.get(2).getStudent().getId());
                one2threeStudentSession.setStudentName2(seniorClassRooms.get(2).getStudent().getNickName());
            }else if(seniorClassRooms.get(1).getStudent().getId()==this.getSessionUserId()){
                one2threeStudentSession.setStudentID1(seniorClassRooms.get(0).getStudent().getId());
                one2threeStudentSession.setStudentName1(seniorClassRooms.get(0).getStudent().getNickName());
                one2threeStudentSession.setStudentID2(seniorClassRooms.get(2).getStudent().getId());
                one2threeStudentSession.setStudentName2(seniorClassRooms.get(2).getStudent().getNickName());
            }else if(seniorClassRooms.get(2).getStudent().getId()==this.getSessionUserId()){
                one2threeStudentSession.setStudentID1(seniorClassRooms.get(0).getStudent().getId());
                one2threeStudentSession.setStudentName1(seniorClassRooms.get(0).getStudent().getNickName());
                one2threeStudentSession.setStudentID2(seniorClassRooms.get(1).getStudent().getId());
                one2threeStudentSession.setStudentName2(seniorClassRooms.get(1).getStudent().getNickName());
            }
        }else if(studentNum==2){
            if(seniorClassRooms.get(0).getStudent().getId()==this.getSessionUserId()){
                one2threeStudentSession.setStudentID1(seniorClassRooms.get(1).getStudent().getId());
                one2threeStudentSession.setStudentName1(seniorClassRooms.get(1).getStudent().getNickName());
            }else {
                one2threeStudentSession.setStudentID1(seniorClassRooms.get(0).getStudent().getId());
                one2threeStudentSession.setStudentName1(seniorClassRooms.get(0).getStudent().getNickName());
            }
        }

    }


    private void initOne2manyTeacherSession(One2ManyTeacherSession one2ManyTeacherSession){
        one2ManyTeacherSession.initWithSession(this.getCourseClass());
         BaseUser user = baseUserDao.findById(this.getSessionUserId());
        one2ManyTeacherSession.setUserID(Utils.getEmptyInteger(user.getId()));
        one2ManyTeacherSession.setUserName(Utils.getEmptyString(user.getNickName()));
        if(user.getPic()!=null){
            one2ManyTeacherSession.setUserLogo(user.getPic());
        }
    }

    private void initOne2ManyTeacherSessionForShow(One2ManyTeacherSession one2ManyTeacherSession){

    }

    private void initOne2manyStudentSession(One2ManyStudentSession one2ManyStudentSession){
        one2ManyStudentSession.initWithSession(this.getCourseClass());
        BaseUser user = baseUserDao.findById(this.getSessionUserId());
        one2ManyStudentSession.setUserID(user.getId());
        one2ManyStudentSession.setUserName(user.getNickName());
        if(user.getPic()!=null)
            one2ManyStudentSession.setUserLogo(user.getPic());
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
