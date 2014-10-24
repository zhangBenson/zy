package com.gogowise.rep.course.enity;

import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.Utils;
import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.tag.enity.Tag;
import com.gogowise.rep.user.enity.BaseUser;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;


@Entity
public class Course extends AbstractPersistence {

    private final static Integer ONE_TO_ONE = 1;
    private final static Integer ONE_TO_TWO = 2;
    private final static Integer ONE_TO_THR = 3;
    private final static Integer ONE_TO_MANY = 4;


    private Boolean opened = false;
    private String name;
    @ManyToOne
    private Organization organization;
    @OneToMany(cascade = CascadeType.ALL)
    private List<BaseUser> teachers = new ArrayList<>();
    private String teacherEmail;
    @ManyToOne
    private BaseUser personalTeacher;
    private String logoUrl;
    @Column(columnDefinition = "longtext")
    private String description;
    private Calendar startDate;
    private String languageType;//课程语种
    private String studentType;     //招生对象
    private String courseTeachingBook;  //推荐教材
    private Integer courseType;

    private Boolean isDeleted = false;
    private Integer studentAgeType = 0;

    @Column(columnDefinition = "tinyint(1) default 1")
    private boolean isPublic = true;

    @OneToMany(mappedBy = "course")
    @OrderBy("date asc")
    private List<CourseClass> classes = new ArrayList<>();

    private Calendar publicationTime; //课程发布时间

    private Integer observationNum = Constants.DEFAULT_INT_VALUE;  //购买人数
    private Integer buyAgesNum = Constants.DEFAULT_INT_VALUE;  //订阅录像人数
    private Integer inviteStudentNum = Constants.DEFAULT_INT_VALUE;   //邀请的学生人数

    private Double interest = Constants.DEFAULT_DOUBLE_VALUE;            //    趣味性
    private Double available = Constants.DEFAULT_DOUBLE_VALUE;           //    实用性
    private Double interaction = Constants.DEFAULT_DOUBLE_VALUE;         //    互动性
    private Double costPerformance = Constants.DEFAULT_DOUBLE_VALUE;    //    性价比
    private Double synthetical = Constants.DEFAULT_DOUBLE_VALUE;         //     综合评分
    private Integer evaluatorNums = Constants.DEFAULT_INT_VALUE;         //评分人数

    private Integer teachingNum = Constants.DEFAULT_INT_VALUE;           //几对几
    private Double charges;                                                 //课堂的收费
    private Boolean consumptionType = false;      //知券

    @ManyToOne(fetch = FetchType.LAZY)
    private Course fromCourse;

    @OneToMany(mappedBy = "course")
    private List<CourseInviteStudent> courseInviteStudents = new ArrayList<>();

    @OneToMany(mappedBy = "course")
    private List<SeniorClassRoom> seniorClassRooms = new ArrayList<>();

    @OneToMany(mappedBy = "course")
    private List<CourseReservation> courseReservations;

    @OneToMany(mappedBy = "course")
    private List<CourseRecommend> courseRecommends;

    @OneToMany(mappedBy = "course")
    private List<CourseNewEvent> courseNewEvents;
    //============setter and getter

    @OneToMany(cascade = CascadeType.ALL)
    private List<Tag> tags;




    public Boolean getOpened() {
        return opened;
    }

    public void setOpened(Boolean opened) {
        this.opened = opened;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    public BaseUser getTeacher() {
        if (teachers.size() == 0) return null;
        return teachers.get(0);
    }

    public void setTeacher(BaseUser teacher) {
        if (teachers.size() == 0) {
            this.addTeacher(teacher);
        } else {
            teachers.set(0, teacher);
        }
    }


    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Calendar getStartDate() {
        return startDate;
    }

    public void setStartDate(Calendar startDate) {
        this.startDate = startDate;
    }

    public Integer getTotalHours() {
        return this.getClasses().size();
    }

    public List<CourseClass> getClasses() {
        //return classes;
        List<CourseClass> removeDeletedClass = new ArrayList<>();

        for (CourseClass curClass : classes) {
            if (curClass.getIsDeleted() == null || !curClass.getIsDeleted()) {
                removeDeletedClass.add(curClass);
            }
        }

        return removeDeletedClass;
    }

    public void setClasses(List<CourseClass> classes) {
        this.classes = classes;
    }

    public BaseUser getPersonalTeacher() {
        return personalTeacher;
    }

    public void setPersonalTeacher(BaseUser personalTeacher) {
        this.personalTeacher = personalTeacher;
    }

    public Integer getObservationNum() {
        return observationNum;
    }

    public void setObservationNum(Integer observationNum) {
        this.observationNum = observationNum;
    }

    public Integer getBuyAgesNum() {
        return buyAgesNum;
    }

    public void setBuyAgesNum(Integer buyAgesNum) {
        this.buyAgesNum = buyAgesNum;
    }

    public Double getInterest() {
        return interest;
    }

    public void setInterest(Double interest) {
        this.interest = interest;
    }

    public Double getAvailable() {
        return available;
    }

    public void setAvailable(Double available) {
        this.available = available;
    }

    public Double getInteraction() {
        return interaction;
    }

    public void setInteraction(Double interaction) {
        this.interaction = interaction;
    }

    public Double getCostPerformance() {
        return costPerformance;
    }

    public void setCostPerformance(Double costPerformance) {
        this.costPerformance = costPerformance;
    }

    public Double getSynthetical() {
        return synthetical;
    }

    public void setSynthetical() {
        this.synthetical = Math.round((this.available + this.interest + this.interaction + this.costPerformance) * 10 / 4) / 10.0;
    }

    public Integer getEvaluatorNums() {
        return evaluatorNums;
    }

    public void setEvaluatorNums(Integer evaluatorNums) {
        this.evaluatorNums = evaluatorNums;
    }

    public Boolean getConsumptionType() {
        return consumptionType;
    }

    public void setConsumptionType(Boolean consumptionType) {
        this.consumptionType = consumptionType;
    }

    public Integer getTeachingNum() {
        return teachingNum;
    }

    public void setTeachingNum(Integer teachingNum) {
        this.teachingNum = teachingNum;
    }

    public Double getCharges() {
        return charges;
    }

    public void setCharges(Double charges) {
        this.charges = charges;
    }

    public List<SeniorClassRoom> getSeniorClassRooms() {
        return seniorClassRooms;
    }

    public void setSeniorClassRooms(List<SeniorClassRoom> seniorClassRooms) {
        this.seniorClassRooms = seniorClassRooms;
    }

    public CourseClass getClassOnTheCorner() {
        if (this.getForcastClasses().size() == 0) return null;
        return this.getForcastClasses().get(0);
    }

    public Integer getClassOneTheCornerSequence() {
        int i = 1;
        for (CourseClass cc : this.getClasses()) {
            if (cc.getFinishDate().getTimeInMillis() <= Utils.getCurrentCalender().getTimeInMillis()) {
                i++;
            }
        }
        return i;
    }

    public Integer getFinshedClassNum() {
        return getClassOneTheCornerSequence() - 1;
    }

    public List<CourseClass> getForcastClasses() {
        List<CourseClass> curr = new ArrayList<>();
        for (CourseClass cc : this.getClasses()) {
            Calendar finishDate = (Calendar) cc.getDate().clone();
            finishDate.add(Calendar.MINUTE, cc.getDuration());
            if (Utils.getCurrentCalender().before(finishDate)) {
                curr.add(cc);
            }
        }
        return curr;
    }

    public Integer getStudentNum() {
        return this.getSeniorClassRooms().size();
    }

    public Integer getClassesNum() {
        return this.getClasses().size();
    }


    public Calendar getPublicationTime() {
        return publicationTime;
    }

    public void setPublicationTime(Calendar publicationTime) {
        this.publicationTime = publicationTime;
    }

    public String getLanguageType() {
        return languageType;
    }

    public void setLanguageType(String languageType) {
        this.languageType = languageType;
    }

    public Integer getInviteStudentNum() {
        return inviteStudentNum;
    }

    public void setInviteStudentNum(Integer inviteStudentNum) {
        this.inviteStudentNum = inviteStudentNum;
    }

    public List<CourseReservation> getCourseReservations() {
        return courseReservations;
    }

    public void setCourseReservations(List<CourseReservation> courseReservations) {
        this.courseReservations = courseReservations;
    }

    public List<CourseRecommend> getCourseRecommends() {
        return courseRecommends;
    }

    public void setCourseRecommends(List<CourseRecommend> courseRecommends) {
        this.courseRecommends = courseRecommends;
    }

    public Course getFromCourse() {
        return fromCourse;
    }

    public void setFromCourse(Course fromCourse) {
        this.fromCourse = fromCourse;
    }

    public Calendar getFinishDate() {
        return this.getClasses().get(this.getClasses().size() - 1).getFinishDate();
    }

    public Boolean getTeacherAccept() {
        return this.getTeacher() != null;
    }

    public List<CourseInviteStudent> getCourseInviteStudents() {
        return courseInviteStudents;
    }

    public void setCourseInviteStudents(List<CourseInviteStudent> courseInviteStudents) {
        this.courseInviteStudents = courseInviteStudents;
    }

    public Integer getCourseInviteStudentsSize() {
        return courseInviteStudents.size();
    }

    public Boolean getLimitOver() {
        return this.getTeachingNum() <= 3 && this.getObservationNum() + this.getCourseInviteStudents().size() >= this.getTeachingNum();
    }

    public String getTeacherEmail() {
        if (this.teacherEmail == null) {
            return this.getTeacher().getEmail();
        } else {
            return teacherEmail;
        }
    }

    public void setTeacherEmail(String teacherEmail) {
        this.teacherEmail = teacherEmail;
    }

    public Integer getNeedWeeks() {
        int total = 0;
        int weeks = 0;
        for (CourseClass cc : this.getClasses()) {
            int k = cc.getDate().get(Calendar.WEEK_OF_YEAR);
            if (k > weeks) {
                total++;
                weeks = k;
            }
        }

        return total;
    }

    public String getStartCourseUrl() {
        if (ONE_TO_ONE.equals(teachingNum)) {
            return "openClassSession";
        } else if (ONE_TO_TWO.equals(teachingNum)) {
            return "one2twoSession";
        } else if (ONE_TO_THR.equals(teachingNum)) {
            return "one2threeSession";
        } else if (ONE_TO_MANY.equals(teachingNum)) {
            return "one2manySession";
        }
        return null;
    }

    public BaseUser getPayee() {
        if (this.getOrganization() != null) {
            return this.getOrganization().getResponsiblePerson();
        } else {
            return this.getTeacher();
        }
    }

    public Boolean getCourseFinished() {
        return this.getClasses().size() > 1 && this.getClasses().get(classes.size() - 1).getFinishDate().before(Utils.getCurrentCalender());
    }

    public List<CourseClass> getGameClasses() {
        List<CourseClass> classList = new ArrayList<>();
        if (this.getClasses() == null) return classList;
        for (CourseClass c : this.getClasses()) {
            if (c.getGameExist()) {
                classList.add(c);
            }
        }
        return classList;
    }

    public Integer getCourseRecommendNum() {
        return this.getCourseRecommends().size();
    }

    public Integer getCourseStudentsNum() {
        return this.getSeniorClassRooms().size();
    }

    public String getStudentType() {
        return studentType;
    }

    public void setStudentType(String studentType) {
        this.studentType = studentType;
    }

    public String getCourseTeachingBook() {
        return courseTeachingBook;
    }

    public void setCourseTeachingBook(String courseTeachingBook) {
        this.courseTeachingBook = courseTeachingBook;
    }

    public Integer getCourseType() {
        return courseType;
    }

    public void setCourseType(Integer courseType) {
        this.courseType = courseType;
    }

    public List<CourseNewEvent> getCourseNewEvents() {
        return courseNewEvents;
    }

    public void setCourseNewEvents(List<CourseNewEvent> courseNewEvents) {
        this.courseNewEvents = courseNewEvents;
    }

    public List<BaseUser> getTeachers() {
        return teachers;
    }

    public void setTeachers(List<BaseUser> teachers) {
        this.teachers = teachers;
    }

    public void addTeacher(BaseUser teacher) {
        this.teachers.add(teacher);
    }

    public Boolean getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Boolean deleted) {
        isDeleted = deleted;
    }

    public Integer getStudentAgeType() {
        return studentAgeType;
    }

    public void setStudentAgeType(Integer studentAgeType) {
        this.studentAgeType = studentAgeType;
    }

    public boolean getIsPublic() {
        return isPublic;
    }

    public void setIsPublic(boolean aPublic) {
        isPublic = aPublic;
    }

    public List<Tag> getTags() {
        if (this.tags == null) {
            tags = new ArrayList<>();
        }
        return tags;
    }

    public String getTagsAsStr() {
        if (this.tags == null) {
            return null;
        }
        String temp = "";
        for (Tag tag : tags) {
            temp = temp + tag.getName() + ",";
        }
        if (temp.length() > 0) temp = temp.substring(0, temp.length() - 1);
        return temp;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }
}
