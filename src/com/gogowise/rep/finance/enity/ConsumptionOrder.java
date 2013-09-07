package com.gogowise.rep.finance.enity;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.user.enity.BaseUser;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import java.util.Calendar;


@Entity
public class ConsumptionOrder extends AbstractPersistence {
    public final static Integer ORDER_STATE_CLOSE = 0 ;  //交易成功
    public final static Integer ORDER_STATE__BALANCE_FREEZE = 1 ;  //款项冻结
    public final static Integer ORDER_STATE__REFUND = 2 ;       //申请退款
    public final static Integer ORDER_STATE__REFUND_REJECT = 3; //拒绝

    public final static Integer ORDER_TYPE_RECHARGE= 0;    //充值交易
    public final static Integer ORDER_TYPE_TRANSFER= 1;   //转账交易
    public final static Integer ORDER_TYPE_BIDDING= 2;    //竞拍交易
    public final static Integer ORDER_TYPE_PURCHASING= 3;  //课程交易

    private String orderId;

    private String remarks;
    private String remarksParameter;
    private Calendar closeTime;
    private Calendar createTime = Calendar.getInstance();

    @ManyToOne
    private BaseUser payer;
    @ManyToOne
    private BaseUser payee;

    private Integer type;
    private Integer state;

    // Product
    @ManyToOne(fetch = FetchType.LAZY)
    private Course course;

    private Double price;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Calendar getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(Calendar closeTime) {
        this.closeTime = closeTime;
    }

    public Calendar getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Calendar createTime) {
        this.createTime = createTime;
    }

    public BaseUser getPayer() {
        return payer;
    }

    public void setPayer(BaseUser payer) {
        this.payer = payer;
    }

    public BaseUser getPayee() {
        return payee;
    }

    public void setPayee(BaseUser payee) {
        this.payee = payee;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getRemarksParameter() {
        return remarksParameter;
    }

    public void setRemarksParameter(String remarksParameter) {
        this.remarksParameter = remarksParameter;
    }
}
