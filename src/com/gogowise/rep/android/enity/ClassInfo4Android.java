package com.gogowise.rep.android.enity;

import com.gogowise.rep.AbstractPersistence;

/**
 * Created with IntelliJ IDEA.
 * User: AN
 * Date: 13-4-6
 * Time: 下午8:14
 * To change this template use File | Settings | File Templates.
 */
public class ClassInfo4Android extends AbstractPersistence {
    private Integer id;
    private String name;
    private String introduce ;
    private Float price;
    private String schoolName;
    private Integer schoolId;
    private String schoolLogoUrl;

    private String classType;
    private String parentType;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public Integer getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(Integer schoolId) {
        this.schoolId = schoolId;
    }

    public String getSchoolLogoUrl() {
        return schoolLogoUrl;
    }

    public void setSchoolLogoUrl(String schoolLogoUrl) {
        this.schoolLogoUrl = schoolLogoUrl;
    }

    public String getClassType() {
        return classType;
    }

    public void setClassType(String classType) {
        this.classType = classType;
    }

    public String getParentType() {
        return parentType;
    }

    public void setParentType(String parentType) {
        this.parentType = parentType;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
