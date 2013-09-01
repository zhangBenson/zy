package com.gogowise.urlfetch.sk;

import com.gogowise.urlfetch.sk.domain.SkRegion;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;

import java.util.Calendar;
import java.util.List;

public class SoKeRegion extends BaseJunitTest implements Runnable {


    private Integer parentId;

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    private void fetch() throws Exception {
        String url = "http://www.sooker.com/index.php?app=map&act=detail";
        if (parentId != null) {
            url = url + "&region_id=" + parentId;
        }
        Document doc = this.get(url);
        Element div = doc.getElementById("m_filter");

        Elements els = div.select("[data-type=region_id]");


        for (Element e : els) {
            Elements as = e.select("dl > dd > a");
            for (Element a : as) {
                SkRegion skRegion = new SkRegion();
                skRegion.setName(a.text());
                skRegion.setRegId(Integer.parseInt(a.attr("data-region_id")));
                skRegion.setParentId(parentId);
                List<SkRegion> exit = super.getModelDao().find("From SkRegion where name =  ? and  regId  =  ? ", skRegion.getName(), skRegion.getRegId());
                if (exit != null && exit.size() > 0) {
                    if (!exit.get(0).isSame(skRegion)) {
                        SkRegion r = exit.get(0);
                        r.setName(skRegion.getName());
                        r.setRegId(skRegion.getRegId());
                        r.setParentId(skRegion.getParentId());
                        super.getModelDao().persistAbstract(r);
                    }
                } else {
                    super.getModelDao().persistAbstract(skRegion);
                }
                if (parentId != null) {
                    List<SkRegion> parents = super.getModelDao().find("From SkRegion where  regId  =  ? ", parentId);
                    if (parents != null && parents.size() > 0) {
                        SkRegion parent = parents.get(0);
                        if (parent.getHasChild() == null || !parent.getHasChild()) {
                            parent.setHasChild(true);
                            super.getModelDao().persistAbstract(parent);
                        }
                    }
                }
//                fetch(skRegion.getRegId());
                SoKeRegion soKeRegion = new SoKeRegion();
                soKeRegion.setParentId(skRegion.getRegId());
                soKeRegion.setModelDao(super.getModelDao());
                soKeRegion.setExecutor(super.getExecutor());
                super.getExecutor().execute(soKeRegion);
            }
        }


    }

    @Test
    public void mainJunit() throws Exception {
        Long st = Calendar.getInstance().getTimeInMillis();
        logger.info("start time" + st);
        fetch();
        super.waitAllDone();
        logger.info("end time" + (Calendar.getInstance().getTimeInMillis() - st));

    }


    public void run() {
        try {
            fetch();
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }
}
