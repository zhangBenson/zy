package com.gogowise.repository.finance;

import com.gogowise.repository.ModelDao;
import com.gogowise.domain.user.BaseUser;
import com.gogowise.domain.finance.ConsumptionOrder;
import com.gogowise.domain.course.Course;
import com.gogowise.domain.live.UserPrivateChannel;

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