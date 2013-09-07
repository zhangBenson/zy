package com.gogowise.action.android;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.live.PersonalOnliveDao;
import com.gogowise.rep.live.live.PersonalOnlive;
import com.gogowise.rep.user.user.BaseUser;
import com.gogowise.common.utils.Utils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-8-17
 * Time: 上午10:28
 * To change this template use File | Settings | File Templates.
 */
@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
//@ParentPackage(value = "basic-json-package")
@Results({
        @Result(name = "json", type = "json")

})
public class PersonalOvliveForAndroidAction extends BasicAction {
    private List<PersonalOnlive> personalOnlives;
    private PersonalOnliveDao personalOnliveDao;
    private Integer personalOnliveId;
    private Integer numOfRegAudience;
    private Integer numOfAudience;

     @Action(value = "updatePerOnliveFlag4android")
    public String updatePerOnliveFlag4android(){
        PersonalOnlive  personalOnlive = personalOnliveDao.findById(this.getPersonalOnliveId());
        personalOnlive.setFlag(personalOnlive.getFlag()+180);   //每180秒更新一次
        personalOnlive.setFlagUpdateTime(Utils.getCurrentCalender());
        personalOnlive.setDuration(personalOnlive.getDuration()+3);
        personalOnliveDao.persistAbstract(personalOnlive);
        return "json";
    }

    @Action(value = "saveNumOfRegAudience4android")
    public String saveNumOfRegAudience4android(){
        PersonalOnlive po = personalOnliveDao.findById(this.getPersonalOnliveId());
        if(po.getNumOfRegAudience() < this.getNumOfRegAudience()){
              po.setNumOfRegAudience(this.getNumOfRegAudience());
              personalOnliveDao.persistAbstract(po);
        }
        return "json";
    }

    @Action(value = "saveNumOfAudience4android")
    public String saveNumOfAudience4android(){
        PersonalOnlive po = personalOnliveDao.findById(this.getPersonalOnliveId());
        if(po.getNumOfAudience() < this.getNumOfAudience()){
              po.setNumOfAudience(this.getNumOfAudience());
              personalOnliveDao.persistAbstract(po);
        }
        return "json";
    }


    @Action(value = "personalOnliveList4android")
    public String personalOnliveList4android() {
        personalOnlives = personalOnliveDao.findCurrentGoingOnlive(new Pagination(60000));

        for (PersonalOnlive p : personalOnlives) {

            BaseUser baseUser = new BaseUser();
            baseUser.setId(p.getOwner().getId());
            baseUser.setEmail(p.getOwner().getEmail());
            baseUser.setNickName(p.getOwner().getNickName());
            baseUser.setPic(p.getOwner().getPic());
            p.setOwner(baseUser);

        }
        List<PersonalOnlive> temp = new ArrayList<PersonalOnlive>();
        for (PersonalOnlive p : personalOnlives) {
            if (p.getFinished() == false) {
                temp.add(p);
            }
        }
        personalOnlives = temp;


        int a = personalOnlives.size();
        return "json";
    }

    public List<PersonalOnlive> getPersonalOnlives() {
        return personalOnlives;
    }

    public void setPersonalOnlives(List<PersonalOnlive> personalOnlives) {
        this.personalOnlives = personalOnlives;
    }

    @JSON(serialize = false)
    public PersonalOnliveDao getPersonalOnliveDao() {
        return personalOnliveDao;
    }

    public void setPersonalOnliveDao(PersonalOnliveDao personalOnliveDao) {
        this.personalOnliveDao = personalOnliveDao;
    }

    @JSON(serialize = false)
    public Integer getPersonalOnliveId() {
        return personalOnliveId;
    }

    public void setPersonalOnliveId(Integer personalOnliveId) {
        this.personalOnliveId = personalOnliveId;
    }

    @JSON(serialize = false)
    public Integer getNumOfRegAudience() {
        return numOfRegAudience;
    }

    public void setNumOfRegAudience(Integer numOfRegAudience) {
        this.numOfRegAudience = numOfRegAudience;
    }

    @JSON(serialize = false)
    public Integer getNumOfAudience() {
        return numOfAudience;
    }

    public void setNumOfAudience(Integer numOfAudience) {
        this.numOfAudience = numOfAudience;
    }
}
