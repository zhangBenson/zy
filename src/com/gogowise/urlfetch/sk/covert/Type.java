package com.gogowise.urlfetch.sk.covert;

import com.gogowise.urlfetch.sk.ClassType;
import com.gogowise.urlfetch.sk.BaseJunitTest;
import com.gogowise.urlfetch.sk.domain.SkTypeRule;
import org.apache.commons.lang.StringUtils;
import org.junit.Test;

import java.util.List;

public class Type extends BaseJunitTest implements Runnable {

    @Test
    public void covertType() {
        List<SkTypeRule> listRule = super.getModelDao().findByHql("from SkTypeRule");
        for (SkTypeRule rule : listRule) {
            if ( (StringUtils.isBlank(rule.getRealType2()) &&StringUtils.isBlank(rule.getRealType1() )) || "realType2".equals(rule.getRealType2()) ) {
                super.getModelDao().delete(rule);
                super.getModelDao().flush();
                continue;
            }
            ClassType parentType = new ClassType();
            List<ClassType> ptypes = super.getModelDao().find("From ClassType where name =  ?", rule.getRealType1());
            if (ptypes.size() == 0) {
                parentType.setName(rule.getRealType1());
                super.getModelDao().persistAbstract(parentType);
            } else {
                if (ptypes.get(0).getParent() != null ) {
                    logger.error("=================duplicatin=====================" + rule.getRealType1());
                }
                parentType = ptypes.get(0);
            }

            ClassType type = new ClassType();
            List<ClassType> currentTypes = super.getModelDao().find("From ClassType where name =  ?", rule.getRealType2());
            if (currentTypes.size() == 0) {
                type.setName(rule.getRealType2());
                type.setParent(parentType);
                super.getModelDao().persistAbstract(type);
            } else {
                if (currentTypes.get(0).getParent() == null || rule.getRealType2().equals(currentTypes.get(0).getParent().getName())) {
                    logger.error("=================duplicatin=====================" + rule.getRealType1());
                }
            }


        }
    }





    public void run() {
        try {

        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }
}
