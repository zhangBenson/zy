package com.gogowise.rep;

import com.gogowise.common.utils.Constants;
import com.opensymphony.xwork2.ActionContext;

/**
 * Created by IntelliJ IDEA.
 * User: zhangb
 * Date: Jun 5, 2009
 * Time: 9:49:06 AM
 * To change this template use File | Settings | File Templates.
 */
public class Pagination {
    private int pageNow = 1;
    private Long totalSize;
    private String actionName = null;
    private int pageSize = Constants.PAGE_SIZE;

    public Pagination(){}

    public Pagination(int pageSize){
       this.pageSize = pageSize;
    }

    public int getPageNow() {
        return pageNow;
    }

    public void setPageNow(int pageNow) {
        this.pageNow = pageNow;
    }

    public boolean isHasNext() {
        return this.getPageNow() < getTotalPage() ;
    }

    public boolean isHasPre() {
        return this.getPageNow() - 1 > 0;
    }


    public Long getTotalSize() {
        return totalSize;
    }

    public void setTotalSize(Long totalSize) {
        this.totalSize = totalSize;
    }

    public String getActionName() {
        if (actionName != null)
            return actionName;
        else
            return ActionContext.getContext().getName();
    }

    public void setActionName(String actionName) {
        this.actionName = actionName;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getFirstRecord() {
        return (this.pageNow - 1) * this.pageSize;
    }

    public int getTotalPage() {
        return (this.getTotalSize().intValue() + this.getPageSize() - 1) /this.getPageSize();
    }
}
