package com.gogowise.action.android;

import com.gogowise.action.BasicAction;
import com.gogowise.repository.android.SerialNoDao;
import com.gogowise.domain.android_domain.SerialNO;
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
 * Date: 12-12-6
 * Time: 下午5:32
 * To change this template use File | Settings | File Templates.
 */
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
@Results({
        @Result(name = "json", type = "json")
})
public class ValidSerialNoForAndroidAction {
    private SerialNO serialNO;
    private SerialNoDao serialNoDao;
    private String serialNum;
    private String password;
    private String result;


    @Action(value = "validSerialNum4android")
    public String validSerialNum() {
        serialNO = serialNoDao.findBySerialNum(this.getSerialNum());
        if (serialNO == null) {
            result = "noExist";
            return "json";
        } else {
            if (serialNO.getValidTimes() == null) {
                serialNO.setValidTimes(1);
                result = "right";
            } else {
                result = "used";
            }
            serialNoDao.persistAbstract(serialNO);
            return "json";
        }
    }


    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
    @JSON(serialize = false)
    public SerialNO getSerialNO() {
        return serialNO;
    }

    public void setSerialNO(SerialNO serialNO) {
        this.serialNO = serialNO;
    }
    @JSON(serialize = false)
    public SerialNoDao getSerialNoDao() {
        return serialNoDao;
    }

    public void setSerialNoDao(SerialNoDao serialNoDao) {
        this.serialNoDao = serialNoDao;
    }
    @JSON(serialize = false)
    public String getSerialNum() {
        return serialNum;
    }

    public void setSerialNum(String serialNum) {
        this.serialNum = serialNum;
    }
    @JSON(serialize = false)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
