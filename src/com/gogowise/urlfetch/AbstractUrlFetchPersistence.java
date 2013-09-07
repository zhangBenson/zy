package com.gogowise.urlfetch;


import com.gogowise.rep.AbstractPersistence;

import javax.persistence.MappedSuperclass;
import javax.persistence.Version;
import java.util.Calendar;


@MappedSuperclass
public abstract class AbstractUrlFetchPersistence extends AbstractPersistence {
    @Version
    private Integer version;


    private Calendar createTime = Calendar.getInstance();

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
        this.createTime = Calendar.getInstance();
    }
    public Calendar getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Calendar createTime) {
        this.createTime = createTime;
    }

    public boolean isSame(AbstractUrlFetchPersistence obj) {
        if (this.getId() == null) return false;
        return this.getId().equals(obj.getId());
    }
}
