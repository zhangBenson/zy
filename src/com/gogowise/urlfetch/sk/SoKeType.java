package com.gogowise.urlfetch.sk;

import com.gogowise.urlfetch.sk.domain.SkClassTimeType;
import com.gogowise.urlfetch.sk.domain.SkClassType;
import org.apache.commons.lang.StringUtils;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;


public class SoKeType extends BaseJunitTest implements Runnable {


    @Test
    public void mainJunit() throws Exception {
        Long st = Calendar.getInstance().getTimeInMillis();
        logger.info("start time" + st);
        SoKeType soKeType = new SoKeType();
        soKeType.setLevel(1);
        soKeType.setModelDao(this.getModelDao());
        soKeType.setExecutor(this.getExecutor());

        soKeType.fetchType();
        super.waitAllDone();
        logger.info("end time" + (Calendar.getInstance().getTimeInMillis() - st));

    }


    @Test
    public void fixTypeUrl() throws Exception {
        Long st = Calendar.getInstance().getTimeInMillis();
        logger.info("start time" + st);
        String url = "http://www.sooker.com/course";
        Elements elements = this.get(url).select("[class=sort_box]");
        for (Element fistType : elements) {
            Elements secElems = fistType.select("[class=sort_detail]").first().getElementsByTag("dl");
            for (Element secEl : secElems) {
                String secName = secEl.child(0).text();
                if ("厨艺/调酒/咖".equals(secName)) secName = "厨艺/调酒/咖啡类";
                String[] secUrlArry = StringUtils.split(secEl.child(0).child(0).attr("href"), "/");
                String secUrl = secUrlArry[secUrlArry.length - 1];
                saveType(secName, secUrl, 2, null);
                SkClassType secT = (SkClassType) super.getModelDao().findFist("From SkClassType where name = ? and level = ? ", secName, 2);


                Elements trdEls = secEl.child(1).getElementsByTag("li");
                for (Element trdE : trdEls) {
                    String tidName = trdE.text();
                    String[] trdArray = StringUtils.split(trdE.child(0).attr("href"), "/");
                    String trdUlr = trdArray[trdArray.length - 1];
                    saveType(tidName, trdUlr, 3, secT.getTypeId());
                }

            }

        }

        List<SkClassType> urlNulArray = super.getModelDao().find("From SkClassType where level < 3  ");
        for (SkClassType rulNull: urlNulArray) {
            rulNull.setNameForUrl( "c"+rulNull.getTypeId());
            super.getModelDao().persistAbstract(rulNull);
        }


        logger.info("end time" + (Calendar.getInstance().getTimeInMillis() - st));

    }













    private void saveType(String secName, String secUrl, int level, Integer parentId) throws Exception {
        if (secUrl == null) return;
        List<SkClassType> secClassTypes;
        if (level == 2) {
            secClassTypes = super.getModelDao().find("From SkClassType where name = ? and level = ? ", secName, level);
        } else {
            secClassTypes = super.getModelDao().find("From SkClassType where name = ? and level = ? and parentId = ? ", secName, level, parentId);
        }
        if (secClassTypes.size() != 1) {
            throw new Exception(secName + "===============eror not exit " + secClassTypes.size() + "=======================" + secUrl);
        }

        SkClassType secClassType = secClassTypes.get(0);
        secClassType.setNameForUrl(secUrl);
        super.getModelDao().persistAbstract(secClassType);
        super.getModelDao().flush();
    }


    @Test
    public void saveTTUT() throws IOException {
        Long st = Calendar.getInstance().getTimeInMillis();
        logger.info("start time" + st);
        saveTimeType(1, "全日制");
        saveTimeType(2, "寒假班");
        saveTimeType(3, "暑假班");
        saveTimeType(4, "周末班");
        saveTimeType(5, "随到随学");
        saveTimeType(6, "其它");
        saveTimeType(7, "晚班");
        saveTimeType(8, "业余班");
        saveTimeType(9, "一对一班");
        logger.info("end time" + (Calendar.getInstance().getTimeInMillis() - st));
    }


    private Integer level;
    private Integer parentId;


    private void fetchType() throws Exception {
        String url = "http://www.sooker.com/index.php?app=map&act=detail";
        if (parentId != null) {
            url = url + "&cate_id=" + parentId;
        }
        Document doc = this.get(url);
        Element div = doc.getElementById("m_filter");

        Elements els = div.select("[data-type=cate_id]");


        for (Element e : els) {
            Elements as = e.select("dl > dd > a");
            for (Element a : as) {
                SkClassType skClassType = new SkClassType();
                skClassType.setName(new String(a.text().getBytes("UTF-8")));
                skClassType.setTypeId(Integer.parseInt(a.attr("data-cate_id")));
                skClassType.setParentId(parentId);
                skClassType.setLevel(this.getLevel());
                List<SkClassType> exit = super.getModelDao().find("From SkClassType where name =  ? and  typeId  =  ? ", skClassType.getName(), skClassType.getTypeId());
                if (exit != null && exit.size() > 0) {

                    SkClassType r = exit.get(0);
                    r.setName(skClassType.getName());
                    r.setTypeId(skClassType.getTypeId());
                    r.setParentId(skClassType.getParentId());
                    r.setLevel(skClassType.getLevel());
                    super.getModelDao().persistAbstract(r);

                } else {
                    super.getModelDao().persistAbstract(skClassType);
                }
                if (parentId != null) {
                    List<SkClassType> parents = super.getModelDao().find("From SkClassType where  typeId  =  ? ", parentId);
                    if (parents != null && parents.size() > 0) {
                        SkClassType parent = parents.get(0);
                        if (parent.getHasChild() == null || !parent.getHasChild()) {
                            parent.setHasChild(true);
                            super.getModelDao().persistAbstract(parent);
                        }
                    }
                }

                if (this.getLevel() < 3) {
                    SoKeType soKeType = new SoKeType();
                    soKeType.setLevel(this.getLevel().intValue() + 1);
                    soKeType.setModelDao(this.getModelDao());
                    soKeType.setParentId(skClassType.getTypeId());
                    soKeType.setExecutor(this.getExecutor());
                    this.getExecutor().execute(soKeType);
                }
            }
        }


    }


    private void saveTimeType(Integer id, String name) {
        SkClassTimeType skClassTimeType = new SkClassTimeType();
        skClassTimeType.setName(name);
        skClassTimeType.setId(id);
        super.getModelDao().persistAbstract(skClassTimeType);
    }


    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public void run() {
        try {
            this.fetchType();
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }
}
