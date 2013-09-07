package com.gogowise.domain.android_domain;

import java.util.Calendar;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-8-28
 * Time: 下午3:22
 * To change this template use File | Settings | File Templates.
 */
public class AndroidLiveChannelTerms {
    private String subTitle;
    private Calendar startTime;
    private String logoUrl;
    private String description;
    private String titbits;

    public String getSubTitle() {
        return subTitle;
    }

    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle;
    }

    public Calendar getStartTime() {
        return startTime;
    }

    public void setStartTime(Calendar startTime) {
        this.startTime = startTime;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTitbits() {
        return titbits;
    }

    public void setTitbits(String titbits) {
        this.titbits = titbits;
    }
}
