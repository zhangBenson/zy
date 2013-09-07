package com.gogowise.action.show;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.live.MyShowDao;
import com.gogowise.rep.live.enity.MyShow;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({
        @Result(name = "json", type = "json")
})
public class ShowFansAjaxAction extends BasicAction {
    private MyShow myShow;
    private MyShowDao myShowDao;
    private String message;

    @Action(value = "becomeFans")
    public String becomeFans() throws Exception{
        myShow = myShowDao.findById(this.getMyShow().getId());
        message = this.getText(myShowDao.saveFansForShow(this.getSessionUserId(),myShow)) ;
       return "json";
    }

    @JSON(serialize = false)
    public MyShow getMyShow() {
        return myShow;
    }

    public void setMyShow(MyShow myShow) {
        this.myShow = myShow;
    }
     @JSON(serialize = false)
    public MyShowDao getMyShowDao() {
        return myShowDao;
    }

    public void setMyShowDao(MyShowDao myShowDao) {
        this.myShowDao = myShowDao;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
