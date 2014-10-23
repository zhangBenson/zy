package com.gogowise.common.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.InvocationTargetException;
import java.nio.channels.FileChannel;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

public class Utils {
    private static final Logger logger = LogManager.getLogger(Utils.class.getName());

    private static final Map<String,Integer> TIME_ZONE_MAP = new HashMap<>();

    static {
        TIME_ZONE_MAP.put("SG",+8) ;
        TIME_ZONE_MAP.put("US",-5) ;
        TIME_ZONE_MAP.put("JP",+9) ;
    }

    public static void doCopy(Object dest, Object orig) throws IllegalAccessException, NoSuchMethodException, InvocationTargetException {

        PropertyUtils.copyProperties(dest, orig);
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

    private static void changeTimeZoneForOut(Calendar cal) {
        Float timezone = null;
        String country = null;
        if (ActionContext.getContext() != null) {
            timezone = (Float) ActionContext.getContext().getSession().get("timeZone");
            country = ActionContext.getContext().getLocale().getCountry();
        }
        if (timezone == null || timezone.equals(0F)) {
            changeCalByCountryForOut(cal, country);
        } else {
            cal.add(Calendar.MINUTE, (int) (timezone * 60));
        }
    }

    private static void changeCalByCountryForOut(Calendar cal, String country) {
        if (TIME_ZONE_MAP.containsKey(country)) {
            cal.add(Calendar.HOUR, TIME_ZONE_MAP.get(country));
        }  else {
            cal.add(Calendar.HOUR, +8);
        }
    }

    public static void changeCalByCountry(Calendar cal, String country) {

        if (TIME_ZONE_MAP.containsKey(country)) {
            cal.add(Calendar.HOUR, TIME_ZONE_MAP.get(country));
        } else {
            cal.add(Calendar.HOUR, -8);
        }
    }

    public static Calendar getCurrentCalender() {
        return Calendar.getInstance();
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


    public static void replaceFileFromTemp(String toDir, String fileName) {
        String srcPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_FILE_PATH_TMP + "/" + fileName);
        String desPath = ServletActionContext.getServletContext().getRealPath(toDir + fileName);
        replaceFile(srcPath, desPath);
    }

    private static void copyByChannel(File f1, File f2) {
        try {
            int length;
            FileInputStream in = new FileInputStream(f1);
            FileOutputStream out = new FileOutputStream(f2);
            FileChannel inC = in.getChannel();
            FileChannel outC = out.getChannel();
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
            }

        } catch (IOException e) {
            logger.error("copy file failed ", e);
        }
    }

    public static void replaceFile(String srcPath, String dstPath) {

        File src = new File(srcPath);
        File dst = new File(dstPath);

        if (!dst.getParentFile().exists()) {
            mkDir(dst.getParentFile());
        }
        copyByChannel(src, dst);
    }

    public static Calendar getCalendarByDayOfWeekAndCalendar(Calendar calendar, int dayOfWeek, int offset) {
        int startDayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
        int diff = dayOfWeek - startDayOfWeek;
        if (diff <= 0) diff += 7;
        diff = diff + offset;
        Calendar c = Calendar.getInstance();
        c.setTime(calendar.getTime());
        c.add(Calendar.DAY_OF_YEAR, diff);
        return c;
    }
    public static void changeTimeZoneForIn(Calendar cal) {
        Float timezone = null;
        String country = null;
        if (ActionContext.getContext() != null) {
            timezone = (Float) ActionContext.getContext().getSession().get("timeZone");
            country = ActionContext.getContext().getLocale().getCountry();
        }
        if (timezone == null || timezone.equals(0f)) {
            changeCalByCountry(cal, country);
        } else {
            cal.add(Calendar.MINUTE, -(int) (timezone * 60));
        }
    }

    public static Calendar changeBaseOnTimeZone4Action(Calendar cal) {
        Float timezone = null;
        String country = null;
        if (ActionContext.getContext() != null) {
            timezone = (Float) ActionContext.getContext().getSession().get("timeZone");
            country = ActionContext.getContext().getLocale().getCountry();
        }
        if (timezone == null || timezone.equals(0f)) {
            changeCalByCountry(cal, country);
        } else {
            cal.add(Calendar.MINUTE, +(int) (timezone * 60));
        }
        return cal;
    }




    public static String getOrderId() {
        return Calendar.getInstance().getTimeInMillis() + "";
    }

    public static String getEmptyString(String s) {
        return s == null ? "" : s;
    }

    public static Integer getEmptyInteger(Integer s) {
        return s == null ? 0 : s;
    }

    public static String getExtention(String fileName) {
        int pos = fileName.lastIndexOf(".");
        return fileName.substring(pos);
    }


    public static void pptConvert(String srcPpt, String pdfPath, String pdfName, String desDir) throws IOException {
        File dst = new File(desDir);
        if (!dst.exists()) {
            mkDir(dst);
        }
        if (!dst.setReadable(true) || dst.setWritable(true)) {
            logger.error("pptConvert : set read write failed");
        }

        String BASE_PATCH = ServletActionContext.getServletContext().getRealPath(".");
        String cmdPdf = BASE_PATCH + Constants.PPT_PDF_EXT_PATH + " " + srcPpt + " " + pdfPath;
        String cmdPpt = BASE_PATCH + Constants.PPT_EXT_PATH + " " + pdfPath + "/" + pdfName + " " + desDir + "/brif";
        logger.info("==================start convert==============");
        if (!StringUtils.endsWithIgnoreCase(srcPpt, "pdf")) {
            logger.info("==================start PDF==============");
            exe(cmdPdf);
        }
        logger.info("==================end pdf==============");
        exe(cmdPpt);
        logger.info("==================end ppt==============");
    }

    public static void questionConvert(String srcPpt, String desDir) throws IOException {
        File dst = new File(desDir);
        if (!dst.exists()) {
            mkDir(dst);
        }
        if(dst.setReadable(true)&&dst.setWritable(true)) {
            logger.error("pptConvert : set read write failed");
        }
        String BASE_PATCH = ServletActionContext.getServletContext().getRealPath(".");
        String cmd = BASE_PATCH + Constants.QUESTION_EXT_PATH + " " + srcPpt + " " + desDir + "/" + Constants.QUESTION_FILE_NAME + " " + desDir + "/img";      // Change to synce
        exe(cmd);
    }

    private static void exe(String cmd) throws IOException {
        String[] cmdA = {"/bin/sh", "-c", cmd};
        Process process = Runtime.getRuntime().exec(cmdA);
        logger.info(cmd + "=============cmd========================");
        LineNumberReader br = new LineNumberReader(new InputStreamReader(process.getInputStream()));
        String line;
        while ((line = br.readLine()) != null) {
            logger.info(line);
        }
    }


    public static void copy(File src, File dst) {
        if (!dst.getParentFile().exists()) {
            mkDir(dst.getParentFile());
        }
        copyByChannel(src, dst);

    }

    public static String getExceptionDetails(Throwable ex) {
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            ex.printStackTrace(pw);
            return "\r\n" + sw.toString() + "\r\n";
        } catch (Exception e2) {
            return "bad getExceptionDetails";
        }
    }

    public static String getFullUrl(HttpServletRequest httpRequest) {

        return "http://" + httpRequest.getServerName()
                + ":"
                + httpRequest.getServerPort()
                + httpRequest.getContextPath()
                + httpRequest.getServletPath()
                + "?" + (httpRequest.getQueryString() == null ? "" : httpRequest.getQueryString());
    }

    private static void mkDir(File file) {

        if (!file.mkdir()) {
            logger.error("mkdir failed" + file.getAbsolutePath());
        }
    }

}
