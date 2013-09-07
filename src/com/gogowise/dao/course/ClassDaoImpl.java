package com.gogowise.dao.course;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.ModelDaoImpl;
import com.gogowise.domain.course.Course;
import com.gogowise.domain.course.CourseClass;
import com.gogowise.domain.course.CourseInviteStudent;
import com.gogowise.domain.course.SeniorClassRoom;
import com.gogowise.domain.user.BaseUser;
import com.gogowise.common.utils.EmailUtil;
import com.gogowise.common.utils.Utils;
import com.opensymphony.xwork2.util.LocalizedTextUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.*;
import org.hibernate.sql.JoinType;
import org.springframework.stereotype.Repository;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-10-23
 * Time: 下午1:45
 * To change this template use File | Settings | File Templates.
 */

@Repository("classDao")
public class ClassDaoImpl extends ModelDaoImpl<CourseClass> implements ClassDao {

    private CourseInviteStudentDao courseInviteStudentDao;
    private SeniorClassRoomDao  seniorClassRoomDao;

    public void saveClass(CourseClass courseClass, Course course, Integer duration) {
        courseClass.setCourse(course);
        Calendar cal = Calendar.getInstance();
        cal.setTime(courseClass.getDate().getTime());
        courseClass.setDuration(duration);
        CourseClass curr = this.findByClassNameAndCourseId(courseClass.getName(), course.getId());
        if (curr == null) {
            this.persistAbstract(courseClass);
        } else {
            courseClass.setId(curr.getId());
            this.persistAbstract(courseClass);
        }
    }

    public void editClass(CourseClass courseClass) {
         CourseClass cc = this.findById(courseClass.getId());
        cc.setNickName(courseClass.getNickName());
        cc.setDate(courseClass.getDate());
        cc.setDuration(courseClass.getDuration());
        this.persistAbstract(cc);
    }

    public List<CourseClass> findAgeCourse(Integer id) {
        Criteria c = createAgeCriteria(id);
        c.addOrder(Order.desc("date"));
        return c.list();
    }

    public List<CourseClass> findOngoingCourse(Integer id) {
        Criteria c = createOngoingCriteria(id);
        c.addOrder(Order.desc("date"));
        return c.list();
    }

    public List<CourseClass> findForcastCourse(Integer id) {
        Criteria c = createForcastCriteria(id);
        c.addOrder(Order.asc("date"));
        return c.list();
    }

    public List<CourseClass> findMyForcastCourse(Integer id, Integer cid) {

        Criteria c = createMyForcastCriteria(id, cid);
        c.addOrder(Order.asc("date"));
        return c.list();
    }

    public List<CourseClass> findByCourseId(Integer cid) {
        return this.find("From CourseClass c where c.course.id=? order by c.date", cid);
    }

    public CourseClass findByClassNameAndCourseId(String className, Integer cid) {
        List<CourseClass> classes = new ArrayList<CourseClass>();
        classes = this.find("From CourseClass c where c.course.id=? and c.name=?", cid, className);
        if (classes.size() == 0) {
            return null;
        } else {
            return classes.get(0);
        }
    }

    public void autoClassSystemSave(List<Calendar> startTimes, List<Integer> durations, List<Integer> classDate, Integer repeatTimes, Course course) {
        for (int i = 0; i < classDate.size(); i++) {
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            for (int j = 0; j < repeatTimes; j++) {
                for (int k = 0; k < startTimes.size(); k++) {
                    Calendar c = Utils.getCalendarByDayOfWeekAndCalendar(course.getStartDate(),classDate.get(i),j * 7);
                    CourseClass curr = new CourseClass();
                    curr.setCourse(course);
                    c.set(Calendar.HOUR_OF_DAY, startTimes.get(k).get(Calendar.HOUR_OF_DAY));
                    c.set(Calendar.MINUTE, startTimes.get(k).get(Calendar.MINUTE));
                    curr.setDate(c);
                    curr.setDuration(durations.get(k));

                    Calendar cal = Calendar.getInstance();
                    //in order to avoid the problem of hibernate ,if I use the same calender of c  the date will be changed along with the change of finishDate.TODO：discuss with ZhangZong
                    cal.setTime(c.getTime());
                    this.persistAbstract(curr);
                }
            }
        }
    }





    private Criteria createAgeCriteria(Integer id) {
        Criteria dc = this.getSession().createCriteria(CourseClass.class);
        dc.createAlias("course","c", JoinType.LEFT_OUTER_JOIN);
        dc.add(Property.forName("c.masterConfirmed").eq(true)).add(Property.forName("c.teacherConfirmed").eq(true)).add(Property.forName("c.cameraManConfirmed").eq(true)).add(Property.forName("c.id").eq(id));
        SimpleExpression lt = Restrictions.lt("finishDate",Utils.getCurrentCalender());
        dc.add(lt);
        return dc;


//        SimpleExpression ltDate = Restrictions.lt("date", Utils.getTodayCalendar()); // date less than current Sysdate
//        SimpleExpression eqDate = Restrictions.eq("date", Utils.getTodayCalendar());
//        SimpleExpression time1 = Restrictions.lt("endTimeHour", end.get(Calendar.HOUR_OF_DAY));
//        SimpleExpression time2 = Restrictions.eq("endTimeHour", end.get(Calendar.HOUR_OF_DAY));
//        SimpleExpression time3 = Restrictions.lt("endTimeMinite", end.get(Calendar.MINUTE));
//
//        LogicalExpression andExp1 = Restrictions.and(eqDate, time1);  //eqDate but less than hours
//        LogicalExpression andExp2 = Restrictions.and(eqDate, time2);
//        LogicalExpression andExp3 = Restrictions.and(andExp2, time3);  //eqDate and eqHours but less than minutes
//
//
//        LogicalExpression orExp1 = Restrictions.or(ltDate, andExp1);
//        LogicalExpression exp = Restrictions.or(orExp1, andExp3);
//        dc.add(exp);
//        dc.createAlias("course", "c", CriteriaSpecification.LEFT_JOIN);
//        dc.add(Property.forName("c.masterConfirmed").eq(true)).add(Property.forName("c.teacherConfirmed").eq(true)).add(Property.forName("c.cameraManConfirmed").eq(true)).add(Property.forName("c.id").eq(id));

    }

    private Criteria createOngoingCriteria(Integer id) {

        Criteria dc = this.getSession().createCriteria(CourseClass.class);
        dc.createAlias("course", "c", JoinType.LEFT_OUTER_JOIN);
        dc.add(Property.forName("c.masterConfirmed").eq(true)).add(Property.forName("c.teacherConfirmed").eq(true)).add(Property.forName("c.cameraManConfirmed").eq(true)).add(Property.forName("c.id").eq(id));
        SimpleExpression lt = Restrictions.lt("date",Utils.getCurrentCalender());
        SimpleExpression gt = Restrictions.gt("finishDate",Utils.getCurrentCalender());
        LogicalExpression and = Restrictions.and(gt,lt);
        dc.add(and);
         return dc;

//        SimpleExpression eqDate = Restrictions.eq("date", Utils.getTodayCalendar());
//        SimpleExpression ltHour = Restrictions.lt("startTimeHour", end.get(Calendar.HOUR_OF_DAY));
//        SimpleExpression eqHour = Restrictions.eq("startTimeHour", end.get(Calendar.HOUR_OF_DAY));
//        SimpleExpression ltMinute = Restrictions.lt("startTimeMinite", end.get(Calendar.MINUTE));
//        LogicalExpression andlt = Restrictions.and(eqHour, ltMinute);
//        LogicalExpression lt = Restrictions.or(ltHour, andlt);
//
//        SimpleExpression gtHour = Restrictions.gt("endTimeHour", end.get(Calendar.HOUR_OF_DAY));
//        SimpleExpression eqHour1 = Restrictions.eq("endTimeHour", end.get(Calendar.HOUR_OF_DAY));
//        SimpleExpression gtMinute = Restrictions.gt("endTimeMinite", end.get(Calendar.MINUTE));
//        LogicalExpression andgt = Restrictions.and(eqHour1, gtMinute);
//        LogicalExpression gt = Restrictions.or(gtHour, andgt);
//
//        LogicalExpression andExp = Restrictions.and(eqDate, lt);
//        LogicalExpression exp = Restrictions.and(andExp, gt);
//        dc.add(exp);

    }

    private Criteria createForcastCriteria(Integer id) {

        Criteria dc = this.getSession().createCriteria(CourseClass.class);
        dc.createAlias("course", "c",  JoinType.LEFT_OUTER_JOIN);
        dc.add(Property.forName("c.masterConfirmed").eq(true)).add(Property.forName("c.teacherConfirmed").eq(true)).add(Property.forName("c.cameraManConfirmed").eq(true)).add(Property.forName("c.id").eq(id));
        SimpleExpression gt = Restrictions.gt("date", Utils.getCurrentCalender());
        dc.add(gt);
        return dc;
//        SimpleExpression gtDate = Restrictions.gt("date", Utils.getTodayCalendar());//date great than curr Date
//        SimpleExpression eqDate = Restrictions.eq("date", Utils.getTodayCalendar());
//        SimpleExpression gtHour = Restrictions.gt("startTimeHour", end.get(Calendar.HOUR_OF_DAY));
//        SimpleExpression eqHour = Restrictions.eq("startTimeHour", end.get(Calendar.HOUR_OF_DAY));
//        SimpleExpression gtMinute = Restrictions.gt("startTimeMinite", end.get(Calendar.MINUTE));
//
//        LogicalExpression andExp1 = Restrictions.and(eqDate, gtHour);//eq date but great than hours
//        LogicalExpression andExp2 = Restrictions.and(eqDate, eqHour);
//        LogicalExpression andExp3 = Restrictions.and(andExp2, gtMinute);//eq date and eq Hour but great than Minute
//
//        LogicalExpression orExp = Restrictions.or(gtDate, andExp1);
//        LogicalExpression exp = Restrictions.or(andExp3, orExp);
//        dc.add(exp);


    }

    private Criteria createMyForcastCriteria(Integer cid, Integer sid) {

        Criteria dc = this.getSession().createCriteria(CourseClass.class);
         dc.createAlias("course", "c",  JoinType.LEFT_OUTER_JOIN);
        dc.add(Property.forName("c.masterConfirmed").eq(true)).add(Property.forName("c.teacherConfirmed").eq(true)).add(Property.forName("c.cameraManConfirmed").eq(true)).add(Property.forName("c.id").eq(cid));
        dc.createAlias("c.cameraMan", "u",  JoinType.LEFT_OUTER_JOIN);
        dc.createAlias("c.teacher", "t",  JoinType.LEFT_OUTER_JOIN);
        dc.createAlias("c.organization", "o",  JoinType.LEFT_OUTER_JOIN);
        dc.createAlias("o.responsiblePerson", "r",  JoinType.LEFT_OUTER_JOIN);
        SimpleExpression eqCamra = Property.forName("u.id").eq(sid);
        SimpleExpression eqTeacher = Property.forName("t.id").eq(sid);
        SimpleExpression eqResponsor = Property.forName("r.id").eq(sid);
        LogicalExpression or1 = Restrictions.or(eqCamra, eqTeacher);
        LogicalExpression or2 = Restrictions.or(eqResponsor, or1);
        dc.add(or2);
        SimpleExpression ge = Restrictions.ge("date",Utils.getCurrentCalender());
        dc.add(ge);
        return dc;

//        SimpleExpression gtDate = Restrictions.gt("date", Utils.getTodayCalendar());//date great than curr Date
//        SimpleExpression eqDate = Restrictions.eq("date", Utils.getTodayCalendar());
//        SimpleExpression gtHour = Restrictions.gt("endTimeHour", end.get(Calendar.HOUR_OF_DAY));
//        SimpleExpression eqHour = Restrictions.eq("endTimeHour", end.get(Calendar.HOUR_OF_DAY));
//        SimpleExpression gtMinute = Restrictions.gt("endTimeMinite", end.get(Calendar.MINUTE));
//
//        LogicalExpression andExp1 = Restrictions.and(eqDate, gtHour);//eq date but great than hours
//        LogicalExpression andExp2 = Restrictions.and(eqDate, eqHour);
//        LogicalExpression andExp3 = Restrictions.and(andExp2, gtMinute);//eq date and eq Hour but great than Minute
//
//        LogicalExpression orExp = Restrictions.or(gtDate, andExp1);
//        LogicalExpression exp = Restrictions.or(andExp3, orExp);
//        dc.add(exp);


    }

    public List<CourseClass> find(Calendar startTime, Calendar endTime) {
         String sql = "select cs From CourseClass cs left join cs.course c where c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and cs.date between ? and ?";
        return find(sql, startTime, endTime);
    }

    public List<CourseClass> find(Calendar startTime){
        String sql = "select cs From CourseClass cs left join cs.course c where c.masterConfirmed=true and c.teacherConfirmed=true and c.cameraManConfirmed=true and cs.date = ? ";
        return find(sql, startTime);
    }


    public void sendEmailToAll(CourseClass courseClass){

        Map<String, BaseUser> emailMapsConfirmed = new HashMap<String, BaseUser>();
        emailMapsConfirmed.put(courseClass.getCourse().getTeacher().getEmail(), courseClass.getCourse().getTeacher()) ;

        List<SeniorClassRoom> seniorClassRooms =  seniorClassRoomDao.findClassRoomByCourseId(courseClass.getCourse().getId());
        for(SeniorClassRoom seniorClassRoom : seniorClassRooms) {
            emailMapsConfirmed.put(seniorClassRoom.getStudent().getEmail(), seniorClassRoom.getStudent());
        }
        for(String key : emailMapsConfirmed.keySet()) {
            sendNoticeEmail(key, courseClass,emailMapsConfirmed.get(key), true);
        }
        Map<String, BaseUser> emailMapsNotConfirmed = new HashMap<String, BaseUser>();
        List<CourseInviteStudent> courseInviteStudents =  courseInviteStudentDao.findByCourseId(courseClass.getCourse().getId());
        for (CourseInviteStudent courseInviteStudent : courseInviteStudents) {
            if (!courseInviteStudent.getAcceptInvite() && !emailMapsConfirmed.containsKey(courseInviteStudent.getInvitedStudentEmail()))
                emailMapsNotConfirmed.put(courseInviteStudent.getInvitedStudentEmail(),courseInviteStudent.getStudent());
        }
        for(String key : emailMapsNotConfirmed.keySet()) {
            sendNoticeEmail(key, courseClass,emailMapsNotConfirmed.get(key), false);
        }

    }

    private void sendNoticeEmail(String email, CourseClass courseClass, BaseUser baseUser, Boolean confirmed){
        String language = "zh";
        if (baseUser != null && baseUser.getLanguage() != null) {
            language = baseUser.getLanguage();
        }
        String courseName = courseClass.getCourse().getName();
        String[] titleArgs = {courseName};
        String title = LocalizedTextUtil.findDefaultText("course.class.email.notification.title", new Locale(language, ""),titleArgs) ;
        String logo = BasicAction.getBasePath() + "/"+ courseClass.getCourse().getLogoUrl();
        String href = "";
        if (!confirmed) {
            href =BasicAction.getBasePath() + "/" + "emailHandleForCourseCreation.html?course.id=" + courseClass.getCourse().getId()+"&accept=true&teacher=false&user.email="+email;
        }else {
            href =BasicAction.getBasePath() + "/myfirstPage.html?user.email="+email;
        }
        String name = courseClass.getName();

        Calendar calendar = (Calendar) courseClass.getDate().clone();
        calendar.add(Calendar.HOUR, 8);
        SimpleDateFormat sf = new SimpleDateFormat(LocalizedTextUtil.findDefaultText("global.display.hour.minute.second", new Locale(language, "")));
        String calendarString = sf.format(calendar.getTime());
        String[] args = {logo,name,calendarString,href,courseName};
        String body = LocalizedTextUtil.findDefaultText("course.class.email.notification.body", new Locale(language, ""),args) ;
        EmailUtil.sendMail(email,title,body);
    }

    public CourseInviteStudentDao getCourseInviteStudentDao() {
        return courseInviteStudentDao;
    }

    public void setCourseInviteStudentDao(CourseInviteStudentDao courseInviteStudentDao) {
        this.courseInviteStudentDao = courseInviteStudentDao;
    }

    public SeniorClassRoomDao getSeniorClassRoomDao() {
        return seniorClassRoomDao;
    }

    public void setSeniorClassRoomDao(SeniorClassRoomDao seniorClassRoomDao) {
        this.seniorClassRoomDao = seniorClassRoomDao;
    }
}
