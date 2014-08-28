package com.gogowise.common.utils;

import com.gogowise.rep.system.MatterDao;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.stereotype.Component;

@Component
public class InitializingServiceBean {
    private ThreadPoolTaskScheduler scheduler;
    private MatterDao matterDao;

    public ThreadPoolTaskScheduler getScheduler() {
        return scheduler;
    }

    public void setScheduler(ThreadPoolTaskScheduler scheduler) {
        EmailUtil.scheduler = scheduler;
        this.scheduler = scheduler;

    }

    public MatterDao getMatterDao() {
        return matterDao;
    }

    public void setMatterDao(MatterDao matterDao) {
        this.matterDao = matterDao;
    }
}
