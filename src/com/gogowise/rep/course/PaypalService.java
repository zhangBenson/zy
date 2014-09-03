package com.gogowise.rep.course;

import com.gogowise.rep.ModelService;
import com.gogowise.rep.course.enity.PaypalDetails;
import com.gogowise.rep.course.vo.PaypalDetailsSpecification;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 8/19/14
 * Time: 3:32 AM
 * To change this template use File | Settings | File Templates.
 */
public interface PaypalService extends ModelService {

    public void savePaypalDetails(PaypalDetailsSpecification specification);

    public PaypalDetails findByTxnId(String txnId);

    public PaypalDetails findByCourseId(String courseId);

}
