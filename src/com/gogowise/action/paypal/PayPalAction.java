package com.gogowise.action.paypal;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.enity.Organization;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-02-17 19:22
 * Email: jhji@ir.hit.edu.cn
 */
public class PayPalAction extends BasicAction
{
    private String payStatus;

    private String itemName;
    private String itemNum;
    private String amount;
    private String quantity;
    private Integer noShipping;
    private String returnURL;
    private String cancelURL;
    private String currencyCode;

    private Organization org;
    private OrganizationDao organizationDao;

    private Integer userID;
    private Integer orgID;

    private String tx;
    private String st;
    private String amt;
    private String cc;
    private String item_number;

    @Action(value = "payFinish", results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "personalCenter"} ),
                                         @Result(name = "Cancel", type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "orgBlog","org.id", ""})})
    public String payFinish()
    {
        System.err.println("Begin");
        System.err.println(tx);
        System.err.println("End");
        return SUCCESS;
    }

    @Action(value = "ipn",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "personalCenter"} )})
    public String ipn()
    {
        System.out.println("This is here");
        System.out.println(this.tx);
        System.out.println();
        return SUCCESS;
    }

    public String getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(String payStatus) {
        this.payStatus = payStatus;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getItemNum() {
        return itemNum;
    }

    public void setItemNum(String itemNum) {
        this.itemNum = itemNum;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public Integer getNoShipping() {
        return noShipping;
    }

    public void setNoShipping(Integer noShipping) {
        this.noShipping = noShipping;
    }

    public String getReturnURL() {
        return returnURL;
    }

    public void setReturnURL(String returnURL) {
        this.returnURL = returnURL;
    }

    public String getCancelURL() {
        return cancelURL;
    }

    public void setCancelURL(String cancelURL) {
        this.cancelURL = cancelURL;
    }

    public String getCurrencyCode() {
        return currencyCode;
    }

    public void setCurrencyCode(String currencyCode) {
        this.currencyCode = currencyCode;
    }

    public Organization getOrg() {
        return org;
    }

    public void setOrg(Organization org) {
        this.org = org;
    }

    public OrganizationDao getOrganizationDao() {
        return organizationDao;
    }

    public void setOrganizationDao(OrganizationDao organizationDao) {
        this.organizationDao = organizationDao;
    }


    public String getTx() {
        return tx;
    }

    public void setTx(String tx) {
        this.tx = tx;
    }

    public String getSt() {
        return st;
    }

    public void setSt(String st) {
        this.st = st;
    }

    public String getAmt() {
        return amt;
    }

    public void setAmt(String amt) {
        this.amt = amt;
    }

    public String getCc() {
        return cc;
    }

    public void setCc(String cc) {
        this.cc = cc;
    }

    public String getItem_number() {
        return item_number;
    }

    public void setItem_number(String item_number) {
        this.item_number = item_number;
    }
}
