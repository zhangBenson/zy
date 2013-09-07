package com.gogowise.action.map;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.live.PersonalOnliveDao;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.live.enity.PersonalOnlive;
import com.gogowise.common.utils.Constants;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-4-3
 * Time: 下午1:15
 * To change this template use File | Settings | File Templates.
 */

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class MapAction extends BasicAction{

    List<PersonalOnlive> personalOnlives = new ArrayList<PersonalOnlive>();
    PersonalOnliveDao personalOnliveDao;

    @Action(value = "LiveMap",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".LiveMap")})
    public String InterviewVideo(){
        personalOnlives = personalOnliveDao.findAllLivingOnline(new Pagination());

        return SUCCESS;
    }

    public List<PersonalOnlive> getPersonalOnlives() {
        return personalOnlives;
    }

    public void setPersonalOnlives(List<PersonalOnlive> personalOnlives) {
        this.personalOnlives = personalOnlives;
    }

    public PersonalOnliveDao getPersonalOnliveDao() {
        return personalOnliveDao;
    }

    public void setPersonalOnliveDao(PersonalOnliveDao personalOnliveDao) {
        this.personalOnliveDao = personalOnliveDao;
    }
}
