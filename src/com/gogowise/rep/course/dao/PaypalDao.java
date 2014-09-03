package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.finance.enity.PaypalDetails;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 8/19/14
 * Time: 3:40 AM
 * To change this template use File | Settings | File Templates.
 */
public interface PaypalDao extends ModelDao<PaypalDetails> {

    public void savePaypalDetails(PaypalDetails paypalDetails);

    public PaypalDetails findByTxnId(String txnId);

    public PaypalDetails findByCourseId(String courseId);
}