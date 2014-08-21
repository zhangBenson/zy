package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.course.enity.PaypalDetails;
import org.springframework.stereotype.Repository;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 8/19/14
 * Time: 3:42 AM
 * To change this template use File | Settings | File Templates.
 */

@Repository("paypalDao")
public class PaypalDaoImpl extends ModelDaoImpl<PaypalDetails> implements PaypalDao {

    @Override
    public void savePaypalDetails(PaypalDetails paypalDetails) {
        this.persistAbstract(paypalDetails);
    }

    @Override
    public PaypalDetails findByTxnId(String txnId) {

        String hql = " select w from PaypalDetails  w  where w.txnId='" + txnId + "'";
        return this.findFist(hql);

    }
}
