package com.gogowise.dao.course;

import com.gogowise.dao.*;
import com.gogowise.dao.org.ChangeResponserHistoryDao;
import com.gogowise.dao.trade.ConsumptionOrderDao;
import com.gogowise.dao.user.BaseUserDao;
import com.gogowise.domain.*;
import com.gogowise.utils.Constants;
import com.gogowise.utils.MD5;
import com.gogowise.utils.Utils;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-2-16
 * Time: 下午5:05
 * To change this template use File | Settings | File Templates.
 */
public interface CourseInviteStudentDao extends ModelDao<CourseInviteStudent> {

    public CourseInviteStudent findByCourseAndEmail(Integer cid,String email);

    public List<CourseInviteStudent> findByCourseId(Integer cid);

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 11-11-22
     * Time: 下午2:38
     * To change this template use File | Settings | File Templates.
     */
    @Repository("courseCommentDao")
    class CourseCommentDaoImpl extends ModelDaoImpl<CourseComment> implements CourseCommentDao{
        public List<CourseComment> findByCourseId(Pagination pagination, Integer cid) {
            return this.find("From CourseComment cc where cc.course.id=? order by cc.id desc",pagination,cid);
        }
    }

    @Repository("courseDao")
    class CourseDaoImpl extends ModelDaoImpl<Course> implements CourseDao {

        private static String QUERY_RELATED_COURSE = "select distinct c from Course c   join c.classes cc left join c.seniorClassRooms sc  left join c.organization org  where c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and cc.course.id = c.id and  (c.teacher.id=? or c.cameraMan.id=? or org.responsiblePerson.id=? or sc.student.id=?) ";
        private static String QUERY_MY_FORCAST_CLASS = "select distinct c from Course c   join c.classes cc left join c.seniorClassRooms sc  left join c.organization org  where c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and cc.course.id = c.id and  (c.teacher.id=? or sc.student.id=?) ";
        private static String COURSE_CONFIRMED = " c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true ";
        private BaseUserDao baseUserDao;
        private ChangeResponserHistoryDao.OrganizationDao organizationDao;
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

             String s ="select distinct c from Course c, CourseClass cc where  c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and cc.course.id = c.id and  " + this.getFinisDateLessThanNow();

            List<Course> courses2 =  this.find(s, page, Utils.getCurrentCalender());

            return courses2;
        }

        public List<Course> findCourseOfLivingClass(Pagination page) {

            String hql = "select distinct c from Course c,CourseClass cc where c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and cc.course.id = c.id and cc.date<? and "+this.getFinisDateBiggerThanNow()+" and cc.isTeacherEntered=true";
            Calendar startTime = Calendar.getInstance();
            startTime.add(Calendar.MINUTE,10);
            Calendar endTime = Calendar.getInstance();
            endTime.add(Calendar.MINUTE,-10);
            List<Course> courses2 = this.find(hql,page,startTime,endTime);
            for(Course c:courses2){
                c.setClasses(getLivingClasses(c.getClasses()));
            }
            return courses2;
        }

        public List<Course> findCourseOfForcastClass(Pagination page) {

            String hql = "select distinct c from Course c,CourseClass cc where c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and cc.course.id = c.id and "+this.getFinisDateBiggerThanNow()+" order by c.publicationTime desc";
            List<Course> courses =  this.find(hql, page, Utils.getCurrentCalender());
            return courses;
        }

        public List<Course> findMaintenanceCourses(Integer tid, Pagination pagination) {
            String hql = "select distinct c from Course c,CourseClass cc  left join c.organization org   where c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and cc.course.id = c.id and (c.teacher.id=? or org.responsiblePerson.id = ?) and "+this.getFinisDateBiggerThanNow()+" order by c.publicationTime desc";
            List<Course> courses =  this.find(hql,pagination,tid,tid,Utils.getCurrentCalender());
            return courses;
        }

        public List<Course> searchCourseByName(Pagination page, String name) {
            String hql = "select distinct c from Course c,CourseClass cc where c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and cc.course.id = c.id and c.name like ?";
            return this.find(hql, page, "%"+name+"%");
        }


        public List<Course> findMyCourseOfForcastClass(Pagination page,Integer sid) {
            String hql = QUERY_MY_FORCAST_CLASS +" and "+this.getFinisDateBiggerThanNow()+"   order by c.publicationTime desc ";
            Calendar now = Calendar.getInstance();
            now.add(Calendar.MINUTE,-15);
            List<Course> courses = this.find(hql,page,sid,sid,now);
            return courses;
        }

        public List<Course> findUserCreatedCourses(Integer userID, Pagination pagination) {
            String hql =   "select distinct c from Course c left join c.organization org  where"+ getCourseConfirmedStr() +" and  (c.teacher.id=? or org.responsiblePerson.id=?) order by c.publicationTime desc ";

            return this.find(hql,pagination,userID,userID);
        }

        public List<Course> findUserRegCourses(Integer userID, Pagination pagination) {
            String hql =   "select distinct c from Course c left join c.seniorClassRooms sc where "+ getCourseConfirmedStr() +" and sc.course.id = c.id and  (sc.student.id=?) order by c.publicationTime desc ";

            return this.find(hql,pagination,userID);
        }

        public List<Course> findMyCourseOFAgePart(Pagination pagination, Integer sid) {
            String hql = "select distinct c from Course c  left join c.organization org  where c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and (c.teacher.id=? or org.responsiblePerson.id=?) and c.id= (select max(nc.id) from Course nc where nc.fromCourse.id = c.fromCourse.id and nc.masterConfirmed=true and nc.teacherConfirmed=true and nc.cameraManConfirmed=true ) order by c.publicationTime desc";
             List<Course> courses = this.find(hql,pagination,sid,sid);
            return courses;
        }

        public List<Course> findMyCourseOfForcastClassForUserCenter(Pagination page,Integer sid) {
            String hql = QUERY_MY_FORCAST_CLASS +" and "+getFinisDateBiggerThanNow()+"   group by c  order by MIN(cc.date) asc ";
            Calendar now = Calendar.getInstance();
            now.add(Calendar.MINUTE,-15);
            List<Course> courses = this.find(hql,page,sid,sid,now);
            return courses;
        }
        private String getFinisDateBiggerThanNow(){
            return  " cc.duration > timestampdiff(minute,cc.date ,? ) ";
        }
        private String getFinisDateLessThanNow(){
            return  " cc.duration < timestampdiff(minute,cc.date ,? ) ";
        }

        private String getCourseConfirmedStr(){
            return " c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true ";
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
            return courses;
        }

        public List<Course> findHotCourses(Pagination pagination) {
            return this.find("select distinct  c from Course c   left join c.seniorClassRooms sc   where c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true group by c order by count(sc.id) desc",pagination);
        }

        public List<Course> findlatestCourses(Pagination pagination) {
            return this.find("From Course c where  c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true order by c.id desc",pagination);
        }



        public List<Course> findCourses2Teacher(Integer tid, Pagination pagination) {
            return this.find("From Course c where c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and  c.teacher.id=? and c.fromCourse.id = c.id order by c.startDate desc",pagination,tid);
        }

        public List<Course> findCourses2Student(Integer tid, Pagination pagination) {
            return this.find("select c From Course c join  c.seniorClassRooms sc where c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and sc.student.id=? order by c.startDate desc",pagination,tid);
        }

        public List<Course> findCourseWithStudentIdAndCourseId(Integer tid, Integer cid) {
            return this.find("select c From Course c join  c.seniorClassRooms sc where c.id =? and  c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and sc.student.id=? order by c.startDate desc",cid,tid);
        }

        public List<Course> findCourseRelateCourses(String courseName,Pagination pagination) {
            return this.find("From Course c where c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and c.name like ? order by c.id asc ", new Pagination(2), courseName);
        }

        public List<Course> findOrgForcastClass(Pagination pagination) {
            return this.find("select distinct c from Course c,CourseClass cc where c.organization is not NULL and c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and cc.course.id = c.id and "+this.getFinisDateBiggerThanNow()+" order by c.publicationTime desc");
        }

        public Course findTodayCourse(Integer userId) {
            String s = QUERY_RELATED_COURSE + " and "+this.getFinisDateBiggerThanNow()+" and cc.date < ? group by c order by MIN(cc.date) asc";
            Calendar tomorrow = Utils.getClientTodayCalendar();
            tomorrow.add(Calendar.DAY_OF_YEAR, 1);
            List<Course> todayList = this.find(s, userId, userId, userId, userId, Utils.getCurrentCalender(), tomorrow);
            return todayList != null && todayList.size() > 0 ? todayList.get(0) : null;
        }


        public Course findTomorrowCourse(Integer userId) {

            String s = QUERY_RELATED_COURSE + " and cc.date between ? and ? group by c order by MIN(cc.date) asc";
    //        String s ="select distinct c from Course c   join c.classes cc left join c.seniorClassRooms sc    where c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and cc.course.id = c.id and sc.course.id=c.id and (c.teacher.id=3 or c.cameraMan.id=3 or c.organization.responsiblePerson.id=3 or sc.student.id=3)  order by cc.date desc";

            Calendar tomorrow = Utils.getClientTodayCalendar();
            tomorrow.add(Calendar.DAY_OF_YEAR, 1);
            Calendar afterTomorrow = Utils.getClientTodayCalendar();
            afterTomorrow.add(Calendar.DAY_OF_YEAR, 2);
            List<Course> todayList = this.find(s, userId, userId, userId, userId, tomorrow, afterTomorrow);
            return todayList != null && todayList.size() > 0 ? todayList.get(0) : null;
        }

        public Course findYesterdayCourse(Integer userId) {

            String s = QUERY_RELATED_COURSE + " and cc.date between ? and ? group by c order by MAX(cc.date) desc";
    //        String s ="select distinct c from Course c   join c.classes cc left join c.seniorClassRooms sc    where c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and cc.course.id = c.id and sc.course.id=c.id and (c.teacher.id=3 or c.cameraMan.id=3 or c.organization.responsiblePerson.id=3 or sc.student.id=3)  order by cc.date desc";

            Calendar yesterday = Utils.getClientTodayCalendar();
            yesterday.add(Calendar.DAY_OF_YEAR, -1);
            List<Course> todayList = this.find(s, userId, userId, userId, userId,yesterday, Utils.getClientTodayCalendar());
            return todayList != null && todayList.size() > 0 ? todayList.get(0) : null;
        }

        public  List<Course> findLatestCourseByOrg(Integer orgId, Pagination page) {
            String hql = "select c from Course c  join c.classes cc  where c.organization.id = ? and cc.date > ?  order by c.id desc";
            return  this.find(hql, page, orgId, Utils.getCurrentCalender());
        }
        public List<Course> findHotCoursesByOrg(Integer orgId, Pagination pagination) {
            return this.find("select distinct  c from Course c   left join c.seniorClassRooms sc   where c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and c.organization.id = ?  group by c order by count(sc.id) desc",pagination,orgId);
        }

        private List<CourseClass> getLivingClasses(List<CourseClass> courseClasses ){
            List<CourseClass> curr = new ArrayList<CourseClass>();
            for(CourseClass cc:courseClasses){
                if(cc.getDate().getTimeInMillis()<Utils.getCurrentCalender().getTimeInMillis()&&cc.getFinishDate().getTimeInMillis()>Utils.getCurrentCalender().getTimeInMillis()){
                       curr.add(cc);
                }
            }
            return curr;
        }

        private List<CourseClass> getForcastClasses(List<CourseClass> courseClasses){
            List<CourseClass> curr = new ArrayList<CourseClass>();
            for(CourseClass cc:courseClasses){
                  if(cc.getDate().getTimeInMillis()>Utils.getCurrentCalender().getTimeInMillis()){
                       curr.add(cc);
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
            String QUERY_ORG_SUPERVISION_COURSE = "select distinct c from Course c   join c.classes cc left join c.organization org  where c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and cc.course.id = c.id and  (org.responsiblePerson.id=?) ";
            String hql = QUERY_ORG_SUPERVISION_COURSE +" and cc.duration > timestampdiff(minute,cc.date ,? ) group by c  order by MIN(cc.date) asc ";
            Calendar now = Calendar.getInstance();
            now.add(Calendar.MINUTE,-20);
            return this.find(hql,pagination,Rid,now);
        }

        public List<Course> findCourseOnline(Pagination pagination) {
            String Query_online =  "select distinct c from Course c   join c.classes cc left join c.seniorClassRooms sc  left join c.organization org  where c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and cc.course.id = c.id ";
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
            String hql = "From Course c where c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and c.organization.id=? and c.fromCourse.id = c.id";
            return this.find(hql,pagination,orgID);
        }

        public List<Course> findByFromCourse(Integer fromCourseID, Pagination pagination) {
            String hql = "From Course c where c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and c.fromCourse.id=?";
            return this.find(hql,pagination,fromCourseID);
        }

        public List<Course> findLatest4Course(Pagination pagination) {
            String hql = "From Course c where c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true order by c.publicationTime desc";
            return this.find(hql,pagination);
        }

        public List<Course> findCoursesInTypes(Integer type, Pagination pagination) {
            String hql = "From Course c where c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and c.courseType=? order by c.publicationTime desc";
            return this.find(hql,pagination,type);
        }

        public List<Course> searchCourses(String searchStr, Pagination pagination) {
            if(searchStr == null || searchStr.equals("")) return this.findHotCourses(pagination);
            String hql ="From Course c where " + COURSE_CONFIRMED + "and (c.name like ? or c.teacher.nickName like ?) order by c.id desc";
            return this.find(hql,pagination,"%"+searchStr+"%","%"+searchStr+"%");
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

        public ChangeResponserHistoryDao.OrganizationDao getOrganizationDao() {
            return organizationDao;
        }

        public void setOrganizationDao(ChangeResponserHistoryDao.OrganizationDao organizationDao) {
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

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 11-11-20
     * Time: 下午1:24
     * To change this template use File | Settings | File Templates.
     */

    @Repository("courseEvaluationDao")
    class CourseEvaluationDaoImpl extends ModelDaoImpl<CourseEvaluation> implements CourseEvaluationDao{

        public CourseEvaluation findByEvaluatorId(Integer eid) {
            List<CourseEvaluation> courseEvaluations = new ArrayList<CourseEvaluation>();
            courseEvaluations = this.find("From CourseEvaluation ce where ce.evaluator.id=?",eid);
            if(courseEvaluations==null||courseEvaluations.size()==0){
                return null;
            }
            return courseEvaluations.get(0);
        }

        public List<CourseEvaluation> findByCourseId(Pagination pagination, Integer cid) {
            return this.find("From CourseEvaluation ce where ce.course.id=?",cid);
        }

        public CourseEvaluation findByCourseId(Integer cid) {
            return this.findFist("From CourseEvaluation ce where ce.course.id=?",cid);
        }

        public List<CourseEvaluation> findByTeacherId(Pagination pagination, Integer cid) {
            return this.find("From CourseEvaluation ce where ce.course.teacher.id=?",cid);

        }


        public List<CourseEvaluation> findByOrganizationId(Pagination pagination, Integer oid) {
            return this.find("select distinct ce From CourseEvaluation ce join  ce.course c join c.organization org where org.id=? ",pagination,oid);
        }
    }

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 12-2-16
     * Time: 下午5:06
     * To change this template use File | Settings | File Templates.
     */

    @Repository("courseInviteStudentDao")
    class CourseInviteStudentDaoImpl extends ModelDaoImpl<CourseInviteStudent> implements CourseInviteStudentDao{
        public CourseInviteStudent findByCourseAndEmail(Integer cid, String email) {
            List<CourseInviteStudent> courseInviteStudents = this.find("From CourseInviteStudent cs where cs.course.id=? and cs.invitedStudentEmail=?", cid, email);
            if(courseInviteStudents==null||courseInviteStudents.size()==0){
                return null;
            }
            return courseInviteStudents.get(0);
        }

        public List<CourseInviteStudent> findByCourseId(Integer cid) {
            return this.find("From CourseInviteStudent cs where cs.course.id=?",cid);
        }
    }

    /**
     *Created by IntelliJ IDEA.
     * User: Yongzhi
     * Date: 12-5-13
     * Time: 下午10:12.
     */

    @Repository("courseMaterialDao")
    class CourseMaterialDaoImpl extends ModelDaoImpl<CourseMaterial> implements CourseMaterialDao{

        public List<CourseMaterial> findByCourseId(Pagination pagination, Integer courseId) {
            return this.find("From CourseMaterial cm where cm.course.id=? order by cm.uploadTime desc",pagination,courseId);
        }
    }

    @Repository("courseNewEventDao")
    class CourseNewEventDaoImpl extends ModelDaoImpl<CourseNewEvent> implements CourseNewEventDao{

        public List<CourseNewEvent> findLatestTenEvents(Pagination pagination) {
            String hql = "From CourseNewEvent cne order by cne.id desc";
            return this.find(hql,pagination);
        }

        public List<CourseNewEvent> findByCourseID(Integer courseID, Pagination pagination) {
            String hql = "From CourseNewEvent cne where cne.course.id=? order by cne.id desc";
            return this.find(hql,pagination,courseID);
        }
    }

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 11-11-25
     * Time: 下午4:49
     * To change this template use File | Settings | File Templates.
     */
    @Repository("courseQuestionDao")
    class CourseQuestionDaoImpl extends ModelDaoImpl<CourseQuestion> implements CourseQuestionDao{

        public List<CourseQuestion> findNewByCourseId(Pagination pagination, Integer cid) {
            return this.find("From CourseQuestion cq where cq.course.id=? and cq.isAnswered = false",cid);
        }
    }

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 12-4-7
     * Time: 下午2:11
     * To change this template use File | Settings | File Templates.
     */
    @Repository("courseRecommendDao")
    class CourseRecommendDaoImpl extends ModelDaoImpl<CourseRecommend> implements CourseRecommendDao{
    }

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 12-4-4
     * Time: 下午4:18
     * To change this template use File | Settings | File Templates.
     */
    @Repository("courseReservationDao")
    class CourseReservationDaoImpl extends ModelDaoImpl<CourseReservation> implements CourseReservationDao{

        public CourseReservation findByCourseAndUser(Integer courseID, Integer userID) {
            String hql = "From CourseReservation cr where cr.course.id = ? and cr.owner.id=?";
            return this.findFist(hql,courseID,userID);
        }

    }

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 11-11-23
     * Time: 下午3:18
     * To change this template use File | Settings | File Templates.
     */
    @Repository("courseResourceDao")
    class CourseResourceDaoImpl extends ModelDaoImpl<CourseResource> implements CourseResourceDao{

        public List<CourseResource> findByCourseId(Pagination pagination, Integer cid) {
            return this.find("From CourseResource cr where cr.course.id=?",cid);
        }

    }
}
