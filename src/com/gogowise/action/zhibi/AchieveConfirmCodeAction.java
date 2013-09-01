package com.gogowise.action.zhibi;

import com.gogowise.action.BasicAction;
import com.gogowise.utils.EmailUtil;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.Random;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-9-20
 * Time: 下午3:09
 * To change this template use File | Settings | File Templates.
 */
@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({
        @Result(name = "json", type = "json")
})
public class AchieveConfirmCodeAction extends BasicAction{

    private String confirmCode;

    @Action(value = "getTransferConfirmCode")
    public String getTransferConfirmCode(){
        Integer codeCount = 4;
        char[] codeSequence={'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
                              'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
                              'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
        Random random=new Random();
        StringBuffer randomCode=new StringBuffer();
        for(int i=0;i<codeCount;i++){
            String strRand=String.valueOf(codeSequence[random.nextInt(36)]);
            randomCode.append(strRand);
        }
        this.setConfirmCode(randomCode.toString());
        sendEmailForTransfer(this.getConfirmCode());
        return "json";
    }

    private void sendEmailForTransfer(String confirmCode){
        String title= "知元网知币转汇确认码";
        String content = "您在本次知币转汇操作中的转汇确认码为："+confirmCode;
        if(this.getSessionUserEmail() != null){
             EmailUtil.sendMail(this.getSessionUserEmail(),title,content);
        }
    }
    public String getConfirmCode() {
        return confirmCode;
    }

    public void setConfirmCode(String confirmCode) {
        this.confirmCode = confirmCode;
    }
}
