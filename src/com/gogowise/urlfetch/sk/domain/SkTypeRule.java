package com.gogowise.urlfetch.sk.domain;

import com.gogowise.urlfetch.AbstractUrlFetchPersistence;

import javax.persistence.Entity;

@Entity
public class SkTypeRule extends AbstractUrlFetchPersistence {
    private Integer typeId1;
    private String name1;
    private Integer typeId2;
    private String name2;
    private Integer typeId3;
    private String name3;
    private String realType1;
    private String realType2;


    public Integer getTypeId1() {
        return typeId1;
    }

    public void setTypeId1(Integer typeId1) {
        this.typeId1 = typeId1;
    }

    public String getName1() {
        return name1;
    }

    public void setName1(String name1) {
        this.name1 = name1;
    }

    public Integer getTypeId2() {
        return typeId2;
    }

    public void setTypeId2(Integer typeId2) {
        this.typeId2 = typeId2;
    }

    public String getName2() {
        return name2;
    }

    public void setName2(String name2) {
        this.name2 = name2;
    }

    public Integer getTypeId3() {
        return typeId3;
    }

    public void setTypeId3(Integer typeId3) {
        this.typeId3 = typeId3;
    }

    public String getName3() {
        return name3;
    }

    public void setName3(String name3) {
        this.name3 = name3;
    }

    public String getRealType1() {
        return realType1;
    }

    public void setRealType1(String realType1) {
        this.realType1 = realType1;
    }

    public String getRealType2() {
        return realType2;
    }

    public void setRealType2(String realType2) {
        this.realType2 = realType2;
    }
}
