//package com.gogowise.common.ws;
//
//import com.gogowise.rep.user.dao.BaseUserDao;
//
//import javax.jws.WebService;
//import java.util.ArrayList;
//
//
//@WebService(endpointInterface = "com.gogowise.common.ws.WebServiceSample")
//public class WebServiceSampleImpl implements WebServiceSample {
//
//    private BaseUserDao baseUserDao;
//
//    public boolean logon(String email, String password) {
//        return baseUserDao.logon(email, password) != null;
//    }
//
//    public String sayUserName(UserDTO user) {
//        return "hello " + user.getName();
//    }
//
//    public String say(String hello) {
//        return "hello " + hello;
//    }
//
//    public ListObject findUsers() {
//        ArrayList<Object> list = new ArrayList<Object>();
//
//        list.add(instancUser(1, "lib"));
//        list.add(instancUser(2, "mld"));
//        list.add(instancUser(3, "lq"));
//        list.add(instancUser(4, "gj"));
//        ListObject o = new ListObject();
//        o.setList(list);
//        return o;
//    }
//
//    private UserDTO instancUser(Integer id, String name) {
//        UserDTO user = new UserDTO();
//        user.setId(id);
//        user.setName(name);
//        return user;
//    }
//
//    public BaseUserDao getBaseUserDao() {
//        return baseUserDao;
//    }
//
//    public void setBaseUserDao(BaseUserDao baseUserDao) {
//        this.baseUserDao = baseUserDao;
//    }
//}