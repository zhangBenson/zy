package com.gogowise.action.android;

import com.gogowise.action.BasicAction;
import com.gogowise.repository.user.BaseUserDao;
import com.gogowise.domain.user.BaseUser;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-11-10
 * Time: 下午7:05
 * To change this template use File | Settings | File Templates.
 */
@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
//@ParentPackage(value = "basic-json-package")
@Results({
        @Result(name = "json", type = "json")

})
public class Monitor4AndroidAction extends BasicAction{
    private BaseUserDao baseUserDao;
    private String userId;
    private String email;
    @Action(value="getUserId4MonitorOnAndroid")
    public String getUserId4MonitorOnAndroid(){
        BaseUser baseUser=baseUserDao.findByEmail(this.getEmail());
        userId=baseUser.getId()+"";
        return "json";
    }

     @JSON(serialize = false)
    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
     @JSON(serialize = false)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
