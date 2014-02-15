package com.gogowise.action.demo;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * Created by 苑永志 on 14-2-16.
 */
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class DemoAction extends BasicAction{
    @Action(value = "playerDemo", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".toPlayerDemo") })
    public String toPlayerDemo() {
        return SUCCESS;
    }
    @Action(value = "classDemo", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".toClassDemo") })
    public String toClassDemo() {
        return SUCCESS;
    }
}
