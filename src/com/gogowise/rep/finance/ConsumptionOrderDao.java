package com.gogowise.rep.finance;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.finance.enity.ConsumptionOrder;
import com.gogowise.rep.course.enity.Course;

import java.util.Calendar;
import java.util.List;


public interface ConsumptionOrderDao extends ModelDao<ConsumptionOrder> {

    public void  recharge(BaseUser owner, Double price );

    public void  purchaseCourse(BaseUser owner, Course course );

    public void transfer(BaseUser payer,BaseUser payee,Double price ,Integer transferType);

    public List<ConsumptionOrder> findUnclosedOrder();

    public List<ConsumptionOrder> findUnclosedOrderByCloseTime(Calendar closeTime);


}