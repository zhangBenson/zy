package com.gogowise.action.user;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.rep.finance.UserAccountInfoDao;
import com.gogowise.rep.finance.enity.UserAccountInfo;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.enity.BaseUser;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * TeacherAction
 *
 * @author 苑永志
 * @version 1.0
 * @since 2014年01月28日 13:41
 */
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class TeacherAction extends BasicAction{
    @Autowired
    private BaseUserDao baseUserDao;
    @Autowired
    private UserAccountInfoDao userAccountInfoDao;

    private BaseUser user;
    private UserAccountInfo userAccountInfo;

    @Action(value = "setting", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initUpdate_teacher")})
    public String initUpdate() {
        user = baseUserDao.findById(getSessionUserId());
        userAccountInfo = userAccountInfoDao.findByUserId(this.getSessionUserId());
        return SUCCESS;
    }

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public UserAccountInfo getUserAccountInfo() {
        return userAccountInfo;
    }

    public void setUserAccountInfo(UserAccountInfo userAccountInfo) {
        this.userAccountInfo = userAccountInfo;
    }
}
