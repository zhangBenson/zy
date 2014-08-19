package com.gogowise.rep.course.enity;

import com.gogowise.rep.AbstractPersistence;

import javax.persistence.Entity;
import java.util.Calendar;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 8/19/14
 * Time: 3:34 AM
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class PaypalDetails extends AbstractPersistence {


    private String itemName;

    private String itemNumber;

    private String paymentStatus ;

    private String paymentAmount ;

    private String paymentCurrency;

    private String txnId ;

    private String receiverEmail;

    private String payerEmail;

    private String userId;

    private String nickName;


    public String getItemName() {
        return itemName;
    }

    public String getItemNumber() {
        return itemNumber;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public String getPaymentAmount() {
        return paymentAmount;
    }

    public String getPaymentCurrency() {
        return paymentCurrency;
    }

    public String getTxnId() {
        return txnId;
    }

    public String getReceiverEmail() {
        return receiverEmail;
    }

    public String getPayerEmail() {
        return payerEmail;
    }

    public String getUserId() {
        return userId;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public void setItemNumber(String itemNumber) {
        this.itemNumber = itemNumber;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public void setPaymentAmount(String paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

    public void setPaymentCurrency(String paymentCurrency) {
        this.paymentCurrency = paymentCurrency;
    }

    public void setTxnId(String txnId) {
        this.txnId = txnId;
    }

    public void setReceiverEmail(String receiverEmail) {
        this.receiverEmail = receiverEmail;
    }

    public void setPayerEmail(String payerEmail) {
        this.payerEmail = payerEmail;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }
}