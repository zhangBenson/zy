package com.gogowise.domain;

import com.gogowise.utils.Constants;
import com.gogowise.utils.Utils;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-10-23
 * Time: 上午10:28
 * To change this template use File | Settings | File Templates.
 */

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
    @ManyToOne
    private BaseUser teacher;
    private String teacherEmail;
    @ManyToOne
    private BaseUser cameraMan;
    @ManyToOne
    private BaseUser personalTeacher;
    private String logoUrl;
    private String description;
    private Calendar startDate;
    private Integer totalHours = Constants.DEFAULT_INT_VALUE;
    private Boolean masterConfirmed;
    private Boolean teacherConfirmed;
    private Boolean cameraManConfirmed;
    private String masterComments;
    private String teacherComments;
    private String cameraManComments;
    private String languageType;//课程语种
    private String studentType;     //招生对象
    private String courseTeachingBook;  //推荐教材
    private Integer courseType;


    @OneToMany(mappedBy = "course")
    @OrderBy("date asc")
    private List<CourseClass> classes = new ArrayList<CourseClass>();

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
    private List<CourseInviteStudent> courseInviteStudents = new ArrayList<CourseInviteStudent>();

    @OneToMany(mappedBy = "course")
    private List<SeniorClassRoom> seniorClassRooms = new ArrayList<SeniorClassRoom>();

    @OneToMany(mappedBy = "course")
    private List<CourseReservation> courseReservations;

    @OneToMany(mappedBy = "course")
    private List<CourseRecommend> courseRecommends;

    @OneToMany(mappedBy = "course")
    private List<CourseNewEvent> courseNewEvents;
    //============setter and getter


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
        return teacher;
    }

    public void setTeacher(BaseUser teacher) {
        this.teacher = teacher;
    }

    public BaseUser getCameraMan() {
        return cameraMan;
    }

    public void setCameraMan(BaseUser cameraMan) {
        this.cameraMan = cameraMan;
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

    public void setTotalHours(Integer totalHours) {
        this.totalHours = totalHours;
    }

    public Boolean getMasterConfirmed() {
        return masterConfirmed;
    }

    public void setMasterConfirmed(Boolean masterConfirmed) {
        this.masterConfirmed = masterConfirmed;
    }

    public Boolean getTeacherConfirmed() {
        return teacherConfirmed;
    }

    public void setTeacherConfirmed(Boolean teacherConfirmed) {
        this.teacherConfirmed = teacherConfirmed;
    }

    public Boolean getCameraManConfirmed() {
        return cameraManConfirmed;
    }

    public void setCameraManConfirmed(Boolean cameraManConfirmed) {
        this.cameraManConfirmed = cameraManConfirmed;
    }

    public String getMasterComments() {
        return masterComments;
    }

    public void setMasterComments(String masterComments) {
        this.masterComments = masterComments;
    }

    public String getTeacherComments() {
        return teacherComments;
    }

    public void setTeacherComments(String teacherComments) {
        this.teacherComments = teacherComments;
    }

    public String getCameraManComments() {
        return cameraManComments;
    }

    public void setCameraManComments(String cameraManComments) {
        this.cameraManComments = cameraManComments;
    }

    public List<CourseClass> getClasses() {
        return classes;
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
    public Integer getFinshedClassNum(){
        return getClassOneTheCornerSequence() - 1;
    }
    public List<CourseClass> getForcastClasses() {
        List<CourseClass> curr = new ArrayList<CourseClass>();
        for (CourseClass cc : this.getClasses()) {
            Calendar finishDate = (Calendar) cc.getDate().clone();
            finishDate.add(Calendar.MINUTE, cc.getDuration());
            if (Utils.getCurrentCalender().before(finishDate)) {
                curr.add(cc);
            }
        }
        return curr;
    }

    public Integer getStudentNum(){
        return  this.getSeniorClassRooms().size();
    }

    public Integer getClassesNum(){
        return  this.getClasses().size();
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

    public Calendar getFinishDate(){
       return  this.getClasses().get(this.getClasses().size()-1).getFinishDate();
    }
    public Boolean getTeacherAccept(){
        if(this.getTeacher()!=null) return true;
        return false;
    }

    public List<CourseInviteStudent> getCourseInviteStudents() {
        return courseInviteStudents;
    }

    public void setCourseInviteStudents(List<CourseInviteStudent> courseInviteStudents) {
        this.courseInviteStudents = courseInviteStudents;
    }

    public Integer getCourseInviteStudentsSize(){
        return courseInviteStudents.size();
    }

    public Boolean getLimitOver(){
       if (this.getTeachingNum() <= 3) {
            if (this.getObservationNum() +this.getCourseInviteStudents().size()>= this.getTeachingNum()) {
                       return true;
            } else {
                      return false;
            }
       }
        return false;
    }
    public String getTeacherEmail() {
        return teacherEmail;
    }

    public void setTeacherEmail(String teacherEmail) {
        this.teacherEmail = teacherEmail;
    }

    public Integer getNeedWeeks(){
        int total = 0;
        int weeks = 0;
        for(CourseClass cc : this.getClasses()){
           int k = cc.getDate().get(Calendar.WEEK_OF_YEAR);
           if(k>weeks) {
               total++;
               weeks = k;
           }
        }

        return total;
    }

    public String getStartCourseUrl() {
        if (ONE_TO_ONE.equals(teachingNum)) {
            return  "openClassSession";
        }else if (ONE_TO_TWO.equals(teachingNum)) {
            return  "one2twoSession";
        } else if (ONE_TO_THR.equals(teachingNum)) {
            return  "one2threeSession";
        }else if (ONE_TO_MANY.equals(teachingNum)) {
            return  "one2manySession";
        }
        return null;
    }
    public BaseUser getPayee() {
        if (this.getOrganization() != null ) {
            return  this.getOrganization().getResponsiblePerson();
        } else {
            return this.getTeacher();
        }
    }
    public Boolean getCourseFinished(){
       if(this.getClasses().get(classes.size()-1).getFinishDate().before(Utils.getCurrentCalender())){
           return true;
       }
       return false;
    }

    public Integer getCourseRecommendNum(){
        return this.getCourseRecommends().size();
    }

    public Integer getCourseStudentsNum(){
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
}
