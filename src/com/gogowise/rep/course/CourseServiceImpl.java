package com.gogowise.rep.course;

import com.gogowise.common.utils.Constants;
import com.gogowise.rep.ModelServiceImpl;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.ServiceException;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.dao.CourseInviteStudentDao;
import com.gogowise.rep.course.dao.QuestionDao;
import com.gogowise.rep.course.dao.SeniorClassRoomDao;
import com.gogowise.rep.course.enity.*;
import com.gogowise.rep.course.vo.CourseSpecification;
import com.gogowise.rep.finance.dao.UserAccountInfoDao;
import com.gogowise.rep.org.OrgService;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.user.UserService;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.user.enity.RoleType;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("courseService")
public class CourseServiceImpl extends ModelServiceImpl implements CourseService {

    public static final String NO_PERMISSION = "no permission";
    @Autowired
    private OrgService orgService;
    @Autowired
    private BaseUserDao baseUserDao;
    @Autowired
    private CourseDao courseDao;
    @Autowired
    private OrganizationDao organizationDao;
    @Autowired
    private QuestionDao questionDao;
    @Autowired
    private CourseInviteStudentDao courseInviteStudentDao;
    @Autowired
    private SeniorClassRoomDao seniorClassRoomDao;
    @Autowired
    private UserService userService;

    public void saveQuestion(CourseMaterial courseMaterial, List<Question> questions) {
        for (Question question : questions) {
            question.setCourseMaterial(courseMaterial);
            questionDao.persist(question);
        }

    }

    public void saveCourse(CourseSpecification specification) {

        BaseUser personalTeacher = baseUserDao.findById(specification.getOperatorId());
        Course course = specification.getCourse();
        if (course.getId() == null) {     //if the course.id == null than deal with the org and course's teacher
            if (Constants.COURSE_TYPE_ORG.equals(specification.getCourseType())) {
                course.setOrganization(organizationDao.findByResId(specification.getOperatorId()));
            }
        } else {
            course = courseDao.findById(course.getId());
            Course modifiedCourse = specification.getCourse();
            if (specification.getCourse().getTeachingNum() != null)
                course.setTeachingNum(modifiedCourse.getTeachingNum());
            course.setName(modifiedCourse.getName());
            course.setDescription(modifiedCourse.getDescription());
            course.setStudentType(modifiedCourse.getStudentType());
            course.setCourseTeachingBook(modifiedCourse.getCourseTeachingBook());
            course.setCourseType(modifiedCourse.getCourseType());
            course.setStartDate(modifiedCourse.getStartDate());
            course.setCharges(modifiedCourse.getCharges());
        }

        // Teacher
        if (Constants.COURSE_TYPE_ORG.equals(specification.getCourseType())) {
            for (String teacherId : specification.getTeachersId()) {
                BaseUser teacherInfo = baseUserDao.findByEmail(teacherId);
                course.addTeacher(teacherInfo);
            }
        } else if (Constants.COURSE_TYPE_VORG.equals(specification.getCourseType())) {
            course.setOrganization(organizationDao.findOrganizationByOrganizationName(Constants.ZHI_YUAN_SCHOOL_NAME));
        } else {
            course.setPersonalTeacher(personalTeacher);
            course.setTeacher(personalTeacher);
        }
        course.setConsumptionType(true);

        if (StringUtils.isBlank(course.getLogoUrl())) course.setLogoUrl(Constants.DEFAULT_COURSE_IMAGE);


        if (course.getFromCourse() == null)
            course.setFromCourse(course);   // mark the course where from. Default is current.
        courseDao.persistAbstract(course);
    }

    public Course findById(Integer id) {
        return courseDao.findById(id);
    }

    @Override
    public List<Course> findMaintenanceCourses(Integer userId, Pagination pagination) {
        return courseDao.findMaintenanceCourses(userId, pagination);
    }


    public void validateBeforePurchase(Course course, BaseUser user) throws ServiceException {



        if (existInStudentInvitation(course, user.getEmail())) {
            throw new ServiceException("course.exist.in.studentInvitation"); //您是被邀请的用户，请在您的邮件中点击接受完成购买
        }
        if (isNeed(course, user.getEmail())) {
            throw new ServiceException("course.identity.exist"); //   您不需要购买该课程
        }
        //        if (limitNumOver(course)) {
        //            return "course.studentNum.overflow"; //对不起，该课程预定人数已满
        //        }

        if (existInRoom(course.getId(), user.getId())) {
            throw new ServiceException("course.already.observation"); //您已经购买了该课程
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


    public boolean isDenyByPrivateCourse(Integer userId, Integer courseId) {
        Course curCourse = courseDao.findById(courseId);

        if (curCourse != null && !curCourse.getIsPublic()) {
            return userId == null || !orgService.isMember(userId, curCourse.getOrganization().getId());
        }
        //return !(curCourse.getIsPublic() || userId == null) && orgService.isMember(userId, curCourse.getOrganization().getId());
        return false;
    }

    public void saveInvitation(String email, Integer courseId) {
        CourseInviteStudent courseInviteStudent = courseInviteStudentDao.findByCourseAndEmail(courseId, email);
        BaseUser student = baseUserDao.findByEmail(email);
        if (courseInviteStudent == null) {
            courseInviteStudent = new CourseInviteStudent();
            courseInviteStudent.setCourse(this.courseDao.findById(courseId));
            courseInviteStudent.setInvitedStudentEmail(email);
        }
        if (student != null && !Boolean.TRUE.equals(courseInviteStudent.getAcceptInvite())) {
            courseInviteStudent.setAcceptInvite(true);
            courseInviteStudent.setStudent(student);
            this.saveClassRoom(courseId, student.getId());
        }
        courseInviteStudentDao.persistAbstract(courseInviteStudent);
    }

    public void saveClassRoom(Integer courseId, Integer userId) {
        SeniorClassRoom sc = seniorClassRoomDao.findClassRoomByCourseAndStudent(courseId, userId);
        if (sc != null) {
            return;
        }
        SeniorClassRoom seniorClassRoom = new SeniorClassRoom();
        seniorClassRoom.setCourse(courseDao.findById(courseId));
        seniorClassRoom.setStudent(baseUserDao.findById(userId));
        seniorClassRoomDao.persistAbstract(seniorClassRoom);
    }

    public void delete(Integer id, Integer userId) throws ServiceException {

        Course deleteCourse = courseDao.findById(id);
        if (deleteCourse == null)
            return;
        if (!userService.havePermission(userId, RoleType.ADMIN) && !orgService.isResponsiblePerson(userId, deleteCourse.getOrganization().getId())) {
            throw new ServiceException(NO_PERMISSION);
        }

        deleteCourse.setIsDeleted(true);
        courseDao.persistAbstract(deleteCourse);
    }
}
