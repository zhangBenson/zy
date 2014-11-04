package com.gogowise.action.user;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.Utils;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.dao.CommentsDao;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.SeniorClassRoom;
import com.gogowise.rep.org.dao.OrganizationBaseUserDao;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.org.enity.OrganizationBaseUser;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.user.enity.Comments;
import com.gogowise.rep.user.enity.RoleType;

@SuppressWarnings("UnusedDeclaration")
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class UserBlogAction extends BasicAction {
    private BaseUserDao baseUserDao;
    private CourseDao courseDao;
    private CommentsDao commentsDao;
    private BaseUser user;
    private List<Course> coursesAsTeacher;
    private List<Comments> comments;
    private Comments comment;
    private Integer commentsNum;
    private Boolean commentsNumOverflow = false;
    private Boolean focused = false;
    private Integer perOnlivTermsMinSquence;
    private Integer perOnlivTermsMaxSquence;
    private Integer biggestSquence;
    private Pagination pagination = new Pagination(5);
    private OrganizationDao organizationDao;
    private Organization userOrganization;
    private OrganizationBaseUserDao organizationBaseUserDao;


    @Action(value = "userBlog",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".userBlog")}
    )
    public String userBlog() {
        if (user == null) return NONE;
        Integer userId = user.getId();
        user = this.baseUserDao.findById(userId);
        if (user == null) return NONE;

        coursesAsTeacher = courseDao.findCourses2Teacher(userId, new Pagination(3));

        userOrganization = organizationDao.findByResId(userId);

        //If the user is not an organization responsible person
        if (userOrganization == null) {
            OrganizationBaseUser baseUser = organizationBaseUserDao.findMyOrgByUserIdAndRole(userId, RoleType.ROLE_TYPE_TEACHER);
            if (baseUser == null)
                baseUser = organizationBaseUserDao.findMyOrgByUserIdAndRole(userId, RoleType.ROLE_TYPE_STUDENT);

            if (baseUser != null) userOrganization = baseUser.getOrg();
        }

        comments = commentsDao.findByCommentTo(userId, new Pagination(10));
        this.setCommentsNum(comments.size());
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
            comments = commentsDao.findByCommentTo(user.getId(), new Pagination(commentsNum + 1));
            this.setCommentsNum(comments.size());
        }
        return SUCCESS;
    }

    @Action(value = "saveUserComments")
    public void saveUserComments() {
        BaseUser commentOwner = baseUserDao.findById(this.getComment().getOwner().getId());         //留言人
        comment.setOwner(commentOwner);
        comment.setCreateDate(Utils.getCurrentCalender());
        commentsDao.persistAbstract(comment);
    }

    @Action(value = "moreUserComments", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".userComment")})
    public String moreComments() {
        Pagination page = new Pagination(this.getCommentsNum() + Constants.DEFAULT_PAGE_OF_COMMENTS_INCREASED_SIZE);
        comments = commentsDao.findByCommentTo(user.getId(), page);
        this.setCommentsNum(comments.size());
        if (page.getTotalSize() <= commentsNum) {
            this.setCommentsNumOverflow(true);
        }
        return SUCCESS;
    }

    @Action(value = "deleteUserComment")
    public void deleteUserComment() {
        comment = commentsDao.findById(this.getComment().getId());
        commentsDao.delete(comment);
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

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
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


    public Integer getUserCoursesNum() {
        return this.getCoursesAsTeacher().size();
    }

    public Integer getUserCoursesStudentNum() {
        return this.getStudents().size();
    }

    public List<BaseUser> getStudents() {
        List<BaseUser> students = new ArrayList<>();
        for (Course c : this.getCoursesAsTeacher()) {
            for (SeniorClassRoom sc : c.getSeniorClassRooms()) {
                Boolean exist = false;
                for (BaseUser user : students) {
                    if (user.getId().equals(sc.getStudent().getId())) exist = true;
                }
                if (!exist) {
                    students.add(sc.getStudent());
                }
            }
        }
        return students;
    }


    public Integer getCoursesAsTeacherNum() {
        return this.getCoursesAsTeacher() == null ? 0 : this.getCoursesAsTeacher().size();
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


    public Integer getBiggestSquence() {
        return biggestSquence;
    }

    public void setBiggestSquence(Integer biggestSquence) {
        this.biggestSquence = biggestSquence;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public OrganizationDao getOrganizationDao() {
        return this.organizationDao;
    }

    public void setOrganizationDao(OrganizationDao organizationDao) {
        this.organizationDao = organizationDao;
    }

    public Organization getUserOrganization() {
        return this.userOrganization;
    }

    public void setUserOrganization(Organization userOrganization) {
        this.userOrganization = userOrganization;
    }


    public OrganizationBaseUserDao getOrganizationBaseUserDao() {
        return organizationBaseUserDao;
    }

    public void setOrganizationBaseUserDao(OrganizationBaseUserDao organizationBaseUserDao) {
        this.organizationBaseUserDao = organizationBaseUserDao;
    }
}
