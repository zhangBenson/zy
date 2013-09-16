package com.gogowise.common.utils;

import com.opensymphony.xwork2.TextProvider;
import com.opensymphony.xwork2.inject.Container;
import org.apache.struts2.util.StrutsTypeConverter;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

//import com.opensymphony.xwork2.conversion.impl.DefaultTypeConverter;

/**
 * Created by IntelliJ IDEA.
 * User: GGW
 * Date: 11-12-14
 * Time: 下午5:10
 * To change this template use File | Settings | File Templates.
 */
//public class DateConverter extends XWorkBasicConverter {
//    private String timezone = null;
//    private static final DateFormat[] ACCEPT_DATE_FORMATS = {
//            new SimpleDateFormat("dd/MM/yyyy"),
//            new SimpleDateFormat("yyyy-MM-dd HH:mm"),
//            new SimpleDateFormat("yyyy-MM-dd"),
//            //new SimpleDateFormat("dd/MM/yyyy H:m:s"),
//            new SimpleDateFormat("HH:mm")}; //支持转换的日期格式
//
//    @Override
//    public Object convertValue(Map context, Object value, Class toType) {
//        if (toType == Calendar.class) {  //浏览器向服务器提交时，进行String to Date的转换
//            Calendar cal = Calendar.getInstance();
//            Date date = null;
//            String dateString = null;
//            Object c = value;
//            if (value instanceof String) {
//                String params = (String) value;
//                dateString = params;//获取日期的字符串
//
//            } else if (value instanceof String[]) {
//                String[] params = (String[]) value;
//                dateString = params[0];//获取日期的字符串
//
//            }
//            DateFormat format = null;
//            for (int i = 0; i < ACCEPT_DATE_FORMATS.length; i++) {
//                format = ACCEPT_DATE_FORMATS[i];
//
//                try {
//                    if (i == 3) {
//                        date = new Date();
//                        String country = ActionContext.getContext().getLocale().getCountry();
//                        cal.setTime(date);
//                        cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(dateString.substring(0, 2)));
//                        cal.set(Calendar.MINUTE, Integer.parseInt(dateString.substring(3, dateString.length())));
//                        if (timezone == null || timezone == "") {
//                            if (country.equals("SG")) {
//                                cal.add(Calendar.HOUR, -8);
//                            } else if (country.equals("US")) {
//                                cal.add(Calendar.HOUR, +5);
//                            } else if (country.equals("JP")) {
//                                cal.add(Calendar.HOUR, -9);
//                            } else {
//                                cal.add(Calendar.HOUR, -8);
//                            }
//                        } else {
//                            cal.add(Calendar.HOUR, -Integer.parseInt(timezone));
//                        }
//                    } else if (i == 1) {
//                        date = format.parse(dateString);
//                        cal.setTime(date);
//                        timezone = (String) ActionContext.getContext().getSession().get("timeZone");
//                        String country = ActionContext.getContext().getLocale().getCountry();
//                        if (timezone == null || timezone == "") {
//                            if (country.equals("SG")) {
//                                cal.add(Calendar.HOUR, -8);
//                            } else if (country.equals("US")) {
//                                cal.add(Calendar.HOUR, +5);
//                            } else if (country.equals("JP")) {
//                                cal.add(Calendar.HOUR, -9);
//                            } else {
//                                cal.add(Calendar.HOUR, -8);
//                            }
//                        } else {
//
//                            cal.add(Calendar.HOUR, -Integer.parseInt(timezone));
//
//                        }
//                    } else {
//                        date = format.parse(dateString);
//                        cal.setTime(date);
//                    }
//                    return cal;//遍历日期支持格式，进行转换
//                } catch (Exception e) {
//                    continue;
//                }
//            }
//            return null;
//        } else if (toType == String.class) {   //服务器向浏览器输出时，进行Date to String的类型转换
//            Calendar cal = (Calendar) value;
//            timezone = (String) ActionContext.getContext().getSession().get("timeZone");
//            String country = ActionContext.getContext().getLocale().getCountry();
//            if (timezone == null || timezone == "") {
//                if (country.equals("SG")) {
//                    cal.add(Calendar.HOUR, -8);
//                } else if (country.equals("US")) {
//                    cal.add(Calendar.HOUR, +5);
//                } else if (country.equals("JP")) {
//                    cal.add(Calendar.HOUR, -9);
//                } else {
//                    cal.add(Calendar.HOUR, -8);
//                }
//            } else {
//                cal.add(Calendar.HOUR, +Integer.parseInt(timezone));
//            }
//             return  super.convertValue(context, cal, toType);
//
//        }
//        return null;
//    }
//
//}
//
public class DateConverter extends StrutsTypeConverter {
    private transient TextProvider textProvider;
    private Container container;
    private static final DateFormat[] ACCEPT_DATE_FORMATS = {
            new SimpleDateFormat("MM/dd/yyyy HH:mm"),
            new SimpleDateFormat("MM/dd/yyyy"),
            new SimpleDateFormat("yyyy-MM-dd HH:mm"),
            new SimpleDateFormat("yyyy-MM-dd"),
            new SimpleDateFormat("HH:mm")}; //支持转换的日期格式

    @Override
    public Object convertFromString(Map context, String[] values, Class toClass) {

        Calendar cal = Calendar.getInstance();
        Date date = null;
        String dateString = values[0];

        DateFormat format = null;
        for (int i = 0; i < ACCEPT_DATE_FORMATS.length; i++) {
            format = ACCEPT_DATE_FORMATS[i];

            try {
                if (i == 4) {
                    date = new Date();
                    cal.setTime(date);
                    cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(dateString.substring(0, 2)));
                    cal.set(Calendar.MINUTE, Integer.parseInt(dateString.substring(3, dateString.length())));
                    Utils.changeTimeZoneForIn(cal);
                } else {
                    date = format.parse(dateString);
                    cal.setTime(date);
                    Utils.changeTimeZoneForIn(cal);
                }
                return cal;
            } catch (Exception e) {
                continue;
            }
        }
        return null;
    }




    @Override
    public String convertToString(Map context, Object object) {
        if (object instanceof Double) {
            return Double.toString((Double) object);

        } else if (object instanceof Calendar) {
            Calendar cal = (Calendar) object;
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Utils.changeTimeZoneForIn(cal);
            return format.format(cal);
        }
        return null;

    }


    /* (non-Javadoc)
    * @see org.apache.struts2.util.StrutsTypeConverter#convertValue(java.util.Map, java.lang.Object, java.lang.Class)
    */
    @Override
    public Object convertValue(Map arg0, Object arg1, Class arg2) {

        return super.convertValue(arg0, arg1, arg2);
    }

    /* (non-Javadoc)
     * @see org.apache.struts2.util.StrutsTypeConverter#performFallbackConversion(java.util.Map, java.lang.Object, java.lang.Class)
     */
    @Override
    protected Object performFallbackConversion(Map arg0, Object arg1, Class arg2) {
        return super.performFallbackConversion(arg0, arg1, arg2);
    }


}


