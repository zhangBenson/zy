package com.gogowise.action.utils;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-10-6
 * Time: 下午2:56
 * To change this template use File | Settings | File Templates.
 */

//import keeper.control.Controller;
//import keeper.event.EventListener;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class NotifyUsers{
    private String msg;

    public NotifyUsers(String msg) {
        this.msg = msg;
    }
    public void run() {

//			Controller.action(this, "timer");
//			try {
//				Thread.sleep(5000);
//			} catch (InterruptedException e) {
//				e.printStackTrace();
//			}

	}


    public void process(HttpServletRequest request, HttpServletResponse response) {
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
            if (msg != null) {
                out.write(msg);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }


}









