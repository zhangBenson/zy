package com.gogowise.rep.live.live;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.user.BaseUser;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import java.util.Calendar;

@Entity
public class ShowNewEvent extends AbstractPersistence {
    private String title;
    private String content;
    private String logoUrl;
    @ManyToOne
    private MyShow myShow;
    private Calendar createTime;
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

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public MyShow getMyShow() {
        return myShow;
    }

    public void setMyShow(MyShow myShow) {
        this.myShow = myShow;
    }

    public Calendar getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Calendar createTime) {
        this.createTime = createTime;
    }

    public BaseUser getOwner() {
        return owner;
    }

    public void setOwner(BaseUser owner) {
        this.owner = owner;
    }
}
