package com.gogowise.rep.finance;

import com.gogowise.rep.ModelServiceImpl;

import com.gogowise.rep.course.dao.PaypalDao;
import com.gogowise.rep.finance.enity.PaypalDetails;
import com.gogowise.rep.finance.vo.PaypalDetailsSpecification;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 8/19/14
 * Time: 3:38 AM
 * To change this template use File | Settings | File Templates.
 */

@Service("paypalService")
public class PaypalServiceImpl extends ModelServiceImpl implements PaypalService {


    @Autowired
    private PaypalDao paypalDao;

    @Override
    public void savePaypalDetails(PaypalDetailsSpecification specification) {

        PaypalDetails paypalDetails = new PaypalDetails();

        BeanUtils.copyProperties(specification, paypalDetails);

        paypalDao.savePaypalDetails(paypalDetails);
    }

    @Override
    public PaypalDetails findByTxnId(String txnId) {
        return paypalDao.findByTxnId(txnId);

    }
}
