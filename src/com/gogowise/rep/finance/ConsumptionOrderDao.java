package com.gogowise.rep.finance;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.user.user.BaseUser;
import com.gogowise.rep.finance.enity.ConsumptionOrder;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.live.live.UserPrivateChannel;

import java.util.Calendar;
import java.util.List;


public interface ConsumptionOrderDao extends ModelDao<ConsumptionOrder> {

    public void  recharge(BaseUser owner, Double price );

    public void  purchaseCourse(BaseUser owner, Course course );

    public void transfer(BaseUser payer,BaseUser payee,Double price ,Integer transferType);

    public List<ConsumptionOrder> findUnclosedOrder();

    public List<ConsumptionOrder> findUnclosedOrderByCloseTime(Calendar closeTime);

    public void chargeForPrivateChannel(Double totalCharges,UserPrivateChannel userPrivateChannel);

}