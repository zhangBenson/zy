package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.user.BaseUserDao;
import com.gogowise.dao.course.CourseCommentDao;
import com.gogowise.dao.course.CourseDao;
import com.gogowise.dao.course.MatterDao;
import com.gogowise.domain.*;
import com.gogowise.utils.Constants;
import com.gogowise.utils.EmailUtil;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;


/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-22
 * Time: 下午2:44
 * To change this template use File | Settings | File Templates.
 */
@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class CourseCommentAction extends BasicAction {
    /**
     *
     */
    private static final long serialVersionUID = -9146970472337494283L;
    private CourseCommentDao courseCommentDao;
    private CourseDao courseDao;
    private BaseUser user;
    private BaseUserDao baseUserDao;
    private CourseComment courseComment;
    private Course course;
    private List<CourseComment> courseComments = new ArrayList<CourseComment>();
    private Pagination page = new Pagination();
    private Integer commentsNum;
    private Boolean commentsNumOverflow = false;
    private MatterDao matterDao;


    @Action(value = "saveComment", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES,location =".courseComment")})
    public String saveComment() {
        String serialNo=  this.getSessionNickName()+(new SimpleDateFormat("yyyyddMMHHmmssms").format(Calendar.getInstance().getTime()));
        BaseUser commenter = baseUserDao.findById(this.getSessionUserId());
        course = courseDao.findById(this.getCourse().getId());
        courseComment.setCourse(course);
        courseComment.setCommenter(commenter);
        courseComment.setCommentTime(Calendar.getInstance());
        Integer toFriendID = (Integer) ActionContext.getContext().getSession().get("toReplyerUserID");
        if( toFriendID != null){
            BaseUser toFriend = baseUserDao.findById(toFriendID);
            courseComment.setFriend(toFriend);
            ActionContext.getContext().getSession().remove("toReplyerUserID");
        }
        courseCommentDao.persistAbstract(courseComment);
        Pagination page = new Pagination(commentsNum+1);
        courseComments = courseCommentDao.findByCourseId(page,course.getId());
        this.setCommentsNum(courseComments.size());
        if(page.getTotalSize() <= commentsNum){
            this.setCommentsNumOverflow(true);
        }
        if(this.getSessionUserId().equals(course.getTeacher() != null?course.getTeacher().getId():0)){
            for(SeniorClassRoom seniorClassRoom: course.getSeniorClassRooms()){      // teacher left a message for a course then send the message to all students

                Matter matter =new Matter(Calendar.getInstance(),serialNo,Matter.MATTER_COURSE_MESSAGE,baseUserDao.findByEmail(this.getSessionUserEmail()),null,seniorClassRoom.getStudent().getEmail(),course,null,null,null,false);
                 String href = getBasePath() + "/voaCourseBlog.html?course.id="+course.getId();
                 String title = this.getText("course.blog.teacher.comment.to.st.title",new String[]{course.getTeacher().getNickName(),course.getName()});
                 String content = this.getText("course.blog.teacher.comment.to.st.content",new String[]{
                         seniorClassRoom.getStudent().getNickName(),
                         course.getTeacher().getNickName(),
                         course.getName(),
                         courseComment.getContent(),
                         href,href
                 });
                EmailUtil.sendMail(seniorClassRoom.getStudent().getEmail(),title,content);
                matterDao.persistAbstract(matter);
            }
        }else {          // student or other user left a message for a course then send the email to teacher
            if(course.getTeacher() != null && course.getTeacher().getEmail()!=null){
                 String href = getBasePath() + "/voaCourseBlog.html?course.id="+course.getId();
                 String title = this.getText("course.blog.student.comment.to.tea.title",new String[]{this.getSessionNickName(),course.getName()});
                 String content = this.getText("course.blog.student.comment.to.tea.content",new String[]{
                         course.getTeacher().getNickName(),
                         this.getSessionNickName(),
                         course.getName(),
                         courseComment.getContent(),
                         href,href
                 });
                 EmailUtil.sendMail(course.getTeacher().getEmail(),title,content);
                 Matter matter =new Matter(Calendar.getInstance(),serialNo,Matter.MATTER_COURSE_MESSAGE,baseUserDao.findByEmail(this.getSessionUserEmail()),null,course.getTeacher().getEmail(),course,null,null,null,false);
                 matterDao.persistAbstract(matter);
             }

        }
        return SUCCESS;
    }

    @Action(value = "moreCourseComments",results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES,location =".courseComment")})
    public String moreComments(){
        Pagination page = new Pagination(this.getCommentsNum()+Constants.DEFAULT_PAGE_OF_COMMENTS_INCREASED_SIZE);
        courseComments = courseCommentDao.findByCourseId(page,this.getCourse().getId());
        this.setCommentsNum(courseComments.size());
        if(page.getTotalSize() <= commentsNum){
            this.setCommentsNumOverflow(true);
        }
        return SUCCESS;
    }

    @Action(value = "deleteCourseComment")
    public void deleteCourseComment(){
        courseComment = courseCommentDao.findById(this.getCourseComment().getId());
        courseCommentDao.delete(courseComment);
    }

    @Action(value = "saveChatRecord")
    public void saveChatRecord(){
        BaseUser commenter = baseUserDao.findById(this.getUser().getId());
        course = courseDao.findById(this.getCourse().getId());
        courseComment.setCourse(course);
        courseComment.setCommenter(commenter);
        courseComment.setCommentTime(Calendar.getInstance());
        courseCommentDao.persistAbstract(courseComment);
    }

    @Action(value = "initCourseComment", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location =".courseComment")})
    public String initCourseComment() {
        course = courseDao.findById(this.getCourse().getId());
        courseComments = courseCommentDao.findByCourseId(page, course.getId());
        return SUCCESS;
    }


    //==============getter and setter=================


    public CourseCommentDao getCourseCommentDao() {
        return courseCommentDao;
    }

    public void setCourseCommentDao(CourseCommentDao courseCommentDao) {
        this.courseCommentDao = courseCommentDao;
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public CourseComment getCourseComment() {
        return courseComment;
    }

    public void setCourseComment(CourseComment courseComment) {
        this.courseComment = courseComment;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public List<CourseComment> getCourseComments() {
        return courseComments;
    }

    public void setCourseComments(List<CourseComment> courseComments) {
        this.courseComments = courseComments;
    }

        public Pagination getPage() {
        return page;
    }

    public void setPage(Pagination page) {
        this.page = page;
    }

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public Integer getCommentsNum() {
        return commentsNum;
    }

    public void setCommentsNum(Integer commentsNum) {
        this.commentsNum = commentsNum;
    }

    public Boolean getCommentsNumOverflow() {
        return commentsNumOverflow;
    }

    public void setCommentsNumOverflow(Boolean commentsNumOverflow) {
        this.commentsNumOverflow = commentsNumOverflow;
    }

    public MatterDao getMatterDao() {
        return matterDao;
    }

    public void setMatterDao(MatterDao matterDao) {
        this.matterDao = matterDao;
    }


     public static void main(String arg[]){
      copy(new File("D:\\2012changsha\\黄希勇摄\\DSC_0306.JPG"),new File("\\\\WIN-H7MDJIK9LWP\\musics\\DSC_0306.JPG"));
    }
}
