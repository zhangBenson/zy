package com.gogowise.action.jiaxing;

import com.gogowise.action.BasicAction;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class IndexPageAction extends BasicAction {


    @Action(value = "index", results = {@Result(name = SUCCESS, type = "tiles", location = "jiaxing.index")})
    public String index() {
        return SUCCESS;
    }


}
