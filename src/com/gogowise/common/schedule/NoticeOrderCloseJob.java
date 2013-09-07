package com.gogowise.common.schedule;


import com.gogowise.rep.finance.ConsumptionOrderDao;
import com.gogowise.rep.finance.ConsumptionRecordDao;
import com.gogowise.domain.finance.ConsumptionOrder;
import org.springframework.stereotype.Component;

import java.util.Calendar;
import java.util.List;

@Component
public class NoticeOrderCloseJob implements Runnable{
    private ConsumptionOrderDao consumptionOrderDao;
    private ConsumptionRecordDao consumptionRecordDao;
    private Calendar calendar;

    public void run() {
        List<ConsumptionOrder> consumptionOrders = consumptionOrderDao.findUnclosedOrderByCloseTime(calendar);
        for(ConsumptionOrder consumptionOrder : consumptionOrders){
               consumptionOrder.setState(ConsumptionOrder.ORDER_STATE_CLOSE);
               consumptionOrderDao.persistAbstract(consumptionOrder);
               consumptionRecordDao.updateRecordForPurchase(consumptionOrder);
        }
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

    public Calendar getCalendar() {
        return calendar;
    }

    public void setCalendar(Calendar calendar) {
        this.calendar = calendar;
    }
}
