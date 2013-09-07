package com.gogowise.urlfetch.sk;

import com.gogowise.rep.Persistable;
import com.gogowise.urlfetch.sk.domain.SkClassType;
import com.gogowise.urlfetch.sk.domain.SkSchool;
import com.gogowise.urlfetch.sk.domain.SkXiaoQu;
import org.apache.commons.lang.StringUtils;
import org.jsoup.HttpStatusException;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;


@Component
public class SoKeSchoolEach extends BaseJunitTest implements Runnable {

    @Test
    public void mainJunit() throws Exception {
        goToCountryLevel();
        Long st = Calendar.getInstance().getTimeInMillis();
        logger.info("start time" + st);

        List<SkSchool> schoolInfos = super.getModelDao().find("From SkSchool  " );
//        List<SkSchool> schoolInfos = super.getModelDao().find("From SkSchool where schoolid = 551711");

        for (SkSchool schoolInfo : schoolInfos) {
            SoKeSchoolEach soKeSchool = new SoKeSchoolEach();
            soKeSchool.setsInfoId(schoolInfo.getSchoolId());
//        soKeSchool.setsInfoId(553228);
            soKeSchool.setModelDao(super.getModelDao());
            super.getExecutor().execute(soKeSchool);
        }


        super.waitAllDone();
        logger.info(super.getScheduler().getScheduledExecutor().isTerminated() + "end time" + (Calendar.getInstance().getTimeInMillis() - st));
    }

    private SkSchool sInfo;
    private Integer sInfoId;

    private void fetch() throws Exception {
        String url = "http://www.sooker.com/xuexiao/" + sInfoId + ".html";

        this.setsInfo((SkSchool) super.getModelDao().findFist("From SkSchool where schoolId = ?", sInfoId));
        Document doc;
        try {
            doc = this.get(url);
        } catch (HttpStatusException e) {
            if (e.getStatusCode() == 404) {
                super.getModelDao().delete(this.getsInfo());
            }
            return;
        }
        Elements khDiv = doc.select("[class=school_kh]");
        for (Element kh : khDiv) {
            sInfo.setKeyPoint(kh.child(0).text());
        }

        fetchXiaoqu(doc.select("[class=traffic]"));

        fetchClassGroup(doc.select("[class=on0]"));

        Elements inDivs = doc.select("[class=school_intro]");
        for (Element intro : inDivs) {
            sInfo.setIntroduceShort(intro.getElementsByTag("P").text());
        }


        String detailIntro = "http://www.sooker.com/xuexiao/" + sInfo.getSchoolId() + "/jieshao.html";
        Document detailDoc = this.get(detailIntro);
        Element deIntro = detailDoc.select("[class=article_content]").first();
        if (deIntro != null)         sInfo.setIntroduce(deIntro.text());





        try {
            this.getModelDao().persistAbstract(sInfo);
        } catch (Exception e) {
            logger.error("=====eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee==========" + sInfo.getName());
            e.printStackTrace();
        }


    }

    private void fetchClassGroup(Elements els) throws IOException {
        for (Element div : els) {
            Element aEl = div.child(0);
            String name = aEl.text();
//            if ("高考辅导".equals(name)) {
//                logger.error("=======inofff========" + sInfo.getHomePageUrl());
//            }

            SkClassType classType = (SkClassType) super.getModelDao().findFist("from SkClassType where name =  ? and level =3", name);
            String urlName = StringUtils.split(StringUtils.split(aEl.attr("href"), "/")[2], ".")[0];
            if ( classType==null ) {
                classType = (SkClassType) super.getModelDao().findFist("from SkClassType where name =  ? and level =2", name);
                if ( classType==null )     classType = (SkClassType) super.getModelDao().findFist("from SkClassType where name =  ? and level =1", name);
            }
            classType.setNameForUrl(urlName);
            super.getModelDao().persistAbstract(classType);
            super.getModelDao().flush();
            this.getsInfo().addClassGroup(classType);
        }

    }

    private void fetchXiaoqu(Elements els) throws Exception {
        for (Element traffic : els) {
            SkXiaoQu stageSet = new SkXiaoQu();
            String[] nid = StringUtils.split(traffic.attr("data-nid"), "|");
            if (nid.length == 2) {
                stageSet.setLng(Float.parseFloat(nid[0]));
                stageSet.setLat(Float.parseFloat(nid[1]));
            }
            stageSet.setAddress(traffic.attr("data-addr"));
            stageSet.setName(StringUtils.trim(traffic.child(0).text()));
            stageSet.setSchoolId(sInfo.getSchoolId());
            if (stageSet.getLng() != null)this.setXiaoQuRegId(stageSet)  ;
            Persistable st = super.getModelDao().findFist("From SkXiaoQu st where st.schoolId = ? and st.name = ? ", sInfo.getSchoolId(), stageSet.getName());
            super.getModelDao().persistWithSwitch(st, stageSet);
            super.getModelDao().flush();
        }
    }


    public void run() {
        try {
            fetch();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public SkSchool getsInfo() {
        return sInfo;
    }

    public void setsInfo(SkSchool sInfo) {
        this.sInfo = sInfo;
    }

    public Integer getsInfoId() {
        return sInfoId;
    }

    public void setsInfoId(Integer sInfoId) {
        this.sInfoId = sInfoId;
    }

    @Test
    public void fixXiaoquPlace() throws Exception {
        List<SkXiaoQu> schoolInfos = super.getModelDao().find("From SkXiaoQu  where lng is not null ");
        for (SkXiaoQu skXiaoQu : schoolInfos) {
            if (!setXiaoQuRegId(skXiaoQu)) continue;
            super.getModelDao().persistAbstract(skXiaoQu);
            super.getModelDao().flush();
        }

    }

    private boolean setXiaoQuRegId(SkXiaoQu skXiaoQu) throws Exception {
        Float lng = skXiaoQu.getLng();
        Float lat = skXiaoQu.getLat();
        String url = "http://basic.ditu.aliyun.com/district?it=p&l=" + lng + "," + lat + "&a=aAbcdfgilnNkKsSTvyY&sp=1&f=0&c=AliDistrict";
        Document doc = this.get(url);
        Integer regId;

        try {
            regId = Integer.parseInt(StringUtils.substringBetween(doc.toString(), "&quot;i&quot;:&quot;", "&quot;,&quot;l&quot;:"));
        } catch (Exception e) {
            logger.error(skXiaoQu.getSchoolId()+"======================paserror ==============" + skXiaoQu.getName());
            return false;
        }

        Object skRegion = super.getModelDao().findFist("From SkRegion where regid = ? ", regId);
//            if (skRegion == null) {
//                logger.error(regId+"======================notexist==============");
//            }
        skXiaoQu.setRegId(regId);
        return true;
    }

}
