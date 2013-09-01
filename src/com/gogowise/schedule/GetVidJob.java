package com.gogowise.schedule;


import com.gogowise.dao.ModelDao;
import com.gogowise.domain.Vid;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

@Component
public class GetVidJob implements Runnable {

    protected static Logger logger = LogManager.getLogger(GetVidJob.class.getName());

    private ThreadPoolTaskScheduler scheduler;
    private ModelDao modelDao;
    private Map<String, String> cookies = new HashMap<String, String>();

    public void run() {
        String perfix =    "http://www.youku.com/v_showlist/t2c91g";
        fetchTech(perfix,"2143" );   //社会1
        fetchTech(perfix,"2147" );   //科技1
        fetchTech(perfix,"2148" );   //生活 1
        fetchTech(perfix,"2144" );   //时政 1
        fetchTech(perfix,"258" );   //军事
        fetchTech(perfix,"308" );   //财经1
        fetchTech(perfix,"2351" );   //法治


    }


    private void fetchTech(String prifix, String typeId) {

        try {
            for (int i = 1; i < 3; i++) {
                String url = prifix + typeId +"d2p" + i + ".html";
                Document doc = this.get(url);
                Elements elements =  doc.select("[class=v]");
                if (elements.size() == 0 ) return;
                for (Element element : elements) {
                   fetchVid(element, typeId );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private boolean fetchVid(Element element, String typeId) {
        Vid vid = new Vid();
        Element alink = element.child(0).child(0);
        vid.setTitle(alink.attr("title"));
        String idStrings[] = StringUtils.split(alink.attr("href"), ".");
        String idString2[] = StringUtils.split(idStrings[idStrings.length - 2], "_");
        vid.setName(idString2[idString2.length - 1]);
        vid.setType(typeId);

        if (this.getModelDao().findFist("From Vid where name = ? ", vid.getName()) != null) return false;

        this.getModelDao().persistAbstract(vid);
        return true;

    }


    @Scheduled(cron = "0 0/01 * * * ?")
    public void scheduleUpdateVid() {

        GetVidJob job = new GetVidJob();
        job.setModelDao(this.getModelDao());
        scheduler.schedule(job, Calendar.getInstance().getTime());

    }

    public ThreadPoolTaskScheduler getScheduler() {
        return scheduler;
    }

    public void setScheduler(ThreadPoolTaskScheduler scheduler) {
        this.scheduler = scheduler;
    }

    public ModelDao getModelDao() {
        return modelDao;
    }

    public void setModelDao(ModelDao modelDao) {
        this.modelDao = modelDao;
    }


    public Document get(String url) throws Exception {
        Connection.Response response;
        try {
            response = getURL(url);
        } catch (Exception e) {
            try {
                response = getURL(url);
            } catch (Exception e2) {
                try {
                    response = getURL(url);
                } catch (Exception e3) {
                    logger.error(url + "-----urlError---------------" + e2.getMessage());
                    e.printStackTrace();
                    throw e2;
                }
            }
        }
        return response.parse();
    }

    private Connection.Response getURL(String url) throws IOException {
        Connection connection = Jsoup.connect(url);
        connection.timeout(40000);
        for (Map.Entry<String, String> cookie : cookies.entrySet()) {
            connection.cookie(cookie.getKey(), cookie.getValue());
        }
        Connection.Response response = connection.execute();
        cookies.putAll(response.cookies());
        return response;
    }


//    public void waitAllDone() throws InterruptedException {
//        int i = 0;
//        Thread.sleep(60000);
//        while (this.getExecutor().getActiveCount() > 0) {
//            logger.info(this.getExecutor().getActiveCount() + "--------"+this.getExecutor().getThreadPoolExecutor().getCompletedTaskCount()+"------------" + i++);
//            Thread.sleep(60000);
//        }
//    }
}