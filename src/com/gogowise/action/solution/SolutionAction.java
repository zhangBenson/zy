package com.gogowise.action.solution;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


/**
 * Created by GoGoWise
 * User: GGW
 * Date: 12-4-30
 * Time: 下午6:08
 * To change this template use File | Settings | File Templates.
 */
@SuppressWarnings("UnusedDeclaration")
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class SolutionAction extends BasicAction{

    @Action(value = "multiVideoSolution",results = {@Result(name=SUCCESS,type=Constants.RESULT_NAME_TILES,location = ".multiVideoSolution")})
    public String showSolutions(){
        return SUCCESS;
    }
}
