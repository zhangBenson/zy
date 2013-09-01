package com.gogowise.urlfetch.sk.covert;

import com.gogowise.domain.XiaoQu;
import com.gogowise.urlfetch.sk.BaseJunitTest;
import org.jsoup.nodes.Document;
import org.junit.Test;

import java.net.URLEncoder;
import java.util.List;
import java.util.Random;

/**
 * Created with IntelliJ IDEA.
 * User: Benson
 * Date: 13-3-14
 * Time: 下午10:22
 * To change this template use File | Settings | File Templates.
 */
public class XiaoQuConvert extends BaseJunitTest implements Runnable {


    public XiaoQu xiaoQu;

    @Test
    public void  testAddress() throws InterruptedException {
        List<XiaoQu> xiaoQus = super.getModelDao().find("From XiaoQu where noLocation = false and  lat = ?", 0.0f);
        for (XiaoQu xiaoQu : xiaoQus) {
            if (xiaoQu.getAddress() != null) {
                XiaoQuConvert xiaoQuConvert = new XiaoQuConvert();
                xiaoQuConvert.setModelDao(this.getModelDao());
                xiaoQuConvert.xiaoQu = xiaoQu;
                this.getExecutor().execute(xiaoQuConvert);
//                this.setLatandLng(xiaoQu);
            }
            else {
                logger.error("=== no address===========" + xiaoQu.getId());
            }

        }

        this.waitAllDone();
    }

    public void setLatandLng() throws InterruptedException {
        try {


            String address = URLEncoder.encode(xiaoQu.getAddress(), "UTF-8");
            Random random = new Random(1000000);
            String url = "http://maps.google.com/maps/api/geocode/xml?address=" + address + "&sensor=false&randomNum=" + random.nextInt();
            Document doc = getByProxy(url);

            if (doc.getElementsByTag("lat").size() == 1) {
                String lat = doc.getElementsByTag("lat").first().text();
                String lng = doc.getElementsByTag("lng").first().text();
                xiaoQu.setLat(Float.parseFloat(lat));
                xiaoQu.setLng(Float.parseFloat(lng));
                super.getModelDao().persistAbstract(xiaoQu);
                super.getModelDao().flush();

            } else {
                xiaoQu.setNoLocation(true);
                super.getModelDao().persistAbstract(xiaoQu);
                super.getModelDao().flush();
                logger.error(Thread.currentThread().getName()+"==============eeeor===========" +doc.toString());
            }


        } catch (Exception e) {
            logger.error("======encod error======" + xiaoQu.getAddress());
            e.printStackTrace();
        }

    }


    public void run() {
        try {
            setLatandLng();
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }
}
