package com.gogowise.common.schedule;

import com.gogowise.rep.course.ClassDao;
import com.gogowise.domain.course.CourseClass;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.stereotype.Component;

import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Component
public class NoticeEmailScheduleManger {

    private Calendar calendar = Calendar.getInstance();
    private ThreadPoolTaskScheduler scheduler;
    private ClassDao classDao;
    private final static Integer MINUTE_FOR_NOTICE = 30;

    @Scheduled(cron = "0 0/30 * * * ?")
    private void doJob() {
        Calendar olderCalendar = (Calendar) calendar.clone();
        Calendar futureCalendar = Calendar.getInstance();
        futureCalendar.add(Calendar.MINUTE, MINUTE_FOR_NOTICE*2);
        calendar =  futureCalendar;
        List<CourseClass> courseClasses = classDao.find(olderCalendar, futureCalendar);
        Set<Calendar> classTartTimeSet = new HashSet<Calendar>();
        for (CourseClass courseClass : courseClasses) {
            classTartTimeSet.add(courseClass.getDate());
        }
        for (Calendar classStartCal : classTartTimeSet) {
            NoticeEmailScheduleJob job = new NoticeEmailScheduleJob();
            job.setClassDao(classDao);
            job.setCalendar(classStartCal);
            Calendar scheduleTime = (Calendar) classStartCal.clone();
            scheduleTime.add(Calendar.MINUTE, -MINUTE_FOR_NOTICE);
            scheduler.schedule(job, scheduleTime.getTime());
        }

    }


    public Calendar getCalendar() {
        return calendar;
    }

    public void setCalendar(Calendar calendar) {
        this.calendar = calendar;
    }

    public ThreadPoolTaskScheduler getScheduler() {
        return scheduler;
    }

    public void setScheduler(ThreadPoolTaskScheduler scheduler) {
        this.scheduler = scheduler;
    }

    public ClassDao getClassDao() {
        return classDao;
    }

    public void setClassDao(ClassDao classDao) {
        this.classDao = classDao;
    }
}

