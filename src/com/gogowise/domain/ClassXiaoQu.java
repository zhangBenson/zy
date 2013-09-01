package com.gogowise.domain;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class ClassXiaoQu extends AbstractPersistence {
    @ManyToOne
    private ClassInfo classInfo;
    @ManyToOne
    private XiaoQu xiaoQu;

    public ClassInfo getClassInfo() {
        return classInfo;
    }

    public void setClassInfo(ClassInfo classInfo) {
        this.classInfo = classInfo;
    }

    public XiaoQu getXiaoQu() {
        return xiaoQu;
    }

    public void setXiaoQu(XiaoQu xiaoQu) {
        this.xiaoQu = xiaoQu;
    }
}
