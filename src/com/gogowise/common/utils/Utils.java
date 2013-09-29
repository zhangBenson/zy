package com.gogowise.common.utils;

import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.nio.channels.FileChannel;
import java.util.Calendar;
import java.util.Date;

public class Utils {
    protected static Logger logger = LogManager.getLogger(Utils.class.getName());

    public static String getUTF8String(String srcStr) {
        byte[] strByte = new byte[0];
        try {
            strByte = srcStr.getBytes();

            return new String(strByte, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void doCopy(Object u1, Object u2) {
        try {
            PropertyUtils.copyProperties(u1, u2);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
    }

    public static Date getToday() {
        Calendar today = Calendar.getInstance();
        today.set(Calendar.HOUR_OF_DAY, 0);
        today.set(Calendar.MINUTE, 0);
        today.set(Calendar.SECOND, 0);
        today.set(Calendar.MILLISECOND, 0);
        return today.getTime();
    }

    public static Calendar getClientTodayCalendar() {
        Calendar today = Calendar.getInstance();
        changeTimeZoneForOut(today);
        today.set(Calendar.HOUR_OF_DAY, 0);
        today.set(Calendar.MINUTE, 0);
        today.set(Calendar.SECOND, 0);
        today.set(Calendar.MILLISECOND, 0);
        return today;
    }

    private static void changeTimeZoneForOut(Calendar cal){
        Float timezone = null;
        String country = null;
        if ( ActionContext.getContext() != null) {
            timezone = (Float) ActionContext.getContext().getSession().get("timeZone");
            country = ActionContext.getContext().getLocale().getCountry();
        }
        if (timezone == null || timezone.equals(0)) {
            changeCalByCountryForOut(cal, country);
        } else {
            cal.add(Calendar.MINUTE, (int) (timezone * 60));
        }
    }

    private static void changeCalByCountryForOut(Calendar cal, String country) {
        if ("SG".equals(country)) {
            cal.add(Calendar.HOUR, +8);
        } else if ("US".equals(country)) {
            cal.add(Calendar.HOUR, -5);
        } else if ("JP".equals(country)) {
            cal.add(Calendar.HOUR, +9);
        } else {
            cal.add(Calendar.HOUR, +8);
        }
    }


    public static Calendar getTodayCalendar() {
        Calendar today = Calendar.getInstance();
        today.set(Calendar.HOUR_OF_DAY, 0);
        today.set(Calendar.MINUTE, 0);
        today.set(Calendar.SECOND, 0);
        today.set(Calendar.MILLISECOND, 0);
        return today;
    }

    public static Calendar getCurrentCalender() {
        return Calendar.getInstance();
    }

    public static Calendar getClientCurrentCalender() {
        Calendar cal = Calendar.getInstance();
        changeTimeZoneForIn(cal) ;
        return cal;
    }

    public static String getCountHQLString(String hql) {
        String regex = " (?i)from ";
        hql = " " + hql;
        String[] hqlPart = hql.split(regex);
        if (hqlPart.length > 1) {
            if (StringUtils.containsIgnoreCase(hqlPart[0], "select")) {
                hqlPart[0] = hqlPart[0].replaceFirst("(?i)select", "select count( ") + " ) ";
            } else {
                hqlPart[0] = "select count(*) " + hqlPart[0];
            }

        }
        return StringUtils.join(hqlPart, " from ");
    }

    public static void replaceFileFromTmp(String toDir, String fileName){
        String srcPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_FILE_PATH_TMP + "/" + fileName);
        String toPath = ServletActionContext.getServletContext().getRealPath(toDir + "/" + fileName);
        replaceFile(srcPath, toPath);
    }
    public static void notReplaceFileFromTmp(String toDir, String fileName){
        String srcPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_FILE_PATH_TMP + "/" + fileName);
        String toPath = ServletActionContext.getServletContext().getRealPath(toDir + "/" + fileName);
        notReplaceFileAndCopy(srcPath, toPath);
    }

    public static void notReplaceFileFromfms(Integer userID,Integer personalOnliveID){
        String srcPath = "C:/Program Files/Adobe/Flash Media Server 4.5/applications/4f73962b107e4a9d6a14c42a-8f6a3b5b111b/streams/"+userID+"/Onlive/0/"+userID+"_"+personalOnliveID+"_Onlive.flv";
        String toPath =  ServletActionContext.getServletContext().getRealPath("");
        notReplaceFileAndCopy(srcPath,toPath);
    }

    public static void copyByChannel(File f1, File f2) {
        try {
            int length = Constants.BUFFER_SIZE;
            FileInputStream in = new FileInputStream(f1);
            FileOutputStream out = new FileOutputStream(f2);
            FileChannel inC = in.getChannel();
            FileChannel outC = out.getChannel();
            int i = 0;
            while (true) {
                if (inC.position() == inC.size()) {
                    inC.close();
                    outC.close();
                    return;
                }
                if ((inC.size() - inC.position()) < Constants.BUFFER_SIZE)
                    length = (int) (inC.size() - inC.position());
                else
                    length = Constants.BUFFER_SIZE;
                inC.transferTo(inC.position(), length, outC);
                inC.position(inC.position() + length);
                i++;
            }

        } catch (IOException e) {
            logger.error("copy file failed ", e);
        }
    }

    public static void replaceFile(String srcPath, String dstPath) {
        File src = new File(srcPath);
        File dst = new File(dstPath);

        if (!dst.getParentFile().exists()) {
            dst.getParentFile().mkdirs();
        } else {
            File files[] = dst.getParentFile().listFiles();
            for (File file : files) {
                file.delete();
            }
        }

        copyByChannel(src, dst);
    }



    public static void notReplaceFileAndCopy(String srcPath, String dstPath) {
        File src = new File(srcPath);
        File dst = new File(dstPath);

        if (!dst.getParentFile().exists()) {
            dst.getParentFile().mkdirs();
        }
        copyByChannel(src, dst);
    }

    public static Calendar getCalendarByDayOfWeekAndCalendar(Calendar calendar,int dayOfWeek,int offset){
        int startDayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
        int diff = dayOfWeek - startDayOfWeek;
        if(diff<=0) diff += 7;
        diff =diff+offset;
        Calendar c = Calendar.getInstance();
        c.setTime(calendar.getTime());
        c.add(Calendar.DAY_OF_YEAR,diff);
        return c;
    }

    public static Calendar getCalendarByDayOfWeekAndCalendarForShow(Calendar calendar,int dayOfWeek,int offset){
        int startDayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
        int diff = dayOfWeek - startDayOfWeek;
        if(diff<0) diff += 7;
        diff =diff+offset;
        Calendar c = Calendar.getInstance();
        c.setTime(calendar.getTime());
        c.add(Calendar.DAY_OF_YEAR,diff);
        return c;
    }
    public static void changeTimeZoneForIn(Calendar cal) {
        Float timezone = null;
        String country = null;
        if ( ActionContext.getContext() != null) {
             timezone = (Float) ActionContext.getContext().getSession().get("timeZone");
             country = ActionContext.getContext().getLocale().getCountry();
        }
        if (timezone == null || timezone.equals(0)) {
            changeCalByCountry(cal, country);
        } else {
            cal.add(Calendar.MINUTE, -(int) (timezone * 60));
        }
    }

     public static Calendar changeBaseOnTimeZone4Action(Calendar cal) {
        Float timezone = null;
        String country = null;
        if ( ActionContext.getContext() != null) {
             timezone = (Float) ActionContext.getContext().getSession().get("timeZone");
             country = ActionContext.getContext().getLocale().getCountry();
        }
        if (timezone == null || timezone.equals(0)) {
            changeCalByCountry(cal, country);
        } else {
            cal.add(Calendar.MINUTE, +(int) (timezone * 60));
        }
         return cal;
    }



    public static void changeCalByCountry(Calendar cal, String country) {
        if ("SG".equals(country)) {
            cal.add(Calendar.HOUR, -8);
        } else if ("US".equals(country)) {
            cal.add(Calendar.HOUR, +5);
        } else if ("JP".equals(country)) {
            cal.add(Calendar.HOUR, -9);
        } else {
            cal.add(Calendar.HOUR, -8);
        }
    }
    
    public static String getOrderId(){
        return Calendar.getInstance().getTimeInMillis() + "";
    }
    
     public static String getEmptyString(String s) {
           return  s== null ? "": s;
     }
    public static Integer getEmptyInteger(Integer s) {
           return  s == null ? 0: s;
    }

    public static Calendar getDateOfWeekForTheFirstTerm(Calendar referDate,String dateOfWeeks[] ,Calendar showFixedTime){
          Integer referDayOfWeek = referDate.get(Calendar.DAY_OF_WEEK);
          Integer hour = showFixedTime.get(Calendar.HOUR_OF_DAY);
          Integer minute = showFixedTime.get(Calendar.MINUTE);
         Calendar startTime = Calendar.getInstance();
          if(referDate.get(Calendar.DAY_OF_YEAR)==Calendar.getInstance().get(Calendar.DAY_OF_YEAR) && Utils.equalOneDay(referDayOfWeek,dateOfWeeks)){
                 //参考日期在当前天
                Calendar current = Calendar.getInstance();
                if(hour > current.get(Calendar.HOUR_OF_DAY) || (hour == current.get(Calendar.HOUR_OF_DAY) && minute > current.get(Calendar.MINUTE))){
                                //播出时间大于当前时间点
                    startTime.setTime(referDate.getTime());
                    startTime.set(Calendar.HOUR_OF_DAY,hour);
                    startTime.set(Calendar.MINUTE,minute);
                    return startTime;
                }else {   //播出时间小于当前时间点
                    startTime.setTime(getNextDayOfRefer(referDate,dateOfWeeks).getTime());
                    startTime.set(Calendar.HOUR_OF_DAY,hour);
                    startTime.set(Calendar.MINUTE,minute);
                    return startTime;
                }
          }else if(referDate.get(Calendar.DAY_OF_YEAR)!=Calendar.getInstance().get(Calendar.DAY_OF_YEAR) && Utils.equalOneDay(referDayOfWeek,dateOfWeeks)){
                //参考日期不在当天，但是播出日期的其中一天
                    startTime.setTime(referDate.getTime());
                    startTime.set(Calendar.HOUR_OF_DAY,hour);
                    startTime.set(Calendar.MINUTE,minute);
                    return startTime;
          }else{
               //参考日期不在当天，但是也不是播出日期的其中一天
                startTime.setTime(getNextDayOfRefer(referDate,dateOfWeeks).getTime());
                startTime.set(Calendar.HOUR_OF_DAY,hour);
                startTime.set(Calendar.MINUTE,minute);
                return startTime;
          }
    }

     public static Calendar getDateOfWeek(Calendar referDate,String dateOfWeeks[] ,Calendar showFixedTime){
          Integer referDayOfWeek = referDate.get(Calendar.DAY_OF_WEEK);
          Integer hour = showFixedTime.get(Calendar.HOUR_OF_DAY);
          Integer minute = showFixedTime.get(Calendar.MINUTE);
          Calendar startTime = Calendar.getInstance();
          startTime.setTime(getNextDayOfRefer(referDate,dateOfWeeks).getTime());
          startTime.set(Calendar.HOUR_OF_DAY,hour);
          startTime.set(Calendar.MINUTE,minute);
          return startTime;

    }

    public static Calendar getNextDayOfRefer(Calendar referDate,String dateOfWeeks[]){
           Integer referDayOfWeek = referDate.get(Calendar.DAY_OF_WEEK);
        if(Utils.existLarger(referDayOfWeek,dateOfWeeks)){
            return Utils.getCalendarByDayOfWeekAndCalendarForShow(referDate,getFirstLargeOne(referDayOfWeek,dateOfWeeks),0);
        }else {
            return Utils.getCalendarByDayOfWeekAndCalendarForShow(referDate,Integer.parseInt(dateOfWeeks[0]),0);
        }
    }
    private static Boolean existLarger(Integer now , String dateOfWeeks[]){
        for(String dow : dateOfWeeks){
            if(Integer.parseInt(dow) > now){
                return true;
            }
        }
        return false;
    }

    private static Integer getFirstLargeOne(Integer now , String dateOfWeeks[]){
        for(String dow : dateOfWeeks){
            if(Integer.parseInt(dow) > now){
                return Integer.parseInt(dow);
            }
        }
        return null;
    }

    private static Boolean equalOneDay(Integer now , String dateOfWeeks[]){

        for(String dow : dateOfWeeks){
             if(Integer.parseInt(dow) == now){
                return true;
            }
        }
        return false;
    }

    public static Integer getSeasonOfYear(int month){
        if(month >= 1 && month <= 3){
            return 1;
        }else if(month >= 4 && month <= 6){
            return 2;
        }else if(month >= 7 && month <= 9){
            return 3;
        }else {
            return 4;
        }
    }


    public synchronized static void pptConvert(String srcPpt, String desDir) throws IOException {
        File dst = new File(desDir);
        if (!dst.exists()) {
            dst.mkdirs();
        }
        String cmd = "cmd /c start " + ServletActionContext.getServletContext().getRealPath("") + "\\PptFormatConverter.exe  " + srcPpt + " " + desDir + " jpg ";
        Process ps = Runtime.getRuntime().exec(cmd);
    }

    public static void copy(File src, File dst) {
        if (!dst.getParentFile().exists()) {
            dst.getParentFile().mkdirs();
        }
        copyByChannel(src, dst);
    }
}
