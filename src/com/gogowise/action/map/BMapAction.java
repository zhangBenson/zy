package com.gogowise.action.map;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.live.PersonalOnliveDao;
import com.gogowise.domain.Pagination;
import com.gogowise.domain.live.PersonalOnlive;
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
public class BMapAction extends BasicAction{

    private List<PersonalOnlive> personalOnlives = new ArrayList<PersonalOnlive>();
    private List<PersonalOnlive> otherPersonalOnlives = new ArrayList<PersonalOnlive>();
    private PersonalOnlive personalOnlive;
    private PersonalOnliveDao personalOnliveDao;

    private String searchStr;
    private Pagination pagination = new Pagination(4);

    @Action(value = "liveBMap",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveBMap")})
    public String InterviewVideo(){
        return SUCCESS;
    }
    @Action(value = "liveBMap2",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveBMap2")})
    public String InterviewVideo2(){
        //取得所有正在进行的直播
        personalOnlives = personalOnliveDao.findAllLiveOnMap(pagination);
        return SUCCESS;
    }
    @Action(value = "liveOnMap",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveOnMap")})
    public String showLiveOnMap(){
        personalOnlive = personalOnliveDao.findById(personalOnlive.getId());
        //取得所有正在进行的直播
        personalOnlives = personalOnliveDao.findAllLiveOnMap(pagination);
        personalOnlives.remove(personalOnlive);
        return SUCCESS;
    }
    @Action(value = "liveListOnMap",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveListOnMap")})
    public String searchLiveOnMap(){
        personalOnlives = personalOnliveDao.findLiveOnMap(searchStr,pagination);
        List<PersonalOnlive> allOnlives = personalOnliveDao.findAllLiveOnMap(pagination);
        for(PersonalOnlive po:personalOnlives){
            allOnlives.remove(po);
        }
        otherPersonalOnlives = allOnlives;
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

    public PersonalOnlive getPersonalOnlive() {
        return personalOnlive;
    }

    public void setPersonalOnlive(PersonalOnlive personalOnlive) {
        this.personalOnlive = personalOnlive;
    }

    public String getSearchStr() {
        return searchStr;
    }

    public void setSearchStr(String searchStr) {
        this.searchStr = searchStr;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public List<PersonalOnlive> getOtherPersonalOnlives() {
        return otherPersonalOnlives;
    }

    public void setOtherPersonalOnlives(List<PersonalOnlive> otherPersonalOnlives) {
        this.otherPersonalOnlives = otherPersonalOnlives;
    }
}
