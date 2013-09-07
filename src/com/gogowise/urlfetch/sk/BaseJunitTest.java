package com.gogowise.urlfetch.sk;

import com.gogowise.rep.user.BaseUserDao;
import com.gogowise.rep.ModelDao;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.conn.params.ConnRoutePNames;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.junit.After;
import org.junit.Before;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


public class BaseJunitTest {

    protected static Logger logger = LogManager.getLogger(BaseJunitTest.class.getName());

    private Map<String, String> cookies = new HashMap<String, String>();

    private BaseUserDao baseUserDao;
    private ModelDao modelDao;
    private ThreadPoolTaskScheduler scheduler;
    private ThreadPoolTaskExecutor executor;

    @Before
    public void setUp() throws Exception {
//        String[] config = new String[]{
//                "applicationContext.xml"};
//
//        ApplicationContext ctx = new ClassPathXmlApplicationContext(config);

        String[] path = {"WebRoot.war/WEB-INF/config/applicationContext.xml"};
        ApplicationContext ctx = new FileSystemXmlApplicationContext(path);

        baseUserDao = (BaseUserDao) ctx.getBean("baseUserDao");
        modelDao = (BaseUserDao) ctx.getBean("baseUserDao");
        scheduler = (ThreadPoolTaskScheduler) ctx.getBean("scheduler");
        executor = (ThreadPoolTaskExecutor) ctx.getBean("executor");

        goToCountryLevel();
    }

    public void goToCountryLevel() throws Exception {
        String allCityUrl = "http://www.sooker.com/index.php?act=chg_region&region_id=0";
        Document doc1 = this.get(allCityUrl);
    }

    @After
    public void tearDown() throws Exception {

    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public ModelDao getModelDao() {
        return modelDao;
    }

    public void setModelDao(ModelDao modelDao) {
        this.modelDao = modelDao;
    }

    public Map<String, String> getCookies() {
        return cookies;
    }

    public void setCookies(Map<String, String> cookies) {
        this.cookies = cookies;
    }

    public ThreadPoolTaskScheduler getScheduler() {
        return scheduler;
    }

    public void setScheduler(ThreadPoolTaskScheduler scheduler) {
        this.scheduler = scheduler;
    }

    public ThreadPoolTaskExecutor getExecutor() {
        return executor;
    }

    public void setExecutor(ThreadPoolTaskExecutor executor) {
        this.executor = executor;
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

    public  void waitAllDone() throws InterruptedException {
        int i = 0;
        Thread.sleep(60000);
        while (this.getExecutor().getActiveCount() > 0) {
            logger.info(this.getExecutor().getActiveCount() + "--------"+this.getExecutor().getThreadPoolExecutor().getCompletedTaskCount()+"------------" + i++);
            Thread.sleep(60000);
        }
    }


    public static Document getByProxy(String url) {
        String html = "";
        DefaultHttpClient httpclient = new DefaultHttpClient();
        HttpHost proxy = new HttpHost("127.0.0.1", 8087);
        httpclient.getParams().setParameter(ConnRoutePNames.DEFAULT_PROXY,
                proxy);

        HttpGet httpget = new HttpGet(url);

        httpget.addHeader("Accept","text/html, application/xhtml+xml, */*");
        httpget.addHeader("Accept-Language","en-US;q=0.5");
        httpget.addHeader("User-Agent","Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)");


        httpget.addHeader("Connection","Keep-Alive");



        try {

            HttpResponse response = httpclient.execute(httpget);
            HttpEntity entity = response.getEntity();

            if (entity != null) {
                html = EntityUtils.toString(entity);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            httpclient.getConnectionManager().shutdown();
        }
        return  Jsoup.parse(html);
    }


}
