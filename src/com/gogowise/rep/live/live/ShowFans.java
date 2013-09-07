package com.gogowise.rep.live.live;


import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.user.BaseUser;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import java.util.Calendar;

@Entity
public class ShowFans extends AbstractPersistence {

    @OneToOne
    private BaseUser fan;
    @ManyToOne
    private MyShow myShow;
    private Calendar concernTime;
    private Boolean ConfrimCondition;   // cancelled the concern -->false; else --->true


    public BaseUser getFan() {
        return fan;
    }

    public void setFan(BaseUser fan) {
        this.fan = fan;
    }

    public MyShow getMyShow() {
        return myShow;
    }

    public void setMyShow(MyShow myShow) {
        this.myShow = myShow;
    }

    public Calendar getConcernTime() {
        return concernTime;
    }

    public void setConcernTime(Calendar concernTime) {
        this.concernTime = concernTime;
    }

    public Boolean getConfrimCondition() {
        return ConfrimCondition;
    }

    public void setConfrimCondition(Boolean confrimCondition) {
        ConfrimCondition = confrimCondition;
    }
}
