package com.gogowise.action.valueobject;

import org.apache.commons.lang.StringUtils;

import java.util.Calendar;

public class SearchCondition {
    private Boolean orRelation ;
    private String columnName="";
    private String operationName ="";
    private String value;
    private Calendar calendarValue;
    private Double doubleValue;

    public Boolean getOrRelation() {
        return orRelation;
    }

    public void setOrRelation(Boolean orRelation) {
        this.orRelation = orRelation;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String getOperationName() {
        return operationName;
    }

    public void setOperationName(String operationName) {
        this.operationName = operationName;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Calendar getCalendarValue() {
        return calendarValue;
    }

    public void setCalendarValue(Calendar calendarValue) {
        this.calendarValue = calendarValue;
    }

    public Double getDoubleValue() {
        return doubleValue;
    }

    public void setDoubleValue(Double doubleValue) {
        this.doubleValue = doubleValue;
    }

    public Object getRealValue(){
        if(StringUtils.isBlank(this.getValue()) && this.getCalendarValue() == null && this.getDoubleValue()== null || this.getOperationName() == null) return null;
        if (this.getOperationName().equals("like")){
            return "%"+this.getValue()+"%";
        } else if (this.getCalendarValue() != null) {
            return  this.getCalendarValue();
        } else if (this.getDoubleValue() != null) {
            return  this.getDoubleValue();
        }
        return  this.getValue();
    }

    public String buildCourseSql(){
        String ret = " ";
        if (this.getRealValue() == null || StringUtils.isBlank(this.getColumnName())) return ret;
        if(this.getColumnName().equals("zhiQuan")) {
            ret +=  " and (c.charges  "+ this.getOperationName() +" ? and c.consumptionType = false ) ";
        } else if (this.getColumnName().equals("zhiBi"))  {
            ret +=  " and (c.charges  "+ this.getOperationName() +" ?  and c.consumptionType = true ) ";
        } else {
           ret += " and  " + this.getColumnName() + " "+ this.getOperationName() + " ? ";
        }
        return ret;
    }
}
