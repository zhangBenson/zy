package com.gogowise.urlfetch.sk;

import com.gogowise.urlfetch.sk.domain.SkRegion;
import com.gogowise.urlfetch.sk.domain.SkSchool;
import org.apache.commons.lang.StringUtils;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.springframework.stereotype.Component;

import java.util.Calendar;
import java.util.List;


@Component
public class SoKeSchoolHeader extends BaseJunitTest implements Runnable {

    private int regJobId;

    private void fetch(Integer regId) throws Exception {
        String url = "http://www.sooker.com/xuexiaos/1-" + regId + "-0-0-0-0-0-0-0-0-0.html";
        int count = 0;
        Document doc = this.get(url);
        Elements countDiv = doc.select("[class=all]");
        for (Element countSpan : countDiv) {
            count = Integer.parseInt(countSpan.child(0).text());
            if (count > 1000) count = 1000;
        }
        int maxPage = (count - 1) / 8 + 1;
        if (count < 1) return;

        for (int i = 1; i <= maxPage; i++) {
            String urlWithPage = "http://www.sooker.com/xuexiaos/" + i + "-" + regId + "-0-0-0-0-0-0-0-0-0.html";
            fetchClassWithPage(urlWithPage);
        }

    }

    public boolean isCorrectAd(String ad) {
        if (ad != null && !"查看地图".equalsIgnoreCase(ad)) return true;
        return false;
    }

    private void paseSchool(Element school) {
        SkSchool skSchool = new SkSchool();
        Element schoolLogo = school.select("[class=school_logo]").first();
        String schoolUrl = schoolLogo.child(0).attr("href");
        skSchool.setHomePageUrl(schoolUrl);
        Integer schoolSokeId = Integer.parseInt(StringUtils.split(StringUtils.split(skSchool.getHomePageUrl(),"/")[1], ".")[0]);
        skSchool.setSchoolId(schoolSokeId);
        String logoUrl = schoolLogo.child(0).child(0).attr("src");
        skSchool.setLogUrl(logoUrl);
        String schoolName = school.select("[class=school_name]").first().child(0).text();
        skSchool.setName(schoolName);
        Elements adLinks = school.select("[class=lesson_info]").first().select("li > a ");
        int jj = 0;
        String ad1, ad2, ad3;
        for (Element link : adLinks) {
            ++jj;
            if (jj == 1 && isCorrectAd(link.text())) skSchool.setAdv1(link.text());
            if (jj == 2 && isCorrectAd(link.text())) skSchool.setAdv2(link.text());
            if (jj == 3 && isCorrectAd(link.text())) skSchool.setAdv3(link.text());
        }

        Elements phoneLinks = school.select("[class=tel400]");
        int qq = 0;
        for (Element phones : phoneLinks) {
            ++qq;
            if (qq == 1) skSchool.setPhone(phones.text());
            if (qq == 2) skSchool.setPhoneExt(phones.text());
        }
        List<SkSchool> schs = super.getModelDao().find("From SkSchool where  homePageUrl  =  ? ", skSchool.getHomePageUrl());
        if (schs != null && schs.size() > 0) {
            SkSchool existSchool = schs.get(0);
            existSchool.setLogUrl(skSchool.getLogUrl());
            existSchool.setName(skSchool.getName());
            existSchool.setAdv1(skSchool.getAdv1());
            existSchool.setAdv2(skSchool.getAdv2());
            existSchool.setAdv3(skSchool.getAdv3());
            existSchool.setPhone(skSchool.getPhone());
            existSchool.setPhoneExt(skSchool.getPhoneExt());
            super.getModelDao().persistAbstract(existSchool);
        } else {
            super.getModelDao().persistAbstract(skSchool);
        }


    }

    public void fetchClassWithPage(String pageUrl) throws Exception {

        Document doc = this.get(pageUrl);
        Elements schoolDiv = doc.select("[class=lessons]");
        for (Element school : schoolDiv) {
            paseSchool(school);
        }
    }

    @Test
    public void mainJunit() throws Exception {
        goToCountryLevel();
        Long st = Calendar.getInstance().getTimeInMillis();
        logger.info("start time" + st);
        List<SkRegion> skRegions = super.getModelDao().find("from SkRegion r where  r.hasChild =  ? and parentId  is null  ", true);

        for (SkRegion skRegion : skRegions) {
            SoKeSchoolHeader soKeSchool = new SoKeSchoolHeader();
            soKeSchool.setRegJobId(skRegion.getRegId());
            soKeSchool.setModelDao(super.getModelDao());
            super.getExecutor().execute(soKeSchool);
        }
        super.waitAllDone();
        logger.info( "end time" + (Calendar.getInstance().getTimeInMillis() - st));
    }


    public void run() {
        try {
            fetch(this.getRegJobId());
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }

    public int getRegJobId() {
        return regJobId;
    }

    public void setRegJobId(int regJobId) {
        this.regJobId = regJobId;
    }


}
