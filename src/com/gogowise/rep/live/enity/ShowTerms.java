package com.gogowise.rep.live.enity;

import com.gogowise.rep.AbstractPersistence;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import java.util.Calendar;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-6-11
 * Time: 下午1:56
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class ShowTerms extends AbstractPersistence {
    @ManyToOne
    private MyShow myShow;
    private Calendar startTime;

    public MyShow getMyShow() {
        return myShow;
    }

    public void setMyShow(MyShow myShow) {
        this.myShow = myShow;
    }

    public Calendar getStartTime() {
        return startTime;
    }

    public void setStartTime(Calendar startTime) {
        this.startTime = startTime;
    }

    public Calendar getFinishTime(){
        Calendar finishTime = (Calendar)this.getStartTime().clone();
        finishTime.add(Calendar.MINUTE,this.getMyShow().getDuration());
        return finishTime;
    }
}
