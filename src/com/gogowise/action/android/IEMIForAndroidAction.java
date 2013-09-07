package com.gogowise.action.android;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.android.IEMIDao;
import com.gogowise.domain.android_domain.IEMI;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-11-21
 * Time: 上午1:22
 * To change this template use File | Settings | File Templates.
 */
@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
//@ParentPackage(value = "basic-json-package")
@Results({
        @Result(name = "json", type = "json")

})
public class IEMIForAndroidAction {
    private IEMI iemi;
    private IEMIDao iemiDao;
    private Boolean iemiValid;
    private String iemiString;

     @Action(value="validIEMI4Android")
     public  String validIEMI4Android(){
         iemiValid=iemiDao.validIEMI(this.getIemiString());
         return "json";
     }

    @JSON(serialize = false)
    public IEMI getIemi() {
        return iemi;
    }

    public void setIemi(IEMI iemi) {
        this.iemi = iemi;
    }

    @JSON(serialize = false)
    public IEMIDao getIemiDao() {
        return iemiDao;
    }

    public void setIemiDao(IEMIDao iemiDao) {
        this.iemiDao = iemiDao;
    }

    public Boolean getIemiValid() {
        return iemiValid;
    }

    public void setIemiValid(Boolean iemiValid) {
        this.iemiValid = iemiValid;
    }

    @JSON(serialize = false)
    public String getIemiString() {
        return iemiString;
    }

    public void setIemiString(String iemiString) {
        this.iemiString = iemiString;
    }
}
