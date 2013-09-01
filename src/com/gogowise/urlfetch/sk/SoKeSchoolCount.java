package com.gogowise.urlfetch.sk;

import com.gogowise.urlfetch.sk.domain.SkRegion;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;


@Component
public class SoKeSchoolCount extends BaseJunitTest implements Runnable {

    private  int count = 0;


    private void fetchClass(Integer regId) throws Exception {
        String url = "http://www.sooker.com/xuexiaos/1-"+regId+"-0-0-0-0-0-0-0-0-0.html";

        Elements div = this.get(url).select("[class=all]");
        for (Element e :div) {
            Element span = e.child(0);
            count += Integer.parseInt(span.text());

        }



    }

    @Test
    public void mainJunit() throws Exception {
        try {
            goToCountryLevel();
            Long st = Calendar.getInstance().getTimeInMillis();
            logger.info("start time" + st);
            List<SkRegion> skRegions =  super.getModelDao().find("from SkRegion r where  r.hasChild =  ? and parentId  is null ", true);
            for (SkRegion skRegion : skRegions) {

                fetchClass(skRegion.getRegId());
            }



            logger.info(count +"end time" + (Calendar.getInstance().getTimeInMillis() - st));
        } catch (IOException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }

    }


    public void run() {



    }



}
