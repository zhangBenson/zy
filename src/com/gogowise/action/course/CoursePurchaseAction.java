package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.repository.course.CourseDao;
import com.gogowise.repository.course.SeniorClassRoomDao;
import com.gogowise.repository.finance.ConsumptionOrderDao;
import com.gogowise.repository.system.MatterDao;
import com.gogowise.repository.user.BaseUserDao;
import com.gogowise.repository.user.UserAccountInfoDao;
import com.gogowise.domain.user.BaseUser;
import com.gogowise.domain.course.Course;
import com.gogowise.domain.live.Matter;
import com.gogowise.domain.finance.UserAccountInfo;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.EmailUtil;
import com.gogowise.common.utils.PdfUtil;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;


@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({
        @Result(name = "json", type = "json")
})
public class CoursePurchaseAction extends BasicAction {
    private Course course;
    private BaseUser user;
    private Integer operaType;
    private String message;
    private Double zhiBi = 0.000;
    private Double zhiQuan = 0.000;
    private boolean state = false;
    private String comments;
    private UserAccountInfo userAccountInfo;

    private BaseUserDao baseUserDao;
    private CourseDao courseDao;
    private ConsumptionOrderDao consumptionOrderDao;
    private SeniorClassRoomDao seniorClassRoomDao;
    private UserAccountInfoDao userAccountInfoDao;
    private String purchaseMsg;
    private String purchaseConfirmMsg;
    private MatterDao matterDao;


    @Action(value = "initCourseconfirm",
            results = {@Result(name = SUCCESS, type = "tiles", location = ".courseconfirm"),
                       @Result(name = LOGIN,type = Constants.RESULT_NAME_TILES,location = ".identityConfirmation")
//                    ,
//                       @Result(name = "myCourseCenter",type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "myForcastClass", "course.id", "${course.id}"}),
//                       @Result(name = "voa",type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "voaCourseBlog","course.id","${course.id}","purchaseConfirmMsg","${purchaseConfirmMsg}"})
                     })
    public String initCourseconfirm() throws Exception{
        course = courseDao.findById(course.getId());
        if(this.getSessionUserId()==null){
            return LOGIN;
        }
        user = baseUserDao.findById(this.getSessionUserId());
        userAccountInfo = userAccountInfoDao.findByUserId(this.getSessionUserId());
        this.setOperaType(Constants.OPERA_TYPE_FOR_COURSE_CREATION);
        return SUCCESS;
    }

    @Action(value = "purchaseCourse",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "myRegistration"}),
                                                  @Result(name = INPUT,type = Constants.RESULT_NAME_TILES,location = ".courseconfirm")})
    public String purchaseCourse() throws Exception{
            course = courseDao.findById(this.course.getId());
            user = baseUserDao.findById(getSessionUserId());
            consumptionOrderDao.purchaseCourse(user, course);
            String filePath = "d:/contract/" + course.getName() + ".pdf";
            String tile = this.getText("course.pdf.title",new String[]{user.getNickName(),course.getName()});
            String content = this.getText("course.pdf.content");
            PdfUtil.createCourseContract(filePath,course, baseUserDao.findById(getSessionUserId()));
            EmailUtil.sendMail(user.getEmail(), tile, content, new String[]{"contract.pdf"}, new String[]{filePath});
            if(course.getOrganization() != null){
                EmailUtil.sendMail(course.getOrganization().getResponsiblePerson().getEmail(), tile, content, new String[]{"contract.pdf"}, new String[]{filePath});
            }else {
               EmailUtil.sendMail(course.getTeacher().getEmail(), tile, content, new String[]{"contract.pdf"}, new String[]{filePath});
            }
            EmailUtil.sendMail(Constants.COURSE_CONFIRM_EMAIL, tile, content, new String[]{"contract.pdf"}, new String[]{filePath});
        return SUCCESS;
    }

    public void validatePurchaseCourse() throws Exception{
        course = courseDao.findById(this.course.getId());
        user = baseUserDao.findById(getSessionUserId());
        Double cost = 0.000;
        cost = course.getCharges();
        UserAccountInfo _userAccountInfo = userAccountInfoDao.findByUserId(user.getId());
        if (course.getConsumptionType() && cost > _userAccountInfo.getZhiBi()) {
            this.setPurchaseMsg(this.getText("msg.zhibi.not.enough"));
            addFieldError("","");
            return;
        }
        if (!course.getConsumptionType() && cost > (_userAccountInfo.getZhiBi() + _userAccountInfo.getZhiQuan())) {
            this.setPurchaseMsg(this.getText("msg.account.left.not.enough"));
            addFieldError("","");
            return;
        }
        String msg = seniorClassRoomDao.saveSeniorClassRoom(this.course.getId(), this.getSessionUserId());
        if (msg != null && !msg.equals("course.first.observation")) {
            this.setPurchaseMsg(this.getText(msg));
            addFieldError("","");
            return;
        }

    }

    @Action(value = "courseconfirm")
    public String courseconfirm() throws Exception {
        this.course = courseDao.findById(this.course.getId());
        this.user = baseUserDao.findById(getSessionUserId());


        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Double cost = 0.000;
        cost = course.getCharges();
        UserAccountInfo _userAccountInfo = userAccountInfoDao.findByUserId(user.getId());
        if (course.getConsumptionType() && cost > _userAccountInfo.getZhiBi()) {
            message = this.getText("msg.zhibi.not.enough");
            return "json";
        }
        if (!course.getConsumptionType() && cost > (_userAccountInfo.getZhiBi() + _userAccountInfo.getZhiQuan())) {
            message = this.getText("msg.account.left.not.enough");
            return "json";
        }
        String msg = seniorClassRoomDao.saveSeniorClassRoom(this.course.getId(), this.getSessionUserId());
        if (msg != null && msg.equals("course.first.observation")) {
//            courseDao.confirmCourse(this.course.getId(), this.getSessionUserId());
            consumptionOrderDao.purchaseCourse(user, course);
            String filePath = "d:/contract/" + course.getName() + ".pdf";
            String tile = this.getText("course.pdf.title",new String[]{user.getNickName(),course.getName()});
            String content = this.getText("course.pdf.content");
            PdfUtil.createCourseContract(filePath,course, baseUserDao.findById(getSessionUserId()));
            EmailUtil.sendMail(user.getEmail(), tile, content, new String[]{"contract.pdf"}, new String[]{filePath});
            if(course.getOrganization() != null){
                EmailUtil.sendMail(course.getOrganization().getResponsiblePerson().getEmail(), tile, content, new String[]{"contract.pdf"}, new String[]{filePath});
            }else {
               EmailUtil.sendMail(course.getTeacher().getEmail(), tile, content, new String[]{"contract.pdf"}, new String[]{filePath});
            }
            EmailUtil.sendMail(Constants.COURSE_CONFIRM_EMAIL, tile, content, new String[]{"contract.pdf"}, new String[]{filePath});
            this.state = true;
            this.message = this.getText("course.first.observation");
        } else if (msg != null){
            message = this.getText(msg);
            return "json";
        }

        userAccountInfo = userAccountInfoDao.findByUserId(this.getSessionUserId());
        zhiBi = userAccountInfo.getZhiBi();
        zhiQuan = userAccountInfo.getZhiQuan();

        Matter matter =new Matter(Calendar.getInstance(),this.getSessionNickName()+(new SimpleDateFormat("yyyyddMMHHmmssms").format(Calendar.getInstance().getTime())),Matter.MATTER_COURSE_REGISTER,baseUserDao.findByEmail(this.getSessionUserEmail()),null,course.getTeacherEmail()==(null)? course.getTeacher().getEmail():course.getTeacherEmail(),course,null,null,null,false);
        matterDao.persistAbstract(matter);

        return "json";
    }

    @Action(value = "initCourseRefund",
            results = {@Result(name = SUCCESS, type = "tiles", location = ".refund")}
    )
    public String initCourseRefund() {
//        course = courseDao.findById(course.getId());
//        user = baseUserDao.findById((Integer) ActionContext.getContext().getSession().get(Constants.SESSION_USER_ID));
        return SUCCESS;
    }

//    @Action(value = "courseRefund")
//    public String courseRefund() {
//        course = courseDao.findById(course.getId());
//        user = baseUserDao.findById((Integer) ActionContext.getContext().getSession().get(Constants.SESSION_USER_ID));
//        String msg = seniorClassRoomDao.deleteSeniorClassRoom(course.getId(), user.getId());
//        if (msg.equals("course.reg.success")) {
//            consumptionOrderDao.refound(course.getId(), user.getId(), comments);
//            this.state = true;
//        }
//        user = baseUserDao.findById(getSessionUserId());
//        userAccountInfo = userAccountInfoDao.findByUserId(this.getSessionUserId());
//        zhiBi = userAccountInfo.getZhiBi();
//        zhiQuan = userAccountInfo.getZhiQuan();
//        this.message = getText(msg);
//        return "json";
//    }

    @JSON(serialize = false)
    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
    @JSON(serialize = false)
    public BaseUser getUser() {
        return user;
    }


    public void setUser(BaseUser user) {
        this.user = user;
    }

    public Integer getOperaType() {
        return operaType;
    }

    public void setOperaType(Integer operaType) {
        this.operaType = operaType;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Double getZhiBi() {
        return zhiBi;
    }

    public void setZhiBi(Double zhiBi) {
        this.zhiBi = zhiBi;
    }

    public Double getZhiQuan() {
        return zhiQuan;
    }

    public void setZhiQuan(Double zhiQuan) {
        this.zhiQuan = zhiQuan;
    }

    public boolean isState() {
        return state;
    }

    public void setState(boolean state) {
        this.state = state;
    }

    @JSON(serialize = false)
    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    @JSON(serialize = false)
    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    @JSON(serialize = false)
    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    @JSON(serialize = false)
    public ConsumptionOrderDao getConsumptionOrderDao() {
        return consumptionOrderDao;
    }

    public void setConsumptionOrderDao(ConsumptionOrderDao consumptionOrderDao) {
        this.consumptionOrderDao = consumptionOrderDao;
    }

    @JSON(serialize = false)
    public SeniorClassRoomDao getSeniorClassRoomDao() {
        return seniorClassRoomDao;
    }

    public void setSeniorClassRoomDao(SeniorClassRoomDao seniorClassRoomDao) {
        this.seniorClassRoomDao = seniorClassRoomDao;
    }

    @JSON(serialize = false)
    public UserAccountInfo getUserAccountInfo() {
        return userAccountInfo;
    }

    public void setUserAccountInfo(UserAccountInfo userAccountInfo) {
        this.userAccountInfo = userAccountInfo;
    }

    @JSON(serialize = false)
    public UserAccountInfoDao getUserAccountInfoDao() {
        return userAccountInfoDao;
    }

    public void setUserAccountInfoDao(UserAccountInfoDao userAccountInfoDao) {
        this.userAccountInfoDao = userAccountInfoDao;
    }
    @JSON(serialize = false)
    public MatterDao getMatterDao() {
        return matterDao;
    }

    public void setMatterDao(MatterDao matterDao) {
        this.matterDao = matterDao;
    }

    public String getPurchaseMsg() {
        return purchaseMsg;
    }

    public void setPurchaseMsg(String purchaseMsg) {
        this.purchaseMsg = purchaseMsg;
    }

    public String getPurchaseConfirmMsg() {
        return purchaseConfirmMsg;
    }

    public void setPurchaseConfirmMsg(String purchaseConfirmMsg) {
        this.purchaseConfirmMsg = purchaseConfirmMsg;
    }

}
