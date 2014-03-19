package com.gogowise.rep.course.dao;

import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.MD5;
import com.gogowise.common.utils.Utils;
import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.CourseClass;
import com.gogowise.rep.course.enity.SeniorClassRoom;
import com.gogowise.rep.finance.ConsumptionOrderDao;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.enity.BaseUser;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Repository("courseDao")
    public class CourseDaoImpl extends ModelDaoImpl<Course> implements CourseDao {

    private static final String DELETED_FALSE = "c.isDeleted = false";
    private static String QUERY_RELATED_COURSE = "select distinct c from Course c   join c.classes cc left join c.seniorClassRooms sc  left join c.organization org left join c.teachers teacher where c.masterConfirmed=true and c.teacherConfirmed=true and cc.course.id = c.id and  (teacher.id=? or c.cameraMan.id=? or org.responsiblePerson.id=? or sc.student.id=?) ";
    private static String QUERY_MY_FORCAST_CLASS = "select distinct c from Course c   join c.classes cc left join c.seniorClassRooms sc  left join c.organization org  left join c.teachers teacher where  cc.course.id = c.id and  (teacher.id=? or sc.student.id=?) ";
    private static String QUERY_MY_FORCAST_CLASS_Teacher = "select distinct c from Course c   join c.classes cc left join c.seniorClassRooms sc  left join c.organization org  left join c.teachers teacher where  cc.course.id = c.id and teacher.id=? ";
    private static String QUERY_MY_FORCAST_CLASS_Student = "select distinct c from Course c   join c.classes cc left join c.seniorClassRooms sc  left join c.organization org  left join c.teachers teacher where  cc.course.id = c.id and sc.student.id=? ";
    private static String COURSE_CONFIRMED = "  c.cameraManConfirmed=true ";
    private BaseUserDao baseUserDao;
    private OrganizationDao organizationDao;
    private ClassDao classDao;
    private ConsumptionOrderDao consumptionOrderDao;
    private SeniorClassRoomDao seniorClassRoomDao;
    private ClassRoomDao classRoomDao;


    public void saveCourse(Course course) {

        if (course.getTeacher() != null) {
            BaseUser teacher = baseUserDao.findByEmail(course.getTeacher().getEmail());
            if (teacher == null) {
                course.getTeacher().setPassword(MD5.endCode(Constants.DEFAULT_PASSWORD));  //waiting to encrypt
                baseUserDao.persistAbstract(course.getTeacher());
            }else {
                course.setTeacher(teacher);
            }

        }
        if (course.getCameraMan() != null) {
            BaseUser cameraMan = baseUserDao.findByEmail(course.getCameraMan().getEmail());
            if (cameraMan == null) {
                course.getCameraMan().setPassword(MD5.endCode(Constants.DEFAULT_PASSWORD));
                baseUserDao.persistAbstract(course.getCameraMan());
            }else{
                course.setCameraMan(cameraMan);
            }
        }
        if (course.getOrganization() != null) {
            Organization org = organizationDao.findOrganizationByOrganizationName(course.getOrganization().getSchoolName());
            if (org != null) {
                course.setOrganization(org);

            } else {
//                course.getOrganization().setVirtual(true);
                organizationDao.createOrganization(course.getOrganization());
            }
        }
        this.persistAbstract(course);
    }

    public void courseModification(Course course, Course modified) {

        course.setTeachingNum(modified.getTeachingNum());
        course.setName(modified.getName());
        course.setDescription(modified.getDescription());
        course.setStartDate(modified.getStartDate());
        course.setCharges(modified.getCharges());
        course.setConsumptionType(modified.getConsumptionType());

    }

    public List<Course> findCourseOfAgeClass(Pagination page) {

         String s ="select distinct c from Course c, CourseClass cc where " + DELETED_FALSE + " and cc.course.id = c.id and  " + this.getFinisDateLessThanNow();

        return this.find(s, page, Utils.getCurrentCalender());
    }

     public List<Course> findCourseOfForcastClass(Pagination page) {

        String hql = "select distinct c from Course c,CourseClass cc where " + DELETED_FALSE +" and cc.course.id = c.id and "+this.getFinisDateBiggerThanNow()+" order by c.publicationTime desc";
        List<Course> courses =  this.find(hql, page, Utils.getCurrentCalender());
        return courses;
    }

    public List<Course> findMaintenanceCourses(Integer tid, Pagination pagination) {
        String hql = "select distinct c from Course c,CourseClass cc  left join c.organization org left join c.teachers teacher  where " + DELETED_FALSE + " and cc.course.id = c.id and (teacher.id=? or org.responsiblePerson.id = ?)  order by c.id desc";
        List<Course> courses =  this.find(hql,pagination,tid,tid,Utils.getCurrentCalender());
        return courses;
    }


    public List<Course> findUserCreatedCourses(Integer userID, Pagination pagination) {
        String hql =   "select distinct c from Course c left join c.organization org left join c.teachers teacher where "+ getCourseConfirmedStr() + " and "  + DELETED_FALSE + " and (teacher.id=? or org.responsiblePerson.id=?) order by c.publicationTime desc ";

        return this.find(hql,pagination,userID,userID);
    }

    public List<Course> findUserRegCourses(Integer userID, Pagination pagination) {
        String hql =   "select distinct c from Course c left join c.seniorClassRooms sc where "+ getCourseConfirmedStr() + " and " + DELETED_FALSE + " and sc.course.id = c.id and  (sc.student.id=?) order by c.publicationTime desc ";
        return this.find(hql,pagination,userID);
    }

    public List<Course> findMyCourseOFAgePart(Pagination pagination, Integer sid) {
        String hql = "select distinct c from Course c  left join c.organization org left join c.teachers teacher where " + DELETED_FALSE + " and (teacher.id=? or org.responsiblePerson.id=?) and c.id= (select max(nc.id) from Course nc where nc.fromCourse.id = c.fromCourse.id and nc.masterConfirmed=true and nc.teacherConfirmed=true and nc.cameraManConfirmed=true ) order by c.publicationTime desc";
        return this.find(hql,pagination,sid,sid);
    }

    public List<Course> findMyCourseOfForcastClassForUserCenter(Pagination page,Integer sid) {
        String hql = QUERY_MY_FORCAST_CLASS +" and "+getFinisDateBiggerThanNow()+ " and " + DELETED_FALSE + "   group by c  order by MIN(cc.date) asc ";
        Calendar now = Calendar.getInstance();
        now.add(Calendar.MINUTE,-15);
        List<Course> courses = this.find(hql,page,sid,sid,now);
        return courses;
    }

    public List<Course> findFinishedCourseForUserCenter(Pagination page,Integer sid, int type)
    {
        String hql = QUERY_MY_FORCAST_CLASS_Student +" and "+getFinisDateLessThanNow()+ " and " + DELETED_FALSE + "   group by c  order by MIN(cc.date) asc ";
        if( type == Constants.ROLE_TYPE_STUDENT )
        {
            hql = QUERY_MY_FORCAST_CLASS_Student +" and "+getFinisDateLessThanNow()+ " and " + DELETED_FALSE + "   group by c  order by MIN(cc.date) asc ";
        }
        if( type == Constants.ROLE_TYPE_TEACHER )
        {
            hql = QUERY_MY_FORCAST_CLASS_Teacher +" and "+getFinisDateLessThanNow()+ " and " + DELETED_FALSE + "   group by c  order by MIN(cc.date) asc ";
        }

        Calendar now = Calendar.getInstance();
        now.add(Calendar.MINUTE,-15);
        List<Course> courses = this.find(hql,page,sid,now);
        return courses;
    }

    public List<Course> findMyCourseOfForcastClassForUserCenter(Pagination page,Integer sid, int type)
    {
        String hql = QUERY_MY_FORCAST_CLASS +" and "+getFinisDateBiggerThanNow()+ " and " + DELETED_FALSE + "   group by c  order by MIN(cc.date) asc ";

        if( type == Constants.ROLE_TYPE_TEACHER )
        {
            hql = QUERY_MY_FORCAST_CLASS_Teacher +" and "+getFinisDateBiggerThanNow()+ " and " + DELETED_FALSE + "   group by c  order by MIN(cc.date) asc ";
        }
        if( type == Constants.ROLE_TYPE_STUDENT )
        {
            hql = QUERY_MY_FORCAST_CLASS_Student +" and "+getFinisDateBiggerThanNow()+ " and " + DELETED_FALSE + "   group by c  order by MIN(cc.date) asc ";
        }

        Calendar now = Calendar.getInstance();
        now.add(Calendar.MINUTE,-15);
        List<Course> courses = this.find(hql,page,sid,now);
        return courses;
    }

    private String getFinisDateBiggerThanNow(){
        return  " cc.duration > timestampdiff(minute,cc.date ,? ) ";
    }
    private String getFinisDateLessThanNow(){
        return  " cc.duration < timestampdiff(minute,cc.date ,? ) ";
    }

    private String getCourseConfirmedStr(){
        return "  c.cameraManConfirmed=true ";
    }

    public List<Course> findTheCanRegCourseByUid(Pagination pagination, Integer userId) {
        List<SeniorClassRoom> seniorClassRooms = seniorClassRoomDao.findAllClassRoomByUser(pagination,userId);
        List<Course> courses = new ArrayList<Course>();
        for(SeniorClassRoom seniorClassRoom:seniorClassRooms){
              List<CourseClass> classes = seniorClassRoom.getCourse().getClasses();
              int k = 0;
              for(CourseClass curr:classes){
                   if(curr.getFinished()){
                       k++;
                   }
                   if(k>2) break;
              }
              if(k<=2)    courses.add(seniorClassRoom.getCourse());
        }
        //return courses;

        List<Course> noDeletedCourses = this.removeDeletedCourse(courses);
        return noDeletedCourses;
    }

    public List<Course> findHotCourses(Pagination pagination) {
        return this.find("select distinct  c from Course c   left join c.seniorClassRooms sc   where " + DELETED_FALSE + " and c.cameraManConfirmed=true group by c order by count(sc.id) desc",pagination);
    }

    public List<Course> findlatestCourses(Pagination pagination) {
        return this.find("From Course c where " + DELETED_FALSE + " and c.cameraManConfirmed=true order by c.startDate desc", pagination);
    }

    @Override
    public List<Course> findMoocCourses(Pagination pagination) {
        return this.find("From Course c where " + DELETED_FALSE + " and c.charges=0 order by c.id desc", pagination);
    }

    @Override
    public List<Course> findNonMoocCourses(Pagination pagination) {
        return this.find("From Course c where " + DELETED_FALSE + " and c.charges!=0 order by c.id desc", pagination);

    }

    public List<Course> findCourses2Teacher(Integer tid, Pagination pagination) {
        return this.find("select distinct c From    Course c left join c.teachers teacher where " + DELETED_FALSE + " and teacher.id=? and c.fromCourse.id = c.id order by c.startDate desc",pagination,tid);
    }

    public List<Course> findCourses2Student(Integer tid, Pagination pagination) {
        return this.find("select c From Course c join  c.seniorClassRooms sc where " + DELETED_FALSE + " and sc.student.id=? order by c.startDate desc",pagination,tid);
    }

    public List<Course> findCourseWithStudentIdAndCourseId(Integer tid, Integer cid) {
        return this.find("select c From Course c join  c.seniorClassRooms sc where " + DELETED_FALSE + " and c.id =? and   sc.student.id=? order by c.startDate desc",cid,tid);
    }

    public List<Course> findCourseRelateCourses(String courseName,Pagination pagination) {
        return this.find("From Course c where " + DELETED_FALSE + " and c.name like ? order by c.id asc",new Pagination(2), courseName);
    }

    public Course findTodayCourse(Integer userId) {
        String s = QUERY_RELATED_COURSE + " and "+this.getFinisDateBiggerThanNow()+" and cc.date < ? group by c order by MIN(cc.date) asc";
        Calendar tomorrow = Utils.getClientTodayCalendar();
        tomorrow.add(Calendar.DAY_OF_YEAR, 1);
        List<Course> todayList = this.find(s, userId, userId, userId, userId, Utils.getCurrentCalender(), tomorrow);
        //return todayList != null && todayList.size() > 0 ? todayList.get(0) : null;

        List<Course> noDeletedCourses = this.removeDeletedCourse(todayList);
        return noDeletedCourses != null && noDeletedCourses.size() > 0 ? noDeletedCourses.get(0) : null;
    }


    public Course findTomorrowCourse(Integer userId) {

        String s = QUERY_RELATED_COURSE + " and cc.date between ? and ? group by c order by MIN(cc.date) asc";
//        String s ="select distinct c from Course c   join c.classes cc left join c.seniorClassRooms sc    where  cc.course.id = c.id and sc.course.id=c.id and (c.teacher.id=3 or c.cameraMan.id=3 or c.organization.responsiblePerson.id=3 or sc.student.id=3)  order by cc.date desc";

        Calendar tomorrow = Utils.getClientTodayCalendar();
        tomorrow.add(Calendar.DAY_OF_YEAR, 1);
        Calendar afterTomorrow = Utils.getClientTodayCalendar();
        afterTomorrow.add(Calendar.DAY_OF_YEAR, 2);
        List<Course> todayList = this.find(s, userId, userId, userId, userId, tomorrow, afterTomorrow);
        //return todayList != null && todayList.size() > 0 ? todayList.get(0) : null;

        List<Course> noDeletedCourses = this.removeDeletedCourse(todayList);
        return noDeletedCourses != null && noDeletedCourses.size() > 0 ? noDeletedCourses.get(0) : null;
    }

    public Course findYesterdayCourse(Integer userId) {

        String s = QUERY_RELATED_COURSE + " and cc.date between ? and ? group by c order by MAX(cc.date) desc";
//        String s ="select distinct c from Course c   join c.classes cc left join c.seniorClassRooms sc    where  cc.course.id = c.id and sc.course.id=c.id and (c.teacher.id=3 or c.cameraMan.id=3 or c.organization.responsiblePerson.id=3 or sc.student.id=3)  order by cc.date desc";

        Calendar yesterday = Utils.getClientTodayCalendar();
        yesterday.add(Calendar.DAY_OF_YEAR, -1);
        List<Course> todayList = this.find(s, userId, userId, userId, userId,yesterday, Utils.getClientTodayCalendar());
        //return todayList != null && todayList.size() > 0 ? todayList.get(0) : null;

        List<Course> noDeletedCourses = this.removeDeletedCourse(todayList);
        return noDeletedCourses != null && noDeletedCourses.size() > 0 ? noDeletedCourses.get(0) : null;
    }

    public  List<Course> findLatestCourseByOrg(Integer orgId, Pagination page) {
        String hql = "select c from Course c  join c.classes cc  where " + DELETED_FALSE + " and c.organization.id = ? and cc.date > ?  order by c.id desc";
        return  this.find(hql, page, orgId, Utils.getCurrentCalender());
    }
    public List<Course> findHotCoursesByOrg(Integer orgId, Pagination pagination) {
        return this.find("select distinct  c from Course c   left join c.seniorClassRooms sc   where " + DELETED_FALSE + " and c.organization.id = ? and charges!=0  group by c order by count(sc.id) desc", pagination, orgId);
    }

    public List<Course> findMoocsByOrg(Integer orgId, Pagination pagination) {
        return this.find("select distinct  c from Course c   left join c.seniorClassRooms sc   where " + DELETED_FALSE + " and c.organization.id = ?  and charges=0  group by c order by count(sc.id) desc", pagination, orgId);
    }


    private List<CourseClass> getLivingClasses(List<CourseClass> courseClasses ){
        List<CourseClass> curr = new ArrayList<CourseClass>();
        for(CourseClass cc:courseClasses){
            if(cc.getDate().getTimeInMillis()<Utils.getCurrentCalender().getTimeInMillis()&&cc.getFinishDate().getTimeInMillis()>Utils.getCurrentCalender().getTimeInMillis()){
                   if(cc.getCourse().getIsDeleted() == null || cc.getCourse().getIsDeleted() == false){
                       curr.add(cc);
                   }
            }
        }
        return curr;
    }

    private List<CourseClass> getForcastClasses(List<CourseClass> courseClasses){
        List<CourseClass> curr = new ArrayList<CourseClass>();
        for(CourseClass cc:courseClasses){
              if(cc.getDate().getTimeInMillis()>Utils.getCurrentCalender().getTimeInMillis()){
                  if(cc.getCourse().getIsDeleted() == null || cc.getCourse().getIsDeleted() == false){
                      curr.add(cc);
                  }
            }
        }
        return  curr;
    }

    public Course saveRepeatCourse(Calendar startTime, Course course ,String teacherEmail) {
        Course curr = new Course();
        curr.setStartDate(startTime);
        curr.setName(course.getName());
        curr.setDescription(course.getDescription());
        curr.setLanguageType(course.getLanguageType());
        curr.setCharges(course.getCharges());
        curr.setLogoUrl(course.getLogoUrl());
        curr.setTotalHours(course.getTotalHours());
        curr.setConsumptionType(course.getConsumptionType());
        curr.setTeachingNum(course.getTeachingNum());
        curr.setStudentType(course.getStudentType() != null?course.getStudentType():"");
        curr.setCourseTeachingBook(course.getCourseTeachingBook() != null?course.getCourseTeachingBook():"");
        if(course.getCourseType() != null){
            curr.setCourseType(course.getCourseType());
        }
        if(course.getOrganization()!=null){
            curr.setOrganization(course.getOrganization());
            curr.setTeacherEmail(teacherEmail);
        }else {
           curr.setPersonalTeacher(course.getPersonalTeacher());
           curr.setTeacher(course.getTeacher());
        }
        curr.setCameraMan(course.getCameraMan());
        curr.setFromCourse(course.getFromCourse());
        this.persistAbstract(curr);

        for(int i=0;i<course.getClasses().size();i++){
            CourseClass courseClass = new CourseClass();
            courseClass.setCourse(curr);
            CourseClass cc = course.getClasses().get(i);
            courseClass.setName(cc.getName());
            courseClass.setNickName(cc.getNickName());
            courseClass.setTeacherEntered(false);
            courseClass.setRecord(false);
            Calendar startDate = Calendar.getInstance();
            if (i==0){
               startDate.setTime(Utils.getCalendarByDayOfWeekAndCalendar(startTime,cc.getDate().get(Calendar.DAY_OF_WEEK),0).getTime());
               startDate.set(Calendar.HOUR_OF_DAY,cc.getDate().get(Calendar.HOUR_OF_DAY));
               startDate.set(Calendar.MINUTE,cc.getDate().get(Calendar.MINUTE));
               courseClass.setDate(startDate);
            }else {
               startDate.setTime(Utils.getCalendarByDayOfWeekAndCalendar(curr.getClasses().get(i-1).getDate(),cc.getDate().get(Calendar.DAY_OF_WEEK),0).getTime());
               startDate.set(Calendar.HOUR_OF_DAY,cc.getDate().get(Calendar.HOUR_OF_DAY));
               startDate.set(Calendar.MINUTE,cc.getDate().get(Calendar.MINUTE));
               courseClass.setDate(startDate);
            }
            courseClass.setDuration(cc.getDuration());
            classDao.persistAbstract(courseClass);
            curr.getClasses().add(courseClass);

        }
        return curr;
    }

    public List<Course> findMyOrgCourseForSupervision(Integer Rid, Pagination pagination) {
        String QUERY_ORG_SUPERVISION_COURSE = "select distinct c from Course c   join c.classes cc left join c.organization org  where  cc.course.id = c.id and  (org.responsiblePerson.id=?) ";
        String hql = QUERY_ORG_SUPERVISION_COURSE +" and cc.duration > timestampdiff(minute,cc.date ,? ) group by c  order by MIN(cc.date) asc ";
        Calendar now = Calendar.getInstance();
        now.add(Calendar.MINUTE,-20);
        //return this.find(hql,pagination,Rid,now);

        List<Course> courses = this.find(hql,pagination,Rid,now);
        List<Course> noDeletedCourses = this.removeDeletedCourse(courses);
        return noDeletedCourses;
    }

    public List<Course> findCourseOnline(Pagination pagination) {
        String Query_online =  "select distinct c from Course c   join c.classes cc left join c.seniorClassRooms sc  left join c.organization org  where " + DELETED_FALSE + " and cc.course.id = c.id ";
        String hql = Query_online +" and "+getFinisDateBiggerThanNow()+"   group by c  order by MIN(cc.date) asc ";
        Calendar now = Calendar.getInstance();
        now.add(Calendar.MINUTE,-20);
        return this.find(hql,pagination,now);
    }

    public List<BaseUser> findRegUser(Integer courseId, Pagination pagination){
         String sql = "select distinct sr.student From SeniorClassRoom  sr  where sr.course.fromCourse.id = ? order by sr.id desc ";
        return  this.find(sql, pagination,courseId);
    }

    public List<Course> findByOrg(Integer orgID, Pagination pagination) {
        String hql = "From Course c where " + DELETED_FALSE + " and c.organization.id=? and c.fromCourse.id = c.id";
        return this.find(hql,pagination,orgID);
    }

    public List<Course> findByFromCourse(Integer fromCourseID, Pagination pagination) {
        String hql = "From Course c where " + DELETED_FALSE + " and c.fromCourse.id=?";
        return this.find(hql,pagination,fromCourseID);
    }

    public List<Course> findLatest4Course(Pagination pagination) {
        String hql = "From Course c where " + DELETED_FALSE + " and c.cameraManConfirmed=true order by c.publicationTime desc";
        return this.find(hql,pagination);
    }

    public List<Course> findCoursesInTypes(Integer type, Pagination pagination) {
        String hql = "From Course c where " + DELETED_FALSE + " and c.courseType=? order by c.publicationTime desc";
        return this.find(hql,pagination,type);
    }

    public List<Course> searchCourses(String searchStr, Pagination pagination) {
        if(searchStr == null || searchStr.equals("")) return this.findHotCourses(pagination);
        String hql ="select distinct c  From Course c left join  c.teachers teacher  where " + COURSE_CONFIRMED + " and " + DELETED_FALSE + " and (c.name like ? or teacher.nickName like ?) order by c.id desc";
        return this.find(hql,pagination,"%"+searchStr+"%","%"+searchStr+"%");
    }

    public List<Course> removeDeletedCourse(List<Course> courses)
    {
        if(courses == null) return null;

        List<Course> result = new ArrayList<Course>();

        for(Course course:courses)
        {
           if( course.getIsDeleted()!= null)
           {
               if(course.getIsDeleted().booleanValue() == true)
               {
                   continue;
               }
           }

           result.add(course);
        }

        return result;
    }
    //================getter and setter==========


    public ConsumptionOrderDao getConsumptionOrderDao() {
        return consumptionOrderDao;
    }

    public void setConsumptionOrderDao(ConsumptionOrderDao consumptionOrderDao) {
        this.consumptionOrderDao = consumptionOrderDao;
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

    public OrganizationDao getOrganizationDao() {
        return organizationDao;
    }

    public void setOrganizationDao(OrganizationDao organizationDao) {
        this.organizationDao = organizationDao;
    }

    public SeniorClassRoomDao getSeniorClassRoomDao() {
        return seniorClassRoomDao;
    }

    public void setSeniorClassRoomDao(SeniorClassRoomDao seniorClassRoomDao) {
        this.seniorClassRoomDao = seniorClassRoomDao;
    }

    public ClassRoomDao getClassRoomDao() {
        return classRoomDao;
    }

    public void setClassRoomDao(ClassRoomDao classRoomDao) {
        this.classRoomDao = classRoomDao;
    }


}
