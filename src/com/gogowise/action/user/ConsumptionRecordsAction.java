package com.gogowise.action.user;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.user.BaseUserDao;
import com.gogowise.dao.trade.ConsumptionRecordDao;
import com.gogowise.domain.ConsumptionRecord;
import com.gogowise.domain.Pagination;
import com.gogowise.utils.Utils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;


@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class ConsumptionRecordsAction extends BasicAction {

    private static final long serialVersionUID = 8554180680341830332L;
    private ConsumptionRecordDao consumptionRecordDao;
    private BaseUserDao baseUserDao;
    private List<ConsumptionRecord> records = new ArrayList<ConsumptionRecord>();
    private Calendar beginDate;
    private Calendar endDate = Calendar.getInstance();
    private Pagination pagination = new Pagination(15);

//    {
//        beginDate = Utils.getClientTodayCalendar();
//        beginDate.add(Calendar.MONTH, -3);
//    }

    @Action(value = "initConsumption",
            results = {@Result(name = SUCCESS, type = "tiles", location = ".initConsumption")}
    )
    public String initConsumption() {
        if (beginDate == null ) {
            beginDate = Utils.getClientTodayCalendar();
            beginDate.add(Calendar.MONTH, -3);
            beginDate.getTime();
        }
        records = consumptionRecordDao.findForOwner(super.getSessionUserId(), beginDate, endDate, pagination);
        return SUCCESS;
    }


    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public List<ConsumptionRecord> getRecords() {
        return records;
    }

    public void setRecords(List<ConsumptionRecord> records) {
        this.records = records;
    }

    public Calendar getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(Calendar beginDate) {
        this.beginDate = beginDate;
    }

    public Calendar getEndDate() {
        return endDate;
    }

    public void setEndDate(Calendar endDate) {
        this.endDate = endDate;
    }

    public ConsumptionRecordDao getConsumptionRecordDao() {
        return consumptionRecordDao;
    }

    public void setConsumptionRecordDao(ConsumptionRecordDao consumptionRecordDao) {
        this.consumptionRecordDao = consumptionRecordDao;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }
}
