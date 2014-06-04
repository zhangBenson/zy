package com.gogowise.urlfetch.sk;

import com.gogowise.rep.AbstractPersistence;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class ClassXiaoQu extends AbstractPersistence {
    @ManyToOne
    private ClassInfoSk classInfoSk;
    @ManyToOne
    private XiaoQu xiaoQu;

    public ClassInfoSk getClassInfoSk() {

        return classInfoSk;
    }

    public void setClassInfoSk(ClassInfoSk classInfoSk) {

        this.classInfoSk = classInfoSk;
    }

    public XiaoQu getXiaoQu() {

        return xiaoQu;
    }

    public void setXiaoQu(XiaoQu xiaoQu) {

        this.xiaoQu = xiaoQu;
    }
}
