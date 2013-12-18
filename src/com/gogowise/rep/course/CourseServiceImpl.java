package com.gogowise.rep.course;

import com.gogowise.common.utils.Constants;
import com.gogowise.rep.ModelServiceImpl;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.vo.CourseSpecification;
import com.gogowise.rep.org.OrgService;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.enity.BaseUser;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service("courseService")
public class CourseServiceImpl extends ModelServiceImpl implements CourseService{

    private OrgService orgService;
    private BaseUserDao baseUserDao;
    private CourseDao courseDao;
    private OrganizationDao organizationDao;

    public Set<BaseUser> findAllTeachersByOrgCreator(Integer userId) {
        Organization org =  organizationDao.findByResId(userId);
        Set<BaseUser> teachers = new HashSet<>();
        if(org != null) {
            teachers.addAll(orgService.findAllTeachersForOrg(org.getId()));
        }
        teachers.add(baseUserDao.findById(userId));

        return teachers;
    }

    public void saveCourse(CourseSpecification specification) {

        BaseUser personalTeacher = baseUserDao.findById(specification.getOperatorId());
        Course course = course = specification.getCourse();
        if (course.getId() == null) {     //if the course.id == null than deal with the org and course's teacher
            if (Constants.COURSE_TYPE_ORG.equals(specification.getCourseType())) {
                course.setOrganization(organizationDao.findByResId(specification.getOperatorId()));
            }
        } else {
            course = courseDao.findById(course.getId());
            Course modifiedCourse = specification.getCourse();
            if (specification.getCourse().getTeachingNum() != null) course.setTeachingNum(modifiedCourse.getTeachingNum() );
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
            for (Integer teacherId : specification.getTeachersId()) {
                BaseUser teacherInfo = baseUserDao.findById(teacherId);
                course.addTeacher(teacherInfo);
            }
        } else if (Constants.COURSE_TYPE_VORG.equals(specification.getCourseType())) {
            course.setOrganization(organizationDao.findOrganizationByOrganizationName(Constants.ZHI_YUAN_SCHOOL_NAME));
        } else {
            course.setPersonalTeacher(personalTeacher);
            course.setTeacher(personalTeacher);
        }
        course.setConsumptionType(true);

        //URL
        if (StringUtils.isNotBlank(course.getLogoUrl()) && !StringUtils.startsWithIgnoreCase(course.getLogoUrl(), "upload/")) {
            course.setLogoUrl(Constants.UPLOAD_COURSE_PATH + "/" + specification.getOperatorId() + "/" + course.getLogoUrl());
        }
        if (StringUtils.isBlank(course.getLogoUrl()) ) course.setLogoUrl(Constants.DEFAULT_COURSE_IMAGE);


        if (course.getFromCourse() == null)
            course.setFromCourse(course);   // mark the course where from. Default is current.
        courseDao.persistAbstract(course);
    }

    public Course findById(Integer id) {
        return courseDao.findById(id);
    }

    @Override
    public List<Course> findMaintenanceCourses(Integer userId, Pagination pagination) {
        return courseDao.findMaintenanceCourses(userId,pagination);
    }


    public void setOrgService(OrgService orgService) {
        this.orgService = orgService;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public void setOrganizationDao(OrganizationDao organizationDao) {
        this.organizationDao = organizationDao;
    }
}
