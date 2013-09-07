package com.gogowise.rep.finance;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.user.BaseUserDao;
import com.gogowise.rep.user.UserAccountInfoDao;
import com.gogowise.domain.finance.ConsumptionOrder;
import com.gogowise.domain.finance.ConsumptionRecord;
import com.gogowise.domain.Pagination;
import com.gogowise.domain.finance.UserAccountInfo;
import org.springframework.stereotype.Repository;

import java.util.Calendar;
import java.util.List;


@Repository("consumptionRecordDao")
public class ConsumptionRecordDaoImpl extends ModelDaoImpl<ConsumptionRecord>
        implements ConsumptionRecordDao {
    private BaseUserDao baseUserDao;
    private UserAccountInfoDao userAccountInfoDao;


    public void createRecordForRecharge(ConsumptionOrder consumptionOrder) {
        this.chargePayer(consumptionOrder);
        this.receiverForPayee(consumptionOrder);
    }
    public void createRecordForPurchase(ConsumptionOrder consumptionOrder) {
        this.chargePayer(consumptionOrder);
        this.receiverForPayee(consumptionOrder);
    }

    public void createRecordForTransfer(ConsumptionOrder consumptionOrder) {
        this.chargePayer(consumptionOrder);
        this.receiverForPayee(consumptionOrder);
    }

    public void updateRecordForPurchase(ConsumptionOrder consumptionOrder) {
        this.chargePayer(consumptionOrder);
        this.receiverForPayee(consumptionOrder);
    }

    private void receiverForPayee(ConsumptionOrder consumptionOrder) {
        UserAccountInfo payeeAccount = userAccountInfoDao.findByUserId(consumptionOrder.getPayee().getId());
        ConsumptionRecord record = new ConsumptionRecord();

        if (this.isCharge(consumptionOrder)) {
            payeeAccount.setZhiBi(payeeAccount.getZhiBi() + consumptionOrder.getPrice());
            record.setBalance(payeeAccount.getZhiBi());
            record.setBalanceCharge(consumptionOrder.getPrice());
        } else {
            record.setBalance(payeeAccount.getZhiBi());
            record.setBalanceCharge(0.0);
        }


        if (this.isAvailableCharge(consumptionOrder)) {
            payeeAccount.setAvailableZhiBi(payeeAccount.getAvailableZhiBi() + consumptionOrder.getPrice());
            record.setAvailableBalance(payeeAccount.getAvailableZhiBi());
            record.setAvailableBalanceCharge(consumptionOrder.getPrice());
        }else {
            record.setAvailableBalance(payeeAccount.getAvailableZhiBi());
            record.setAvailableBalanceCharge(0.0);
        }

        record.setConsumptionOrder(consumptionOrder);
        record.setOwner(consumptionOrder.getPayee());
        record.setTrader(consumptionOrder.getPayer());

        userAccountInfoDao.persist(payeeAccount);
        this.persist(record);

    }


    private void chargePayer(ConsumptionOrder consumptionOrder) {
        UserAccountInfo payerAccount = userAccountInfoDao.findByUserId(consumptionOrder.getPayer().getId());
        ConsumptionRecord record = new ConsumptionRecord();

        if (this.isCharge(consumptionOrder)) {    //当前余额处理
            payerAccount.setZhiBi(payerAccount.getZhiBi() - consumptionOrder.getPrice());      //直接扣除用户账户知币
            record.setBalance(payerAccount.getZhiBi()); //设置当前余额
            record.setBalanceCharge(-consumptionOrder.getPrice()); //设置当前余额收支情况
        } else {
            record.setBalance(payerAccount.getZhiBi());
            record.setBalanceCharge(0.0);
        }



        if (this.isAvailableCharge(consumptionOrder)) { //可用余额处理
            payerAccount.setAvailableZhiBi(payerAccount.getAvailableZhiBi() - consumptionOrder.getPrice());  //扣除账户可用余额
            record.setAvailableBalance(payerAccount.getAvailableZhiBi());   //设置消费记录的可用余额
            record.setAvailableBalanceCharge(-consumptionOrder.getPrice());    //设置消费记录的可用余额的收支情况
        }else {
            record.setAvailableBalance(payerAccount.getAvailableZhiBi());
            record.setAvailableBalanceCharge(0.0);
        }

        record.setConsumptionOrder(consumptionOrder);
        record.setOwner(consumptionOrder.getPayer());
        record.setTrader(consumptionOrder.getPayee());
        userAccountInfoDao.persistAbstract(payerAccount);
        this.persist(record);

    }

    private boolean isAvailableCharge(ConsumptionOrder consumptionOrder) {
        if (ConsumptionOrder.ORDER_TYPE_RECHARGE.equals(consumptionOrder.getType()) || ConsumptionOrder.ORDER_TYPE_TRANSFER.equals(consumptionOrder.getType())) return true;
        if (ConsumptionOrder.ORDER_STATE__BALANCE_FREEZE.equals(consumptionOrder.getState())) {
            return true;
        }
        return false;
    }

    private boolean isCharge(ConsumptionOrder consumptionOrder) {
        if (ConsumptionOrder.ORDER_TYPE_RECHARGE.equals(consumptionOrder.getType()) || ConsumptionOrder.ORDER_TYPE_TRANSFER.equals(consumptionOrder.getType())) return true;
        if (ConsumptionOrder.ORDER_STATE_CLOSE.equals(consumptionOrder.getState())) {
            return true;
        }
        return false;
    }

    public  List<ConsumptionRecord> findForOwner(Integer userId , Calendar start, Calendar end , Pagination pagination) {
        String sql = "select rc  From ConsumptionRecord rc where rc.owner.id = ? and rc.createTime between ? and ? order by rc.id asc ";
        return this.find(sql, pagination, userId,start,end);
    }


    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public UserAccountInfoDao getUserAccountInfoDao() {
        return userAccountInfoDao;
    }

    public void setUserAccountInfoDao(UserAccountInfoDao userAccountInfoDao) {
        this.userAccountInfoDao = userAccountInfoDao;
    }
}
