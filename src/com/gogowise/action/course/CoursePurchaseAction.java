package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.dao.CourseInviteStudentDao;
import com.gogowise.rep.course.dao.SeniorClassRoomDao;
import com.gogowise.rep.course.enity.CourseInviteStudent;
import com.gogowise.rep.course.enity.SeniorClassRoom;
import com.gogowise.rep.finance.ConsumptionOrderDao;
import com.gogowise.rep.system.MatterDao;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.finance.UserAccountInfoDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.system.enity.Matter;
import com.gogowise.rep.finance.enity.UserAccountInfo;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.EmailUtil;
import com.gogowise.common.utils.PdfUtil;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Result(name = "input", type = Constants.RESULT_NAME_TILES, location = ".purchaseError")
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
    private String purchaseConfirmMsg;
    private MatterDao matterDao;
    @Autowired
    private CourseInviteStudentDao courseInviteStudentDao;

    @Action(value = "initCourseconfirm", results = { @Result(name = SUCCESS, type = "tiles", location = ".courseconfirm"), @Result(name = LOGIN, type = Constants.RESULT_NAME_TILES, location = ".identityConfirmation")
    //                    ,
    //                       @Result(name = "myCourseCenter",type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "myForcastClass", "course.id", "${course.id}"}),
    //                       @Result(name = "voa",type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "voaCourseBlog","course.id","${course.id}","purchaseConfirmMsg","${purchaseConfirmMsg}"})
    })
    public String initCourseconfirm() throws Exception {

        course = courseDao.findById(course.getId());
        if (this.getSessionUserId() == null) {
            return LOGIN;
        }
        user = baseUserDao.findById(this.getSessionUserId());
        userAccountInfo = userAccountInfoDao.findByUserId(this.getSessionUserId());
        this.setOperaType(Constants.OPERA_TYPE_FOR_COURSE_CREATION);
        return SUCCESS;
    }

    @Action(value = "purchaseCourse", results = { @Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = { "actionName", "personalCenter" }), @Result(name = ERROR, type = Constants.RESULT_NAME_TILES, location = ".courseconfirm"), @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".courseconfirm") })
    public String purchaseCourse() throws Exception {

        course = courseDao.findById(this.course.getId());
        user = baseUserDao.findById(getSessionUserId());

        seniorClassRoomDao.saveSeniorClassRoom(this.course.getId(), this.getSessionUserId());

        consumptionOrderDao.purchaseCourse(user, course);

        sendPurchaseEmail();

        Matter matter = new Matter(Calendar.getInstance(), this.getSessionNickName() + (new SimpleDateFormat("yyyyddMMHHmmssms").format(Calendar.getInstance().getTime())), Matter.MATTER_COURSE_REGISTER, baseUserDao.findByEmail(this.getSessionUserEmail()), null, course.getTeacherEmail() == (null) ? course.getTeacher().getEmail() : course.getTeacherEmail(), course, false);
        matterDao.persistAbstract(matter);

        return SUCCESS;
    }

    private void sendPurchaseEmail() {

        String filePath = ServletActionContext.getServletContext().getRealPath("/");
        filePath += Constants.DOWNLOAD_CONTRACT + File.separator + course.getId() + File.separator + course.getName() + ".pdf";

        //send email to student
        String tile = this.getText("course.pdf.title", new String[] { user.getNickName(), course.getName() });
        String content = this.getText("course.pdf.content", new String[] { user.getNickName(), course.getName() });

        try {
            PdfUtil.createCourseContract(filePath, course, baseUserDao.findById(getSessionUserId()));
            EmailUtil.sendMail(user.getEmail(), tile, content, new String[] { "contract.pdf" }, new String[] { filePath });

            //send email to teacher
            tile = this.getText("course.pdf.title", new String[] { user.getNickName(), course.getName() });
            if (course.getOrganization() != null) {
                EmailUtil.sendMail(course.getOrganization().getResponsiblePerson().getEmail(), tile, content, new String[] { "contract.pdf" }, new String[] { filePath });
            } else {
                content = this.getText("course.pdf.content", new String[] { course.getTeacher().getNickName() });
                EmailUtil.sendMail(course.getTeacher().getEmail(), tile, content, new String[] { "contract.pdf" }, new String[] { filePath });
            }
            EmailUtil.sendMail(Constants.COURSE_CONFIRM_EMAIL, tile, content, new String[] { "contract.pdf" }, new String[] { filePath });
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void validatePurchaseCourse() throws Exception {

        validateBeforePurchase();
    }

    private void validateBeforePurchase() {

        course = courseDao.findById(this.course.getId());
        user = baseUserDao.findById(getSessionUserId());
        Double cost;
        cost = course.getCharges();
        UserAccountInfo _userAccountInfo = userAccountInfoDao.findByUserId(user.getId());
        if (course.getConsumptionType() && cost > _userAccountInfo.getZhiBi()) {
            this.addActionErrorInfoWithKey("msg.zhibi.not.enough");
            return;
        }
        if (!course.getConsumptionType() && cost > (_userAccountInfo.getZhiBi() + _userAccountInfo.getZhiQuan())) {
            this.addActionErrorInfoWithKey("msg.account.left.not.enough");
            return;
        }
        if (existInStudentInvitation(course, user.getEmail())) {
            this.addActionErrorInfoWithKey("course.exist.in.studentInvitation"); //您是被邀请的用户，请在您的邮件中点击接受完成购买
            return;
        }
        if (isNeed(course, user.getEmail())) {
            this.addActionErrorInfoWithKey("course.identity.exist"); //   您不需要购买该课程
            return;
        }
        //        if (limitNumOver(course)) {
        //            return "course.studentNum.overflow"; //对不起，该课程预定人数已满
        //        }

        if (existInRoom(course.getId(), getSessionUserId())) {
            this.addActionErrorInfoWithKey("course.already.observation"); //您已经购买了该课程
        }

    }

    private Boolean isNeed(Course course, String userEmail) {

        // return true suggest that the user is already an menber of the coures
        if (course.getTeacher() != null && course.getTeacher().getEmail().equals(userEmail)) {
            return true;
        } else if (course.getTeacherEmail() != null && course.getTeacherEmail().equals(userEmail)) {
            return true;
        } else if (course.getOrganization() != null && course.getOrganization().getResponsiblePerson().getEmail().equals(userEmail)) {
            return true;
        }
        return false;
    }

    private Boolean existInStudentInvitation(Course course, String email) {

        CourseInviteStudent courseInviteStudent = courseInviteStudentDao.findByCourseAndEmail(course.getId(), email);
        return courseInviteStudent != null;
    }

    private Boolean existInRoom(Integer cid, Integer uid) {

        SeniorClassRoom scr = seniorClassRoomDao.findClassRoomByCourseAndStudent(cid, uid);
        return scr != null;
    }

    @Action(value = "courseconfirm")
    public String courseconfirm() throws Exception {

        this.course = courseDao.findById(this.course.getId());
        this.user = baseUserDao.findById(getSessionUserId());

        validateBeforePurchase();
        if (this.getPurchaseConfirmMsg() != null) {
            this.setMessage(this.getPurchaseConfirmMsg());
            return RESULT_JSON;
        }

        seniorClassRoomDao.saveSeniorClassRoom(this.course.getId(), this.getSessionUserId());

        //            courseDao.confirmCourse(this.course.getId(), this.getSessionUserId());
        consumptionOrderDao.purchaseCourse(user, course);
        String filePath = Constants.DOWNLOAD_CONTRACT + course.getId() + "/" + course.getName() + ".pdf";
        String tile = this.getText("course.pdf.title", new String[] { user.getNickName(), course.getName() });
        String content = this.getText("course.pdf.content");
        PdfUtil.createCourseContract(filePath, course, baseUserDao.findById(getSessionUserId()));
        EmailUtil.sendMail(user.getEmail(), tile, content, new String[] { "contract.pdf" }, new String[] { filePath });
        if (course.getOrganization() != null) {
            EmailUtil.sendMail(course.getOrganization().getResponsiblePerson().getEmail(), tile, content, new String[] { "contract.pdf" }, new String[] { filePath });
        } else {
            EmailUtil.sendMail(course.getTeacher().getEmail(), tile, content, new String[] { "contract.pdf" }, new String[] { filePath });
        }
        EmailUtil.sendMail(Constants.COURSE_CONFIRM_EMAIL, tile, content, new String[] { "contract.pdf" }, new String[] { filePath });
        this.state = true;
        this.message = this.getText("course.first.observation");

        userAccountInfo = userAccountInfoDao.findByUserId(this.getSessionUserId());
        zhiBi = userAccountInfo.getZhiBi();
        zhiQuan = userAccountInfo.getZhiQuan();

        Matter matter = new Matter(Calendar.getInstance(), this.getSessionNickName() + (new SimpleDateFormat("yyyyddMMHHmmssms").format(Calendar.getInstance().getTime())), Matter.MATTER_COURSE_REGISTER, baseUserDao.findByEmail(this.getSessionUserEmail()), null, course.getTeacherEmail() == (null) ? course.getTeacher().getEmail() : course.getTeacherEmail(), course, false);
        matterDao.persistAbstract(matter);

        return "json";
    }

    @Action(value = "initCourseRefund", results = { @Result(name = SUCCESS, type = "tiles", location = ".refund") })
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

    public String getPurchaseConfirmMsg() {

        return purchaseConfirmMsg;
    }

    public void setPurchaseConfirmMsg(String purchaseConfirmMsg) {

        this.purchaseConfirmMsg = purchaseConfirmMsg;
    }

}
