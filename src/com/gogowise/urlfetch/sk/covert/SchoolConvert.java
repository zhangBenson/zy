package com.gogowise.urlfetch.sk.covert;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.urlfetch.sk.*;
import com.gogowise.urlfetch.sk.domain.SkClass;
import com.gogowise.urlfetch.sk.domain.SkSchool;
import com.gogowise.urlfetch.sk.domain.SkTypeRule;
import com.gogowise.urlfetch.sk.domain.SkXiaoQu;
import org.apache.commons.beanutils.BeanUtils;
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
public class SchoolConvert extends BaseJunitTest implements Runnable {

    public SkSchool skSchool;

    @Test
    public void covert() throws InterruptedException {

        //        List<SkSchool> skSchools = super.getModelDao().find("From SkSchool where homePageUrl = ?" ,"/xuexiao/551711.html");
        List<SkSchool> skSchools = super.getModelDao().find("From SkSchool");
        //        List<SkSchool> skSchools = new ArrayList<SkSchool>();
        //        skSchools.add((SkSchool) super.getModelDao().findFist("From SkSchool"));

        for (SkSchool skSchoolTemp : skSchools) {
            SchoolConvert schoolConvert = new SchoolConvert();
            schoolConvert.setExecutor(this.getExecutor());
            schoolConvert.setModelDao(this.getModelDao());
            schoolConvert.skSchool = skSchoolTemp;
            this.getExecutor().execute(schoolConvert);
        }

        super.waitAllDone();
    }

    public void saveSchool() {

        String uid = "sk" + skSchool.getSchoolId();
        List<School> schools = super.getModelDao().find("From School where uid= ? ", uid);
        School school = new School();
        if (schools.size() > 0)
            school = schools.get(0);
        school.setUid(uid);
        this.persistWithSwitch(school, skSchool);
        super.getModelDao().flush();

        List<SkXiaoQu> xiaoQus = super.getModelDao().find("From SkXiaoQu where schoolId =  ?", skSchool.getSchoolId());
        for (SkXiaoQu skXiaoQu : xiaoQus) {

            XiaoQu xiaoQu = new XiaoQu();
            List<XiaoQu> st = super.getModelDao().find("From XiaoQu st where st.school.id = ? and st.name = ? ", school.getId(), skXiaoQu.getName());
            if (st.size() > 0)
                xiaoQu = st.get(0);
            this.persistWithSwitch(xiaoQu, skXiaoQu);
            xiaoQu.setSchool(school);
            if (xiaoQu.getLat() == null && xiaoQu.getAddress() != null) {
                this.setLatandLng(xiaoQu);
            }
            super.getModelDao().persistAbstract(xiaoQu);

        }

        List<SkClass> skClasses = super.getModelDao().find("From SkClass where schoolId =  ?", skSchool.getSchoolId());
        for (SkClass skClass : skClasses) {
            if ((skClass.getExpire() != null && skClass.getExpire()) || (this.getClassType(skClass.getTypeId()) == null))
                continue;
            String skUid = "sk" + skClass.getClassId();
            ClassInfoSk classInfoSk = new ClassInfoSk();
            List<ClassInfoSk> slassInfos = super.getModelDao().find("From ClassInfo where uid =  ?", skUid);
            if (slassInfos.size() > 0)
                classInfoSk = slassInfos.get(0);
            classInfoSk.setUid(skUid);
            this.persistWithSwitch(classInfoSk, skClass);
            classInfoSk.setSchool(school);
            classInfoSk.setClassType(this.getClassType(skClass.getTypeId()));
            if (classInfoSk.getClassType() == null)
                logger.error("==========================" + skClass.getTypeId());
            super.getModelDao().persistAbstract(classInfoSk);
            for (SkXiaoQu skXiaoQu : skClass.getXiaoqus()) {
                List<XiaoQu> xiaoPs = super.getModelDao().find("From XiaoQu st where st.school.id = ? and st.name = ? ", school.getId(), skXiaoQu.getName());
                List<ClassXiaoQu> classXiaoQus = super.getModelDao().find("From ClassXiaoQu where classInfo.id = ? and xiaoQu.id=?", classInfoSk.getId(), xiaoPs.get(0).getId());
                if (classXiaoQus.size() > 0)
                    continue;
                ClassXiaoQu classXiaoQu = new ClassXiaoQu();
                classXiaoQu.setClassInfoSk(classInfoSk);
                classXiaoQu.setXiaoQu(xiaoPs.get(0));
                super.getModelDao().persistAbstract(classXiaoQu);
            }

        }
    }

    @Test
    public void testAddress() {

        List<XiaoQu> xiaoQus = super.getModelDao().find("From XiaoQu where lat = ?", 0.0f);
        for (XiaoQu xiaoQu : xiaoQus) {
            if (xiaoQu.getAddress() != null)
                this.setLatandLng(xiaoQu);
            else {
                logger.error("=== no address===========" + xiaoQu.getId());
            }
            super.getModelDao().persistAbstract(xiaoQu);
        }

    }

    public void setLatandLng(XiaoQu xiaoQu) {

        try {

            String address = URLEncoder.encode(xiaoQu.getAddress(), "UTF-8");
            Random random = new Random(1000000);
            String url = "http://maps.google.com/maps/api/geocode/xml?address=" + address + "&sensor=false&randomNum=" + random.nextInt();
            Document doc = this.get(url);
            if (doc.getElementsByTag("lat").first() != null) {
                String lat = doc.getElementsByTag("lat").first().text();
                String lng = doc.getElementsByTag("lng").first().text();
                xiaoQu.setLat(Float.parseFloat(lat));
                xiaoQu.setLng(Float.parseFloat(lng));
            }

        } catch (Exception e) {
            logger.error("======encod error======" + xiaoQu.getAddress());
            e.printStackTrace();
        }
    }

    public ClassType getClassType(Integer skTypeId) {

        if (skTypeId == null)
            return null;
        List<SkTypeRule> rules = super.getModelDao().find("From SkTypeRule where typeId3 = ? ", skTypeId);
        if (rules.size() == 0) {
            return null;
        }

        return (ClassType) super.getModelDao().findFist("From ClassType where name = ? ", rules.get(0).getRealType2());

    }

    static boolean updateOldRecord = true;

    public void persistWithSwitch(AbstractPersistence exist, AbstractPersistence newObj) {
        if (exist == null) this.getModelDao().persistAbstract(newObj);
        else if (updateOldRecord) {
            try {
                Integer id = exist.getId();
                BeanUtils.copyProperties(exist, newObj);
                exist.setId(id);
            } catch (Exception e) {
                logger.error(exist.getId() + "=================exception===================================" + e.getMessage());
                return;
            }
            this.getModelDao().persistAbstract(exist);
        }
    }

    public void run() {

        try {
            saveSchool();
        } catch (Exception e) {
            e.printStackTrace(); //To change body of catch statement use File | Settings | File Templates.
        }
    }
}
