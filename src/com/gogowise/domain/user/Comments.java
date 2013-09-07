package com.gogowise.domain.user;

import com.gogowise.domain.AbstractPersistence;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import java.util.Calendar;

@Entity
public class Comments extends AbstractPersistence {
    @ManyToOne
    private BaseUser owner;     //留言人
    @ManyToOne
    private BaseUser to;         //被留言人
    private String description;     //留言信息
    private Calendar createDate = Calendar.getInstance();     //留言日期


    public BaseUser getOwner() {
        return owner;
    }

    public void setOwner(BaseUser owner) {
        this.owner = owner;
    }

    public BaseUser getTo() {
        return to;
    }

    public void setTo(BaseUser to) {
        this.to = to;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Calendar getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Calendar createDate) {
        this.createDate = createDate;
    }
}
