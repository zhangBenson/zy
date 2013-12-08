package com.gogowise.action.android;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.live.PersonalOnliveDao;
import com.gogowise.rep.live.UserFansDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.live.enity.PersonalOnlive;
import com.gogowise.rep.live.enity.UserFans;
import com.gogowise.common.utils.Utils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-8-9
 * Time: 下午2:36
 * To change this template use File | Settings | File Templates.
 */
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
@Results({
        @Result(name = "json", type = "json")
})
public class StartPersonalOnliveForAndroidAction extends BasicAction {
      private PersonalOnlive personalOnlive;
      private String email;
      private BaseUserDao baseUserDao;
      private PersonalOnliveDao personalOnliveDao;
      private UserFansDao userFansDao;

       @Action(value="personalOnlive4Android")
       public String personalOnlive4Android(){
           BaseUser baseUser= baseUserDao.findByEmail(this.getEmail());

           personalOnlive=new PersonalOnlive();
           personalOnlive.setOwner(baseUser);
           personalOnlive.setStartTime(Utils.getCurrentCalender());
           List<PersonalOnlive> pos = personalOnliveDao.findAllForOwner(this.getSessionUserId(),null);
           personalOnlive.setSequence(pos.size()+1);
           personalOnliveDao.persistAbstract(personalOnlive);


           List<PersonalOnlive> pero = personalOnliveDao.findAllForOwner(this.getSessionUserId(),null);
           for(int i=0;i<pero.size();i++){
           if(pero.get(i).getSequence() == null){
              if(i == 0) pero.get(i).setSequence(1);
              else pero.get(i).setSequence(pero.get(i-1).getSequence()+1);
              personalOnliveDao.persistAbstract(pero.get(i));
              }
           }

           BaseUser temp=new BaseUser();
           temp.setNickName(baseUser.getNickName());
           temp.setId(baseUser.getId());
           personalOnlive.setOwner(temp);

           for(UserFans uf : userFansDao.findAllFansForUser(temp.getId(),null)){
//             keeper.control.Controller.action(new NotifyUsers("PersonalOnlive&"+uf.getUser().getNickName()+"$"+personalOnlive.getId()),uf.getFan().getNickName()+"notify");//各个对象接收
        }


          return "json";
       }

    @JSON(serialize = false)
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

    @JSON(serialize = false)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @JSON(serialize = false)
    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }
    @JSON(serialize = false)
    public UserFansDao getUserFansDao() {
        return userFansDao;
    }

    public void setUserFansDao(UserFansDao userFansDao) {
        this.userFansDao = userFansDao;
    }
}
