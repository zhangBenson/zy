package com.gogowise.rep.finance;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.user.BaseUserDao;
import com.gogowise.rep.user.user.BaseUser;
import com.gogowise.rep.finance.enity.ConsumptionOrder;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.live.live.UserPrivateChannel;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.Utils;
import org.springframework.stereotype.Repository;

import java.util.Calendar;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-13
 * Time: 下午2:33
 * To change this template use File | Settings | File Templates.
 */
@Repository("consumptionOrderDao")
public class ConsumptionOrderDaoImpl extends ModelDaoImpl<ConsumptionOrder>
        implements ConsumptionOrderDao {

    private BaseUserDao baseUserDao;
    private ConsumptionRecordDao consumptionRecordDao;

    public void  recharge(BaseUser owner, Double price ) {
        ConsumptionOrder consumptionOrder = new ConsumptionOrder();
        consumptionOrder.setOrderId(Utils.getOrderId());
        consumptionOrder.setPayer(owner);
        BaseUser zhiYuan = baseUserDao.findByEmail(Constants.ZHIBI_SYSTEM_EMAIL);
        consumptionOrder.setPayee(zhiYuan);
        consumptionOrder.setPrice(price);
        consumptionOrder.setCloseTime(Calendar.getInstance());
        consumptionOrder.setState(ConsumptionOrder.ORDER_STATE_CLOSE);
        consumptionOrder.setType(ConsumptionOrder.ORDER_TYPE_RECHARGE);
        consumptionOrder.setRemarks("zhibi.remarks.consumptionOrder.recharge");
        this.persist(consumptionOrder);
        consumptionRecordDao.createRecordForRecharge(consumptionOrder);
    }

    public void  purchaseCourse(BaseUser owner, Course course ) {
        ConsumptionOrder consumptionOrder = new ConsumptionOrder();
        consumptionOrder.setOrderId(Utils.getOrderId());
        consumptionOrder.setPayer(owner);
        consumptionOrder.setPayee(course.getPayee() );
        consumptionOrder.setPrice(course.getCharges());
        consumptionOrder.setCloseTime(getOrderCloseTimeForCoursePurchase(course));
        consumptionOrder.setState(ConsumptionOrder.ORDER_STATE__BALANCE_FREEZE); //购买课程设置为资金首先设置为冻结状态
        consumptionOrder.setType(ConsumptionOrder.ORDER_TYPE_PURCHASING); //设置交易类型为购买课程的交易
        consumptionOrder.setRemarks("zhibi.remark.order.course.purchase");
        this.persist(consumptionOrder);
        consumptionRecordDao.createRecordForPurchase(consumptionOrder);
    }

    public void transfer(BaseUser payer, BaseUser payee,Double price,Integer transferType) {
        ConsumptionOrder consumptionOrder = new ConsumptionOrder();
        consumptionOrder.setOrderId((Utils.getOrderId()));
        consumptionOrder.setPayer(payer);
        consumptionOrder.setPayee(payee);
        consumptionOrder.setPrice(price);
        consumptionOrder.setCloseTime(Calendar.getInstance());
        consumptionOrder.setState(ConsumptionOrder.ORDER_STATE_CLOSE); //知币转汇直接设置订单状态为交易成功
        consumptionOrder.setType(ConsumptionOrder.ORDER_TYPE_TRANSFER);//设置交易类型为转汇类型
        if(transferType.equals(Constants.TRANSFER_TYPE_OF_CHARGE_FOR_MCHANNEL)){
           consumptionOrder.setRemarks("zhibi.remark.order.transfer.for.mchannel");
        }else {
           consumptionOrder.setRemarks("zhibi.remark.order.transfer");
        }
        this.persist(consumptionOrder);
        consumptionRecordDao.createRecordForTransfer(consumptionOrder);
    }

    public void chargeForPrivateChannel(Double totalCharges, UserPrivateChannel userPrivateChannel) {
        ConsumptionOrder consumptionOrder = new ConsumptionOrder();
        consumptionOrder.setOrderId(Utils.getOrderId());
        consumptionOrder.setPayer(userPrivateChannel.getUser());                 //确定付款人
        BaseUser zhiYuan = baseUserDao.findByEmail(Constants.ZHIBI_SYSTEM_EMAIL);    //转入知元对公账户
        consumptionOrder.setPayee(zhiYuan);
        consumptionOrder.setCloseTime(Calendar.getInstance());
        consumptionOrder.setState(ConsumptionOrder.ORDER_STATE_CLOSE);


    }

    public List<ConsumptionOrder> findUnclosedOrder() {
        String hql = "From ConsumptionOrder co where co.state = 1";
        return this.find(hql);
    }

    public List<ConsumptionOrder> findUnclosedOrderByCloseTime(Calendar closeTime) {
        String hql = "From ConsumptionOrder co where co.state = 1 and co.closeTime = ?";
        return this.find(hql,null,closeTime);
    }

    private Calendar getOrderCloseTimeForCoursePurchase(Course course){
        if(course.getClasses().size() < 2 && course.getClasses().size() > 0){
            Calendar closeTime = (Calendar)course.getClasses().get(0).getDate().clone();
            closeTime.add(Calendar.HOUR_OF_DAY,24);
           return closeTime;
        }
        if(course.getClasses().size() >= 2){
            Calendar closeTime = (Calendar)course.getClasses().get(1).getDate().clone();
            closeTime.add(Calendar.HOUR_OF_DAY,24);
            return closeTime;
        }
        return Calendar.getInstance();

    }



    //    private ConsumptionRecordDao consumptionRecordDao;
//    private BaseUserDao baseUserDao;
//    private CourseDao courseDao;
//    private UserAccountInfoDaoImpl userAccountInfoDao;
//
//
//    private static final String ELECTIVE_COURSE = "预定课程";
//
//
//
//
//    /**
//     * 创建一条隶属于某笔交易的记录  ，并保存
//     *
//     * @param seriesConsumption 交易
//     * @param type              类型 true=zhibi false=zhiquan
//     * @param quantity          数量
//     * @param user              行为产生的用户
//     * @param remarks           评论
//     */
//    private ConsumptionRecord createRecord(ConsumptionOrder seriesConsumption, Boolean type, Double quantity, BaseUser user, String remarks, Boolean state) {
//        ConsumptionRecord consumptionRecord = new ConsumptionRecord();
//        consumptionRecord.setConsumptionOrder(seriesConsumption);
//        consumptionRecord.setConsumptionDate(Calendar.getInstance().getTime());
//        consumptionRecord.setConsumptionType(type);
//        consumptionRecord.setUser(user);
//        consumptionRecord.setQuantity(quantity);
//        consumptionRecord.setRemarks(remarks);
//        consumptionRecordDao.persistAbstract(consumptionRecord);
//        return consumptionRecord;
//    }
//
//
//    public List<ConsumptionOrder> findSeriesConsumtionsByDate(Integer id, Date begin, Date end) {
//        if (begin == null || end == null || begin.getTime() > end.getTime()) {
//            return null;
//        }
//        return this.find("From ConsumptionOrder s where s.consumer.id=? and s.consumptionDate >= ? and s.consumptionDate <= ?", id, begin, end);
//    }
//
//    public List<ConsumptionOrder> findSeriesConsumtionsByUserId(Integer id) {
//        return this.find("From ConsumptionOrder s where s.consumer.id = ? or s.beneficiary.id = ? ", id, id);
//    }
//
//    public List<ConsumptionRecord> findRecords(Integer id) {
//        return consumptionRecordDao.find("From ConsumptionRecord c where c.seriesConsumption.id=?", id);
//    }
//
//    public Boolean createCourseSeries(Integer courseId, Integer userId) {
//
//        ConsumptionOrder seriesConsumption = null;
//        Course course = courseDao.findById(courseId);
//        BaseUser baseUser = baseUserDao.findById(userId);
//        UserAccountInfo userAccountInfo = userAccountInfoDao.findByUserId(userId);
//        List<ConsumptionOrder> list = this.find("From ConsumptionOrder s where s.beneficiary.id = ? and s.businessSummary = ? and s.businessId = ?", course.getTeacher().getId(), ELECTIVE_COURSE, course.getId());
//        //创建教师的series
//        if (list.size() == 0) {
//            seriesConsumption = new ConsumptionOrder();
//            seriesConsumption.setBeneficiary(course.getTeacher());
//            seriesConsumption.setConsumptionState(false);
//            seriesConsumption.setBusinessSummary(ELECTIVE_COURSE);
//            seriesConsumption.setBusinessId(courseId);
//        } else {
//            seriesConsumption = list.get(0);
//        }
//        seriesConsumption.setConsumptionDate(new Date());
//        Double cost = null;
//        Double _cost = null;
//        if (course.getPersonalTeacher() == null) {
//            cost = course.getClasses().size() * Constants.CLASS_COST;
//        } else {
//            cost = course.getCharges();
//        }
//        if (course.getConsumptionType()) {
//            seriesConsumption.setZhibiQuantity(cost + seriesConsumption.getZhibiQuantity());
//        } else {
//
//            if (userAccountInfo.getZhiQuan() < cost) {
//                _cost = cost - userAccountInfo.getZhiQuan();
//                seriesConsumption.setZhiquanQuantity(userAccountInfo.getZhiQuan());
//                seriesConsumption.setZhibiQuantity(_cost);
//            } else {
//                seriesConsumption.setZhiquanQuantity(cost);
//            }
//        }
//        this.persistAbstract(seriesConsumption);
////        String remarks = ((baseUser.getUserName() == null || baseUser.equals(""))?baseUser.getEmail():baseUser.getUserName())+"预定"+course.getTeacher().getUserName()+"老师"+course.getName()+"课程,花费"+cost+(course.getConsumptionType()?"知币":"知券");
//        if (_cost != null) {     //说明用户使用知金代替知券
//            String remarks1 = (StringUtils.isBlank(baseUser.getUserName()) ? baseUser.getEmail() : baseUser.getUserName()) + "预定" + course.getTeacher().getUserName() + "老师" + course.getName() + "课程,花费" + (cost - _cost) + "知券";
//            String remarks2 = (StringUtils.isBlank(baseUser.getUserName()) ? baseUser.getEmail() : baseUser.getUserName()) + "预定" + course.getTeacher().getUserName() + "老师" + course.getName() + "课程,花费" + (_cost) + "知币";
//            if ((cost - _cost) != 0) {               //避免出现消费金额为0的情况
//                createRecord(seriesConsumption, false, cost - _cost, course.getTeacher(), remarks1, false);
//            }
//            createRecord(seriesConsumption, true, _cost, course.getTeacher(), remarks2, false);
//        } else {
//            String remarks = (StringUtils.isBlank(baseUser.getUserName()) ? baseUser.getEmail() : baseUser.getUserName()) + "预定" + course.getTeacher().getUserName() + "老师" + course.getName() + "课程,花费" + cost + (course.getConsumptionType() ? "知币" : "知券");
//            createRecord(seriesConsumption, course.getConsumptionType(), cost, course.getTeacher(), remarks, false);
//        }
//
//        //创建学生series
//        _cost = null;
//        List<ConsumptionOrder> _list = this.find("From ConsumptionOrder s where s.consumer.id = ? and s.businessSummary = ? and s.businessId = ?", userId, ELECTIVE_COURSE, course.getId());
//        ConsumptionOrder _seriesConsumption = null;
//        if (_list.size() == 0) {
//            _seriesConsumption = new ConsumptionOrder();
//            _seriesConsumption.setConsumptionDate(new Date());
//            _seriesConsumption.setConsumer(baseUser);
//            _seriesConsumption.setConsumptionState(false);
//            _seriesConsumption.setBusinessSummary(ELECTIVE_COURSE);
//            _seriesConsumption.setBusinessId(courseId);
//        } else {
//            _seriesConsumption = _list.get(0);
//            _seriesConsumption.setConsumptionDate(new Date());
//        }
//        if (course.getConsumptionType()) {
//            _seriesConsumption.setZhibiQuantity(cost + _seriesConsumption.getZhibiQuantity());
//            userAccountInfo.setZhiBi(userAccountInfo.getZhiBi() - cost);
//        } else {
//            if (userAccountInfo.getZhiQuan() < cost) {
//                _cost = cost - userAccountInfo.getZhiQuan();
//                _seriesConsumption.setZhiquanQuantity(userAccountInfo.getZhiQuan());
//                _seriesConsumption.setZhibiQuantity(_cost);
//                userAccountInfo.setZhiQuan(0.000);
//                userAccountInfo.setZhiBi(userAccountInfo.getZhiBi() - _cost);
//            } else {
//                userAccountInfo.setZhiQuan(userAccountInfo.getZhiQuan() - cost);
//                _seriesConsumption.setZhiquanQuantity(cost);
//            }
//        }
//
//        this.persistAbstract(_seriesConsumption);
//        if (_cost != null) {     //说明用户使用知金代替知券
//            String remarks1 = (StringUtils.isBlank(baseUser.getUserName()) ? baseUser.getEmail() : baseUser.getUserName()) + "预定" + course.getTeacher().getUserName() + "老师" + course.getName() + "课程,花费" + (cost - _cost) + "知券";
//            String remarks2 = (StringUtils.isBlank(baseUser.getUserName()) ? baseUser.getEmail() : baseUser.getUserName()) + "预定" + course.getTeacher().getUserName() + "老师" + course.getName() + "课程,花费" + (_cost) + "知币";
//            if ((_cost - cost) != 0) {     //避免出现消费金额为0的情况
//                createRecord(_seriesConsumption, false, _cost - cost, baseUser, remarks1, false);
//            }
//            createRecord(_seriesConsumption, true, -_cost, baseUser, remarks2, false);
//        } else {
//            String remarks = (StringUtils.isBlank(baseUser.getUserName()) ? baseUser.getEmail() : baseUser.getUserName()) + "预定" + course.getTeacher().getUserName() + "老师" + course.getName() + "课程,花费" + cost + (course.getConsumptionType() ? "知币" : "知券");
//            createRecord(_seriesConsumption, course.getConsumptionType(), -cost, baseUser, remarks, false);
//        }
//        baseUserDao.persistAbstract(baseUser);
//        return true;
//    }
////
////    public Boolean refound(Integer courseId, Integer userId, String comments) {
////        List<ConsumptionOrder> list = this.find("From ConsumptionOrder s where s.consumer.id = ? and s.businessSummary = ? and s.businessId = ?", userId, ELECTIVE_COURSE, courseId);
////        Course course = courseDao.findById(courseId);
////        BaseUser user = baseUserDao.findById(userId);
////        String remarks2 = user.getNickName() + "退订" + course.getTeacher().getNickName() + "老师开设的" + course.getName() + "课程," + "原因是：" + comments;
////        if (list.size() == 0) {
////            return false;
////        }
////        ConsumptionOrder seriesConsumption = list.get(0);
////        Double totalzhibi = 0.000;
////        Double totalzhiquan = 0.000;
////        if (course.getPersonalTeacher() == null) {
////            if (course.getConsumptionType()) {
////                totalzhibi += Constants.CLASS_COST * course.getClasses().size();
////            } else {
////                totalzhiquan += Constants.CLASS_COST * course.getClasses().size();
////            }
////        }
////        if (course.getConsumptionType()) {
////            totalzhibi += course.getCharges();
////        } else {
////            totalzhiquan += course.getCharges();
////        }
////        seriesConsumption.setZhibiQuantity(seriesConsumption.getZhibiQuantity() - totalzhibi);
////        seriesConsumption.setZhiquanQuantity(seriesConsumption.getZhiquanQuantity() - totalzhiquan);
////        this.persistAbstract(seriesConsumption);
////        if (totalzhibi > 0) {
////            createRecord(seriesConsumption, true, totalzhibi, user, remarks2, false);
////        } else {
////            createRecord(seriesConsumption, false, totalzhiquan, user, remarks2, false);
////        }
////        //增加老师退订记录
////
////        List<ConsumptionOrder> list2 = this.find("From ConsumptionOrder s where s.beneficiary.id = ? and s.businessSummary = ? and s.businessId = ?", course.getTeacher().getId(), ELECTIVE_COURSE, courseId);
////        if (list2.size() == 0) {
////            return false;
////        }
////        ConsumptionOrder _series = list2.get(0);
////        _series.setZhibiQuantity(_series.getZhibiQuantity() - totalzhibi);
////        _series.setZhiquanQuantity(_series.getZhibiQuantity() - totalzhiquan);
////        this.persistAbstract(_series);
////        if (Math.abs(totalzhibi) > 0) {
////            createRecord(_series, true, -totalzhibi, course.getTeacher(), remarks2, true);
////        }
////        if (Math.abs(totalzhiquan) > 0) {
////            createRecord(_series, false, -totalzhiquan, course.getTeacher(), remarks2, true);
////        }
////        BaseUser baseUser = baseUserDao.findById(userId);
////        UserAccountInfo userAccountInfo = userAccountInfoDao.findByUserId(userId);
////        userAccountInfo.setZhiBi(userAccountInfo.getZhiBi() + Math.abs(totalzhibi));
////        userAccountInfo.setZhiQuan(userAccountInfo.getZhiQuan() + Math.abs(totalzhiquan));
////        baseUserDao.persistAbstract(baseUser);
////        return true;  //To change body of implemented methods use File | Settings | File Templates.
////    }
//
//    public ConsumptionRecordDao getConsumptionRecordDao() {
//        return consumptionRecordDao;
//    }
//
//    public void setConsumptionRecordDao(ConsumptionRecordDao consumptionRecordDao) {
//        this.consumptionRecordDao = consumptionRecordDao;
//    }
//
//    public BaseUserDao getBaseUserDao() {
//        return baseUserDao;
//    }
//
//    public void setBaseUserDao(BaseUserDao baseUserDao) {
//        this.baseUserDao = baseUserDao;
//    }
//
//    public CourseDao getCourseDao() {
//        return courseDao;
//    }
//
//    public void setCourseDao(CourseDao courseDao) {
//        this.courseDao = courseDao;
//    }
//
//    public UserAccountInfoDaoImpl getUserAccountInfoDao() {
//        return userAccountInfoDao;
//    }
//
//    public void setUserAccountInfoDao(UserAccountInfoDaoImpl userAccountInfoDao) {
//        this.userAccountInfoDao = userAccountInfoDao;
//    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public ConsumptionRecordDao getConsumptionRecordDao() {
        return consumptionRecordDao;
    }

    public void setConsumptionRecordDao(ConsumptionRecordDao consumptionRecordDao) {
        this.consumptionRecordDao = consumptionRecordDao;
    }
}
