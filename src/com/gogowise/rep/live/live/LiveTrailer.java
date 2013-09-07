package com.gogowise.rep.live.live;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.user.BaseUser;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToOne;
import java.util.Calendar;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-9-29
 * Time: 上午9:19
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class LiveTrailer extends AbstractPersistence {
    private String title;
    @Column(length = 10000)
    private String  content;
    private Calendar publishTime;
    @OneToOne
    private BaseUser owner;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Calendar getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Calendar publishTime) {
        this.publishTime = publishTime;
    }

    public BaseUser getOwner() {
        return owner;
    }

    public void setOwner(BaseUser owner) {
        this.owner = owner;
    }
}
