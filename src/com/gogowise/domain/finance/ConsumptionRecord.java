package com.gogowise.domain.finance;

import com.gogowise.domain.AbstractPersistence;
import com.gogowise.domain.user.BaseUser;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import java.util.Calendar;

@Entity
public class ConsumptionRecord extends AbstractPersistence {

    @OneToOne
    private BaseUser owner;
    @OneToOne
    private BaseUser trader;
    @ManyToOne
    private ConsumptionOrder consumptionOrder;

    private Integer state;

    private Double availableBalance;
    private Double availableBalanceCharge;

    private Double balance;
    private Double balanceCharge;


    private String remarksParameter;
    private Calendar createTime = Calendar.getInstance();

    public BaseUser getOwner() {
        return owner;
    }

    public void setOwner(BaseUser owner) {
        this.owner = owner;
    }

    public ConsumptionOrder getConsumptionOrder() {
        return consumptionOrder;
    }

    public void setConsumptionOrder(ConsumptionOrder consumptionOrder) {
        this.consumptionOrder = consumptionOrder;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Double getAvailableBalance() {
        return availableBalance;
    }

    public void setAvailableBalance(Double availableBalance) {
        this.availableBalance = availableBalance;
    }

    public Double getAvailableBalanceCharge() {
        return availableBalanceCharge;
    }

    public void setAvailableBalanceCharge(Double availableBalanceCharge) {
        this.availableBalanceCharge = availableBalanceCharge;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    public Double getBalanceCharge() {
        return balanceCharge;
    }

    public void setBalanceCharge(Double balanceCharge) {
        this.balanceCharge = balanceCharge;
    }

    public Calendar getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Calendar createTime) {
        this.createTime = createTime;
    }

    public String getRemarksParameter() {
        return remarksParameter;
    }

    public void setRemarksParameter(String remarksParameter) {
        this.remarksParameter = remarksParameter;
    }

    public BaseUser getTrader() {
        return trader;
    }

    public void setTrader(BaseUser trader) {
        this.trader = trader;
    }
}
