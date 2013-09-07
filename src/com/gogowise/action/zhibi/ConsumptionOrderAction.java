package com.gogowise.action.zhibi;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.user.BaseUserDao;
import com.gogowise.rep.finance.ConsumptionOrderDao;
import com.gogowise.rep.finance.ConsumptionRecordDao;
import com.gogowise.rep.user.UserAccountInfoDao;
import com.gogowise.rep.user.user.BaseUser;
import com.gogowise.rep.finance.enity.ConsumptionOrder;
import com.gogowise.rep.finance.enity.UserAccountInfo;
import com.gogowise.common.utils.Constants;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-9-19
 * Time: 下午3:26
 * To change this template use File | Settings | File Templates.
 */
@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class ConsumptionOrderAction extends BasicAction{
    private ConsumptionOrder consumptionOrder;
    private ConsumptionOrderDao consumptionOrderDao;
    private ConsumptionRecordDao consumptionRecordDao;
    private UserAccountInfoDao userAccountInfoDao;
    private BaseUserDao baseUserDao;

    private UserAccountInfo userAccountInfo;
    private BaseUser receiver;
    private Double transferMoney;   //转汇金额
    private String transferMessage; //汇款留言
    private String checkCode;  //用户输入的确认码
    private String confirmCode;  //系统生成的确认码


    @Action(value = "orderConfirmForPurchase",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName","initConsumption"})})
    public String orderConfirmForPurchase(){
        consumptionOrder = consumptionOrderDao.findById(this.getConsumptionOrder().getId());
        consumptionOrder.setState(ConsumptionOrder.ORDER_STATE_CLOSE);
        consumptionOrderDao.persistAbstract(consumptionOrder);
        consumptionRecordDao.updateRecordForPurchase(consumptionOrder);
        return SUCCESS;
    }

    @Action(value = "initTransfer",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".initTransfer")})
    public String initTransfer(){
        return SUCCESS;
    }

    @Action(value = "executeTransfer",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".initTransfer"),
                                                   @Result(name = INPUT,type = Constants.RESULT_NAME_TILES,location = ".initTransfer")})
    public String executeTransfer(){
        BaseUser payer = baseUserDao.findById(this.getSessionUserId());
        BaseUser payee = baseUserDao.findByEmail(this.getReceiver().getEmail());
        consumptionOrderDao.transfer(payer,payee,this.getTransferMoney(),Constants.TRANSFER_TYPE_OF_DEFAULT);
        return SUCCESS;
    }

    public void validateExecuteTransfer(){
         if(!this.getConfirmCode().equals(this.getCheckCode())){
             addFieldError("checkCode","您的确认码输入错误");
             return;
         }
         UserAccountInfo accountInfo = userAccountInfoDao.findByUserId(this.getSessionUserId());
         if(accountInfo.getAvailableZhiBi() != null && accountInfo.getAvailableZhiBi() < this.getTransferMoney()){
            addFieldError("transferMoney","您的知币余额不足");
            return;
        }
        BaseUser _receiver = baseUserDao.findByEmail(this.getReceiver().getEmail());
        if(_receiver == null){
            addFieldError("receiver.nickName","账号不存在");
            return;
        }else if(!_receiver.getNickName().equals(this.getReceiver().getNickName())){
            addFieldError("receiver.nickName","您输入的账号和昵称不匹配");
            return;
        }

    }

    @Action(value = "myGGWAccount",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".myGGWAccount")})
    public String myGGWAccount(){
        userAccountInfo = userAccountInfoDao.findByUserId(this.getSessionUserId());
        return SUCCESS;
    }


    @Action(value = "initRecharge",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".initRecharge")})
    public String initRecharge(){
        return SUCCESS;
    }

    public ConsumptionOrder getConsumptionOrder() {
        return consumptionOrder;
    }

    public void setConsumptionOrder(ConsumptionOrder consumptionOrder) {
        this.consumptionOrder = consumptionOrder;
    }

    public ConsumptionOrderDao getConsumptionOrderDao() {
        return consumptionOrderDao;
    }

    public void setConsumptionOrderDao(ConsumptionOrderDao consumptionOrderDao) {
        this.consumptionOrderDao = consumptionOrderDao;
    }

    public ConsumptionRecordDao getConsumptionRecordDao() {
        return consumptionRecordDao;
    }

    public void setConsumptionRecordDao(ConsumptionRecordDao consumptionRecordDao) {
        this.consumptionRecordDao = consumptionRecordDao;
    }

    public BaseUser getReceiver() {
        return receiver;
    }

    public void setReceiver(BaseUser receiver) {
        this.receiver = receiver;
    }

    public Double getTransferMoney() {
        return transferMoney;
    }

    public void setTransferMoney(Double transferMoney) {
        this.transferMoney = transferMoney;
    }

    public String getCheckCode() {
        return checkCode;
    }

    public void setCheckCode(String checkCode) {
        this.checkCode = checkCode;
    }

    public String getConfirmCode() {
        return confirmCode;
    }

    public void setConfirmCode(String confirmCode) {
        this.confirmCode = confirmCode;
    }

    public UserAccountInfoDao getUserAccountInfoDao() {
        return userAccountInfoDao;
    }

    public void setUserAccountInfoDao(UserAccountInfoDao userAccountInfoDao) {
        this.userAccountInfoDao = userAccountInfoDao;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public UserAccountInfo getUserAccountInfo() {
        return userAccountInfo;
    }

    public void setUserAccountInfo(UserAccountInfo userAccountInfo) {
        this.userAccountInfo = userAccountInfo;
    }

    public String getTransferMessage() {
        return transferMessage;
    }

    public void setTransferMessage(String transferMessage) {
        this.transferMessage = transferMessage;
    }
}
