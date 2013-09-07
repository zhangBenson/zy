package com.gogowise.rep;


import com.gogowise.rep.user.UserRelationshipDao;
import com.gogowise.rep.user.enity.UserRelationship;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-10-1
 * Time: 上午11:36
 * To change this template use File | Settings | File Templates.
 */
public class TestUserRelationship {
    public static void main(String []h){
          ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserRelationshipDao dao=(UserRelationshipDao)ctx.getBean("userRelationshipDao");
        List<UserRelationship> sessions=dao.queryFriendsByUserId(1,new Pagination());
    }

}
