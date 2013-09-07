package com.gogowise.rep.system.enity;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.enity.BaseUser;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import java.util.Calendar;

@Entity
public class FeedBackInfo extends AbstractPersistence {
    @OneToOne
    private BaseUser provider;
    private String content;
    private String logoUrl;
    private Calendar createTime;

    public BaseUser getProvider() {
        return provider;
    }

    public void setProvider(BaseUser provider) {
        this.provider = provider;
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

    public Calendar getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Calendar createTime) {
        this.createTime = createTime;
    }
}
