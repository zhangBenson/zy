package com.gogowise.utils;

import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.components.Date;
import org.apache.struts2.views.jsp.DateTag;

import java.text.DecimalFormat;

/**
 * @see Date
 */
public class CalenderTag extends DateTag {

    private static final long serialVersionUID = -6216963123295613440L;

    protected void populateParams() {
        super.populateParams();
        Date d = (Date) component;
        d.setName(name);
        d.setFormat(format);
        d.setNice(nice);
        Float timeZoneFloat = (Float) ActionContext.getContext().getSession().get("timeZone");

        if (timeZoneFloat == null) {
            timezone = "GMT+08:00";
        } else {
            timezone = formatFloatToTimeZone(timeZoneFloat);
        }
        d.setTimezone(timezone);
    }

    private static String formatFloatToTimeZone(Float f){
        DecimalFormat df =new DecimalFormat("00.00");
        String  floatString = df.format(f);
        if(floatString.length() ==5 ){
            floatString = "+" +floatString;
        }
        floatString = StringUtils.replaceOnce(floatString,".5",":3");
        floatString = StringUtils.replaceOnce(floatString,".",":");
        return "GMT"+floatString;
    }

    public static void main(String args[]) {
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public void setNice(boolean nice) {
        this.nice = nice;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setTimezone(String timezone) {
        this.timezone = timezone;
    }

}
