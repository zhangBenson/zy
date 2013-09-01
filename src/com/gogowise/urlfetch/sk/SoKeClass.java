package com.gogowise.urlfetch.sk;

import com.gogowise.urlfetch.sk.domain.SkClass;
import com.gogowise.urlfetch.sk.domain.SkClassType;
import com.gogowise.urlfetch.sk.domain.SkSchool;
import com.gogowise.urlfetch.sk.domain.SkXiaoQu;
import org.apache.commons.lang.StringUtils;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.springframework.stereotype.Component;

import java.util.Calendar;
import java.util.List;


@Component
public class SoKeClass extends BaseJunitTest implements Runnable {


    @Test
    public void mainJunit() throws Exception {
        goToCountryLevel();
        Long st = Calendar.getInstance().getTimeInMillis();
        logger.info("start time" + st);

//        List<SkSchool> schoolInfos = super.getModelDao().find("from SkSchool  ");
        List<SkSchool> schoolInfos = super.getModelDao().find("From SkSchool where schoolId = ? ", 321142);
        List<SkSchool> schoolInfos2 = super.getModelDao().find("From SkSchool where schoolId != ? ", 321142);
        schoolInfos.addAll(schoolInfos2) ;
        for (SkSchool schoolInfo : schoolInfos) {
            SoKeClass soKeClass = new SoKeClass();
            soKeClass.setsInfoId(schoolInfo.getSchoolId());
//        soKeClass.setsInfoId(553228);
            soKeClass.setModelDao(super.getModelDao());
            super.getExecutor().execute(soKeClass);


        }


        super.waitAllDone();
        logger.info(super.getScheduler().getScheduledExecutor().isTerminated() + "end time" + (Calendar.getInstance().getTimeInMillis() - st));
    }

    private SkSchool sInfo;
    private Integer sInfoId;
    private String typeUrl;
    private Integer typeId;



    private void fetch() throws Exception {
//        this.setsInfo((SkSchool) super.getModelDao().findFist("From SkSchool where schoolId = ?", sInfoId));
        int i = 0;
        while (true) {
            ++i;
            String url = "http://www.sooker.com/index.php?app=school&act=courselist&school_id=" + sInfoId + "&p=" + i;
            Document doc = this.get(url);
            Elements classDivs = doc.select("[class=left w6]");
            if (classDivs.size() == 0) {
                return;
            }
            for (Element classDiv : classDivs) {
                fetchClass(classDiv);
            }
        }

    }

    private void fetchClass(Element classParentDiv) throws Exception {
        SkClass classInfo = new SkClass();
        Element classNameLink = classParentDiv.select("h1 > a").first();
        classInfo.setName(classNameLink.text());
        classInfo.setHomePageUrl(classNameLink.attr("href"));
        String[] attrs = StringUtils.split(StringUtils.split(classInfo.getHomePageUrl(), ".")[0], "/");
        classInfo.setClassId(Integer.parseInt(attrs[attrs.length - 1]));
        Object existClass = super.getModelDao().findFist("From SkClass where classId = ? ", classInfo.getClassId());
        if (existClass != null) {
            classInfo = (SkClass) existClass;
//            return;
        }

        classInfo.setSchoolId(sInfoId);

        Element elPrice = classParentDiv.nextElementSibling().select("[class=price3]").first();
        if (elPrice != null) {
            classInfo.setPrice( Float.parseFloat(elPrice.text()));
        }



        String typeUrl = attrs[attrs.length - 2];
        Object o = super.getModelDao().findFist("From SkClassType  where nameForUrl = ?", typeUrl);
        if (o == null && "0".equals(typeUrl)) {
        }  else if (o == null) {
            classInfo.setTypeUrl(typeUrl );
            logger.error(classInfo.getHomePageUrl() + "==================eeino=============" );
        }else {
            classInfo.setTypeId(((SkClassType) o).getTypeId());
        }

        String courseUrl = "http://sooker.com" + classInfo.getHomePageUrl();

        Document doc = this.get(courseUrl);
        Element classDiv = doc.select("[class=cd_txt]").first();
        if (doc.select("[class=expire]").size() != 0) {
            classInfo.setExpire(true);
        } else {

            Element intro = doc.select("[class=article_content]").first();

            classInfo.setIntroduce(intro.text());

            Elements mutiXiaoQu = classDiv.select("[class=campus]");
            if (mutiXiaoQu.size() > 0) {
                this.setStringXiaoqu(classInfo, mutiXiaoQu.text());
            } else {
                Element shorXiaoQus = classDiv.getElementsByTag("address").first();
                this.setStringXiaoqu(classInfo, shorXiaoQus.text());
            }
        }
        super.getModelDao().persistAbstract(classInfo);
        super.getModelDao().flush();
    }

    private void setStringXiaoqu(SkClass classInfo, String xiaoquString) {
        String[] xiqoArray = StringUtils.split(xiaoquString, "/");
        for (String xiaoqu : xiqoArray) {
            SkXiaoQu xiaoQuObj = (SkXiaoQu) super.getModelDao().findFist("From SkXiaoQu where schoolId = ? and name = ? ", this.getsInfoId(), StringUtils.trim(xiaoqu));
            if (xiaoQuObj != null) {
                classInfo.addXiaoqu(xiaoQuObj);
            }
//            else {
//                logger.error(classInfo.getHomePageUrl() + "==================xiao not exist=============" + xiaoqu);
//            }
        }


    }



    public void run() {
        try {
            Long st = Calendar.getInstance().getTimeInMillis();
            fetch();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getTypeUrl() {
        return typeUrl;
    }

    public void setTypeUrl(String typeUrl) {
        this.typeUrl = typeUrl;
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

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }
}
