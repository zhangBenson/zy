package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.finance.enity.PaypalDetails;
import org.springframework.stereotype.Repository;

import java.util.List;

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


    public PaypalDetails findByCourseId(String courseId){
        String hql = " select w from PaypalDetails  w  where w.courseId='"+courseId+"'";

        List<PaypalDetails> list = this.find(hql);

        if(list!=null && list.size()>0){
            return list.get(0);
        }else{
            return null;
        }
    }

}
