package com.gogowise.common.config;


public class Configuration {

    private String hostName;

    public String getHostName() {
        return hostName;
    }

    public void setHostName(String hostName) {
        ConfigConstants.SITE_NAME = hostName;
        this.hostName = hostName;
    }
}
