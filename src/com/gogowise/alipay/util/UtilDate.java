package com.gogowise.alipay.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class UtilDate {

    public static final String dtLong                  = "yyyyMMddHHmmss";
    public static final String simple                  = "yyyy-MM-dd HH:mm:ss";

    public static final String dtShort                 = "yyyyMMdd";

    public  static String getOrderNum(){
        Date date=new Date();
        DateFormat df=new SimpleDateFormat(dtLong);
        return df.format(date);
    }

    public  static String getDateFormatter(){
        Date date=new Date();
        DateFormat df=new SimpleDateFormat(simple);
        return df.format(date);
    }


    public static String getDate(){
        Date date=new Date();
        DateFormat df=new SimpleDateFormat(dtShort);
        return df.format(date);
    }

    public static String getThree(){
        Random rad=new Random();
        return rad.nextInt(1000)+"";
    }

}
