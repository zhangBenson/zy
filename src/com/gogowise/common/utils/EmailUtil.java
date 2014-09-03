package com.gogowise.common.utils;


import com.gogowise.rep.system.MatterDao;
import com.gogowise.common.schedule.EmailJob;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;

import java.util.Calendar;

public final class EmailUtil {

    private EmailUtil() {
    }

    public static ThreadPoolTaskScheduler scheduler;
//    public static MatterDao matterDao;

    public static void sendMail(final String emailAddr, final String mailTitle, final String mailContent, final String[] fileNames, final String[] filePaths) {
        EmailJob job = new EmailJob();
        job.setEmailAddr(emailAddr);
        job.setMailTitle(mailTitle);
        job.setMailContent(mailContent);
        job.setFileNames(fileNames);
        job.setFilePaths(filePaths);
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.SECOND, 1);
        scheduler.schedule(job, calendar.getTime());
    }

    public static void sendMail(final String emailAddr, final String mailTitle,
                                final String mailConcept) {
        sendMail(emailAddr, mailTitle, mailConcept, "text/html;charset=utf-8");

    }


    public static void sendMail(final String emailAddr, final String mailTitle,
                                final String mailConcept, final String type) {
        sendMail(emailAddr, mailTitle, mailConcept, null, null);
    }

//    public static void sendMailAndSaveMatter(final String emailAddr, final String mailTitle,
//                                final String mailConcept,final Matter matter,final String type){
//       matterDao.persistAbstract(matter);
//       sendMail(emailAddr, mailTitle, mailConcept, null, null);
//    }

    public static String getEmailBoxUrl(String email) {
        String url = "";
        String emailBox = email.split("@")[1];
        if (emailBox.equals("qq.com")) {
            url = "http://mail.qq.com/" + "cgi-bin/loginpage?uin=" + email.substring(0, email.lastIndexOf("@"));
        } else {
            url = "http://www." + emailBox;
        }
        return url;
    }

}




