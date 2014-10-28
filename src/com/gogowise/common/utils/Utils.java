package com.gogowise.common.utils;

import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Utils {


    private static final Map<String, Integer> TIME_ZONE_MAP = new HashMap<>();

    static {
        TIME_ZONE_MAP.put("SG", +8);
        TIME_ZONE_MAP.put("US", -5);
        TIME_ZONE_MAP.put("JP", +9);
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
        } else {
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

}
