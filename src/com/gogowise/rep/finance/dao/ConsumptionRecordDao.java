package com.gogowise.rep.finance.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.finance.enity.ConsumptionOrder;
import com.gogowise.rep.finance.enity.ConsumptionRecord;
import com.gogowise.rep.Pagination;

import java.util.Calendar;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-13
 * Time: 下午2:30
 * To change this template use File | Settings | File Templates.
 */
public interface ConsumptionRecordDao extends ModelDao<ConsumptionRecord> {
//    public List<ConsumptionRecord> findbySeriesId(Integer id,Integer userId);

    public void createRecordForRecharge(ConsumptionOrder consumptionOrder);

    public void createRecordForPurchase(ConsumptionOrder consumptionOrder);

    public void createRecordForTransfer(ConsumptionOrder consumptionOrder);

    public List<ConsumptionRecord> findForOwner(Integer userId, Calendar start, Calendar end, Pagination pagination);

    public void updateRecordForPurchase(ConsumptionOrder consumptionOrder);

}
