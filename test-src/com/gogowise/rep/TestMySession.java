package com.gogowise.rep;

import java.util.Calendar;
import java.util.TimeZone;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-9-29
 * Time: 下午5:09
 * To change this template use File | Settings | File Templates.
 */
public class TestMySession {
    public static void main(String[] args) {
        TimeZone timeZone = Calendar.getInstance().getTimeZone();


    }

    public void maopao(int[] a){
        int temp;
        for(int i=0;i<a.length;i++){
           for(int j=0;j<a.length-i-1;j++){
               if(a[j]>a[j+1]){
                   temp=a[j+1];
                   a[j+1]=a[j];
                   a[j]=temp;
               }
           }
        }


    }
}
