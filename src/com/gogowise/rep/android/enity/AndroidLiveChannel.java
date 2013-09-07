package com.gogowise.rep.android.enity;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-7-29
 * Time: 下午6:03
 * To change this template use File | Settings | File Templates.
 */
public class AndroidLiveChannel {
    private String logoUrl;
    private String description;
    private String name;
    private String host;
    private AndroidLiveChannelTerms channelTerms;
    private String type;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public AndroidLiveChannelTerms getChannelTerms() {
        return channelTerms;
    }

    public void setChannelTerms(AndroidLiveChannelTerms channelTerms) {
        this.channelTerms = channelTerms;
    }
}
