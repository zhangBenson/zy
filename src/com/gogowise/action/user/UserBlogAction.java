package com.gogowise.action.user;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.BrowsedCourseDao;
import com.gogowise.rep.course.CommentsDao;
import com.gogowise.rep.course.CourseDao;
import com.gogowise.rep.course.CourseEvaluationDao;
import com.gogowise.rep.live.MyShowDao;
import com.gogowise.rep.live.PersonalOnliveDao;
import com.gogowise.rep.user.BaseUserDao;
import com.gogowise.rep.user.UserFansDao;
import com.gogowise.rep.course.enity.BrowsedCourse;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.CourseEvaluation;
import com.gogowise.rep.course.enity.SeniorClassRoom;
import com.gogowise.rep.live.live.MyShow;
import com.gogowise.rep.live.live.PersonalOnlive;
import com.gogowise.rep.live.live.ShowFans;
import com.gogowise.rep.live.live.UserFans;
import com.gogowise.rep.user.user.BaseUser;
import com.gogowise.rep.user.user.Comments;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.Utils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("UnusedDeclaration")
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class UserBlogAction extends BasicAction {

    public static Integer USER_ID;

    private BaseUserDao baseUserDao;
    private CourseDao courseDao;
    private CourseEvaluationDao courseEvaluationDao;
    private CommentsDao commentsDao;
    private BrowsedCourseDao browsedCourseDao;
    private MyShowDao myShowDao;
    private BaseUser user;
    private List<Course> coursesAsTeacher;
    private List<Course> coursesAsStudent;
    private List<CourseEvaluation> courseEvaluations;
    private List<BrowsedCourse> browsedCourses = new ArrayList<BrowsedCourse>();
    private List<Comments> comments;
    private Comments comment;
    private Integer commentsNum;
    private Boolean commentsNumOverflow = false;
    private PersonalOnlive personalOnlive;
    private PersonalOnliveDao personalOnliveDao;
    private List<PersonalOnlive> personalOnlives = new ArrayList<PersonalOnlive>();
    private UserFansDao userFansDao;
    private Boolean focused = false;  // it is used to tell if the user has focus on the blog owner
    private List<UserFans> userFanses = new ArrayList<UserFans>();
    private List<MyShow> myShows = new ArrayList<MyShow>();
    private Integer perOnlivTermsMinSquence;
    private Integer perOnlivTermsMaxSquence;
    private Integer biggestSquence;
    private Pagination pagination = new Pagination(5);



    @Action(value = "userBlog",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".userBlog")}
    )
    public String userBlog() {
        Integer userId ;
        if(this.getUser() != null && this.getUser().getId() != null){
              userId =  this.getUser().getId();
              USER_ID = userId;
        }else {
              userId = USER_ID;
        }

        user = this.baseUserDao.findById(userId);
        personalOnlive = personalOnliveDao.findLatestOneForUser(userId, new Pagination(1));
        coursesAsTeacher = courseDao.findCourses2Teacher(userId, new Pagination(3));
        coursesAsStudent = courseDao.findCourses2Student(userId, new Pagination(4));
        courseEvaluations = courseEvaluationDao.findByTeacherId(new Pagination(4), userId);


        personalOnlives = personalOnliveDao.findOnliveHistoryForUser(userId,pagination);

        if(personalOnlives.size()!=0){
            this.setPerOnlivTermsMinSquence(personalOnlives.get(personalOnlives.size()-1).getSequence());
            this.setPerOnlivTermsMaxSquence(personalOnlives.get(0).getSequence());
            this.setBiggestSquence(personalOnlives.get(0).getSequence());
        }


        comments = commentsDao.findByCommentTo(user.getId(), new Pagination(10));
        myShows = myShowDao.findByUser(user.getId(),new Pagination(4));
        userFanses = userFansDao.findAllFansForUser(userId,new Pagination(4));
        this.setCommentsNum(comments.size());
        this.browsedCourses = browsedCourseDao.findByUserId(userId);
         UserFans uf = userFansDao.findByUserAndFans(userId,this.getSessionUserId() != null?this.getSessionUserId():0);
        if(uf != null) this.setFocused(true);
        return SUCCESS;
    }

    @Action(value = "saveUserBlogComments", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".userComment")})
    public String saveUserBlogComments() {
        if (comment != null && comment.getDescription() != null) {
            if (super.getSessionUserId() != null) {
                comment.setOwner(baseUserDao.findById(super.getSessionUserId()));
                comment.setTo(baseUserDao.findById(user.getId()));
                comment.setCreateDate(Utils.getCurrentCalender());
                commentsDao.persistAbstract(comment);
            }
            comments = commentsDao.findByCommentTo(user.getId(), new Pagination(commentsNum+1));
            this.setCommentsNum(comments.size());
        }
        return SUCCESS;
    }

    @Action(value = "saveUserComments")
    public void saveUserComments(){
        BaseUser commentOwner = baseUserDao.findById(this.getComment().getOwner().getId());         //留言人
        PersonalOnlive personalOnlive = personalOnliveDao.findById(this.getPersonalOnlive().getId());
        comment.setOwner(commentOwner);
        comment.setTo(personalOnlive.getOwner());   //被留言人
        comment.setCreateDate(Utils.getCurrentCalender());
        commentsDao.persistAbstract(comment);
    }

     @Action(value = "moreUserComments",results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES,location =".userComment")})
    public String moreComments(){
        Pagination page = new Pagination(this.getCommentsNum()+Constants.DEFAULT_PAGE_OF_COMMENTS_INCREASED_SIZE);
        comments = commentsDao.findByCommentTo(user.getId(),page);
        this.setCommentsNum(comments.size());
        if(page.getTotalSize() <= commentsNum){
            this.setCommentsNumOverflow(true);
        }
        return SUCCESS;
    }

    @Action(value = "deleteUserComment")
    public void deleteUserComment(){
        comment = commentsDao.findById(this.getComment().getId());
        commentsDao.delete(comment);
    }

    @Action(value = "loadRightTerms",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".perOnliveTerms")})
    public String loadRightTerms(){
       personalOnlives = personalOnliveDao.findLitterPartOwnRecordPL(this.getUser().getId(),this.getPerOnlivTermsMinSquence(),new Pagination(4));
       if(personalOnlives.size()!=0){
            this.setPerOnlivTermsMinSquence(personalOnlives.get(personalOnlives.size()-1).getSequence());
            this.setPerOnlivTermsMaxSquence(personalOnlives.get(0).getSequence());
       }
       return SUCCESS;

    }

    @Action(value = "loadLeftTerms",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".perOnliveTerms")})
    public String loadLeftTerms(){
       personalOnlives = personalOnliveDao.findBigPartOwnRecordPL(this.getUser().getId(), this.getPerOnlivTermsMaxSquence(), new Pagination(4));
       if(personalOnlives.size()!=0){
            this.setPerOnlivTermsMinSquence(personalOnlives.get(personalOnlives.size()-1).getSequence());
            this.setPerOnlivTermsMaxSquence(personalOnlives.get(0).getSequence());
       }
       return SUCCESS;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public List<Course> getCoursesAsTeacher() {
        return coursesAsTeacher;
    }

    public void setCoursesAsTeacher(List<Course> coursesAsTeacher) {
        this.coursesAsTeacher = coursesAsTeacher;
    }

    public List<Course> getCoursesAsStudent() {
        return coursesAsStudent;
    }

    public void setCoursesAsStudent(List<Course> coursesAsStudent) {
        this.coursesAsStudent = coursesAsStudent;
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public CourseEvaluationDao getCourseEvaluationDao() {
        return courseEvaluationDao;
    }

    public void setCourseEvaluationDao(CourseEvaluationDao courseEvaluationDao) {
        this.courseEvaluationDao = courseEvaluationDao;
    }

    public List<CourseEvaluation> getCourseEvaluations() {
        return courseEvaluations;
    }

    public void setCourseEvaluations(List<CourseEvaluation> courseEvaluations) {
        this.courseEvaluations = courseEvaluations;
    }

    public CommentsDao getCommentsDao() {
        return commentsDao;
    }

    public void setCommentsDao(CommentsDao commentsDao) {
        this.commentsDao = commentsDao;
    }

    public List<Comments> getComments() {
        return comments;
    }

    public void setComments(List<Comments> comments) {
        this.comments = comments;
    }

    public Comments getComment() {
        return comment;
    }

    public void setComment(Comments comment) {
        this.comment = comment;
    }

    public BrowsedCourseDao getBrowsedCourseDao() {
        return browsedCourseDao;
    }

    public void setBrowsedCourseDao(BrowsedCourseDao browsedCourseDao) {
        this.browsedCourseDao = browsedCourseDao;
    }

    public List<BrowsedCourse> getBrowsedCourses() {
        return browsedCourses;
    }

    public void setBrowsedCourses(List<BrowsedCourse> browsedCourses) {
        this.browsedCourses = browsedCourses;
    }

    public MyShowDao getMyShowDao() {
        return myShowDao;
    }

    public void setMyShowDao(MyShowDao myShowDao) {
        this.myShowDao = myShowDao;
    }

    public Integer getUserCoursesNum(){
        return this.getCoursesAsTeacher().size();
    }

    public Integer getUserCoursesStudentNum(){
        return this.getStudents().size();
    }

    public Integer getUserFansNum(){
        return this.getUserFans().size();
    }


    public List<BaseUser> getStudents() {
        List<BaseUser> students = new ArrayList<BaseUser>();
        for(Course c : this.getCoursesAsTeacher()){
            for(SeniorClassRoom sc : c.getSeniorClassRooms()){
                 Boolean exist = false;
                 for (BaseUser user : students){
                     if(user.getId().equals(sc.getStudent().getId())) exist = true;
                 }
                 if(!exist){
                     students.add(sc.getStudent());
                 }
            }
        }
        return students;
    }

    public List<BaseUser> getUserFans() {
        List<BaseUser> fans = new ArrayList<BaseUser>();
        List<MyShow> myShows = myShowDao.findByUser(this.getSessionUserId(),null);
        for (MyShow ms : myShows){
            for(ShowFans sf: ms.getShowFanses()){
                Boolean exist = false;
                for(BaseUser user : fans){
                    if(user.getId().equals(sf.getFan().getId())) exist = true;
                }
                if(!exist) fans.add(sf.getFan());
            }
        }
        return fans;
    }

    public Integer getCoursesAsTeacherNum(){
        return this.getCoursesAsTeacher() == null?0:this.getCoursesAsTeacher().size();
    }

    public Integer getCoursesAsStudentNum(){
        return this.getCoursesAsStudent() == null?0:this.getCoursesAsStudent().size();
    }

    public Integer getBrowsedCoursesNum(){
        return this.getBrowsedCourses() == null?0:this.getBrowsedCourses().size();
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

    public PersonalOnlive getPersonalOnlive() {
        return personalOnlive;
    }

    public void setPersonalOnlive(PersonalOnlive personalOnlive) {
        this.personalOnlive = personalOnlive;
    }

    public PersonalOnliveDao getPersonalOnliveDao() {
        return personalOnliveDao;
    }

    public void setPersonalOnliveDao(PersonalOnliveDao personalOnliveDao) {
        this.personalOnliveDao = personalOnliveDao;
    }

    public UserFansDao getUserFansDao() {
        return userFansDao;
    }

    public void setUserFansDao(UserFansDao userFansDao) {
        this.userFansDao = userFansDao;
    }

    public Boolean getFocused() {
        return focused;
    }

    public void setFocused(Boolean focused) {
        this.focused = focused;
    }

    public List<UserFans> getUserFanses() {
        return userFanses;
    }

    public void setUserFanses(List<UserFans> userFanses) {
        this.userFanses = userFanses;
    }

    public List<PersonalOnlive> getPersonalOnlives() {
        return personalOnlives;
    }

    public void setPersonalOnlives(List<PersonalOnlive> personalOnlives) {
        this.personalOnlives = personalOnlives;
    }

    public List<MyShow> getMyShows() {
        return myShows;
    }

    public void setMyShows(List<MyShow> myShows) {
        this.myShows = myShows;
    }

    public Boolean isExistShows(){
        if(this.getMyShows().size() == 0){
            return false;
        }
        return true;
    }
    public Integer getMyShowsNum(){
        return this.getMyShows().size();
    }

    public Integer getPerOnlivTermsMinSquence() {
        return perOnlivTermsMinSquence;
    }

    public void setPerOnlivTermsMinSquence(Integer perOnlivTermsMinSquence) {
        this.perOnlivTermsMinSquence = perOnlivTermsMinSquence;
    }

    public Integer getPerOnlivTermsMaxSquence() {
        return perOnlivTermsMaxSquence;
    }

    public void setPerOnlivTermsMaxSquence(Integer perOnlivTermsMaxSquence) {
        this.perOnlivTermsMaxSquence = perOnlivTermsMaxSquence;
    }

    public Boolean isNeedScrollForPerLives(){
       if(this.personalOnlives.size()<4){
           return false;
       }
       return true;
    }

    public Integer getBiggestSquence() {
        return biggestSquence;
    }

    public void setBiggestSquence(Integer biggestSquence) {
        this.biggestSquence = biggestSquence;
    }
    public Boolean isExistRecordPerOnlive(){
        if(this.getPersonalOnlives().size() == 0){
            return  false;
        }
        return true;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }
}
