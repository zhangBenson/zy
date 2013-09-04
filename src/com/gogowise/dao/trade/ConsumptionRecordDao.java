package com.gogowise.dao.trade;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.ConsumptionOrder;
import com.gogowise.domain.ConsumptionRecord;
import com.gogowise.domain.Pagination;

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

    public  List<ConsumptionRecord> findForOwner(Integer userId , Calendar start, Calendar end , Pagination pagination);

    public void updateRecordForPurchase(ConsumptionOrder consumptionOrder);

}
