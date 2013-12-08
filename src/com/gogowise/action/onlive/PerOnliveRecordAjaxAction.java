package com.gogowise.action.onlive;

import com.gogowise.action.BasicAction;
import com.gogowise.action.valueobject.PerOnliveVideoSession;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.live.PersonalOnliveDao;
import com.gogowise.rep.live.enity.PersonalOnlive;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.CompactWriter;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({
        @Result(name = "json", type = "json")
})
public class PerOnliveRecordAjaxAction extends BasicAction{
    private PersonalOnlive personalOnlive;
    private PersonalOnliveDao personalOnliveDao;
    private BaseUserDao baseUserDao;
    private String initSeesionString;



    @Action(value = "loadPerOnLiveRecord")
    public String loadPerOnLiveRecord(){
        personalOnlive = personalOnliveDao.findById(this.getPersonalOnlive().getId());
        PerOnliveVideoSession perOnliveVideoSession = new PerOnliveVideoSession();
        perOnliveVideoSession.initWithPerOnliveData(personalOnlive,this.getSessionUserId() == null?null:baseUserDao.findById(this.getSessionUserId()));

        XStream xstream = new XStream();
        xstream.alias("Session", PerOnliveVideoSession.class);
        OutputStream output = new ByteArrayOutputStream();
        xstream.marshal(perOnliveVideoSession, new CompactWriter(new OutputStreamWriter(output)));
        this.setInitSeesionString(output.toString());
        return "json";
    }

    @JSON(serialize = false)
    public PersonalOnlive getPersonalOnlive() {
        return personalOnlive;
    }

    public void setPersonalOnlive(PersonalOnlive personalOnlive) {
        this.personalOnlive = personalOnlive;
    }

    @JSON(serialize = false)
    public PersonalOnliveDao getPersonalOnliveDao() {
        return personalOnliveDao;
    }

    public void setPersonalOnliveDao(PersonalOnliveDao personalOnliveDao) {
        this.personalOnliveDao = personalOnliveDao;
    }

    @JSON(serialize = false)
    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public String getInitSeesionString() {
        return initSeesionString;
    }

    public void setInitSeesionString(String initSeesionString) {
        this.initSeesionString = initSeesionString;
    }
}
