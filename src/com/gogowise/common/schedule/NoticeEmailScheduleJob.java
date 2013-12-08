package com.gogowise.common.schedule;

import com.gogowise.rep.course.dao.ClassDao;
import com.gogowise.rep.course.enity.CourseClass;
import org.springframework.stereotype.Component;

import java.util.Calendar;
import java.util.List;


@Component
public class NoticeEmailScheduleJob  implements  Runnable {
    private Calendar calendar;

    private ClassDao classDao;
    public void run() {
        List<CourseClass> classes =  classDao.find(this.getCalendar());
        for (CourseClass cs : classes) {
            classDao.sendEmailToAll(cs);
        }
    }

    public Calendar getCalendar() {
        return calendar;
    }

    public void setCalendar(Calendar calendar) {
        this.calendar = calendar;
    }

    public ClassDao getClassDao() {
        return classDao;
    }

    public void setClassDao(ClassDao classDao) {
        this.classDao = classDao;
    }
}
