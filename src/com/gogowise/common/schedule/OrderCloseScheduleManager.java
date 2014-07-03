package com.gogowise.common.schedule;

import com.gogowise.rep.finance.ConsumptionOrderDao;
import com.gogowise.rep.finance.ConsumptionRecordDao;
import com.gogowise.rep.finance.enity.ConsumptionOrder;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.stereotype.Component;

import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Component
public class OrderCloseScheduleManager {
    public static Set<Calendar> closeTime = new HashSet<Calendar>();
    public static Set<Calendar> noticeEmailTime = new HashSet<Calendar>();
    private ConsumptionOrderDao consumptionOrderDao;
    private ConsumptionRecordDao consumptionRecordDao;
    private Calendar calendar = Calendar.getInstance();
    private ThreadPoolTaskScheduler scheduler;

    //    @Scheduled(cron = "0 0/30 * * * ?")
    public void generateJob(){
        List<ConsumptionOrder> consumptionOrders = consumptionOrderDao.findUnclosedOrder();
        for(ConsumptionOrder co : consumptionOrders){
            if(co.getCloseTime().after(Calendar.getInstance())){
                OrderCloseScheduleManager.closeTime.add(co.getCloseTime());
            }else {
                co.setState(ConsumptionOrder.ORDER_STATE_CLOSE);
                consumptionOrderDao.persistAbstract(co);
                consumptionRecordDao.updateRecordForPurchase(co);
            }
        }
        for(Calendar calendar : closeTime){
                NoticeOrderCloseJob job = new NoticeOrderCloseJob();
                job.setConsumptionOrderDao(consumptionOrderDao);
                job.setConsumptionRecordDao(consumptionRecordDao);
                job.setCalendar(calendar);
                scheduler.schedule(job,calendar.getTime());
        }


    }

    public static Set<Calendar> getCloseTime() {
        return closeTime;
    }

    public static void setCloseTime(Set<Calendar> closeTime) {
        OrderCloseScheduleManager.closeTime = closeTime;
    }

    public ConsumptionOrderDao getConsumptionOrderDao() {
        return consumptionOrderDao;
    }

    public void setConsumptionOrderDao(ConsumptionOrderDao consumptionOrderDao) {
        this.consumptionOrderDao = consumptionOrderDao;
    }

    public Calendar getCalendar() {
        return calendar;
    }

    public void setCalendar(Calendar calendar) {
        this.calendar = calendar;
    }

    public ThreadPoolTaskScheduler getScheduler() {
        return scheduler;
    }

    public void setScheduler(ThreadPoolTaskScheduler scheduler) {
        this.scheduler = scheduler;
    }

    public static Set<Calendar> getNoticeEmailTime() {
        return noticeEmailTime;
    }

    public static void setNoticeEmailTime(Set<Calendar> noticeEmailTime) {
        OrderCloseScheduleManager.noticeEmailTime = noticeEmailTime;
    }

    public ConsumptionRecordDao getConsumptionRecordDao() {
        return consumptionRecordDao;
    }

    public void setConsumptionRecordDao(ConsumptionRecordDao consumptionRecordDao) {
        this.consumptionRecordDao = consumptionRecordDao;
    }
}
