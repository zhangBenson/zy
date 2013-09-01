package com.gogowise.domain;


import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;


@Entity
public class SingUpInfo extends AbstractPersistence {
    private Long cellPhone;


    private String blogUrl;
    private String description;
//    @OneToOne
//    private CompetitionSession regedCompetitionSession;
    @ManyToOne
    private BaseUser user;
    @OneToOne
    private SingUpRole role;
    private Integer status;
    private Integer type;

    private String phone;
    private Integer singType;
    private Integer age;
    private Long qq;
    private String address;
    private String interest;
    private String enounce;
    private String comments;


    public Long getCellPhone() {
        return cellPhone;
    }

    public void setCellPhone(Long cellPhone) {
        this.cellPhone = cellPhone;
    }



    public String getBlogUrl() {
        return blogUrl;
    }

    public void setBlogUrl(String blogUrl) {
        this.blogUrl = blogUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public SingUpRole getRole() {
        return role;
    }

    public void setRole(SingUpRole role) {
        this.role = role;
    }

//    public CompetitionSession getRegedCompetitionSession() {
//        return regedCompetitionSession;
//    }
//
//    public void setRegedCompetitionSession(CompetitionSession regedCompetitionSession) {
//        this.regedCompetitionSession = regedCompetitionSession;
//    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }



    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getSingType() {
        return singType;
    }

    public void setSingType(Integer singType) {
        this.singType = singType;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Long getQq() {
        return qq;
    }

    public void setQq(Long qq) {
        this.qq = qq;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getInterest() {
        return interest;
    }

    public void setInterest(String interest) {
        this.interest = interest;
    }

    public String getEnounce() {
        return enounce;
    }

    public void setEnounce(String enounce) {
        this.enounce = enounce;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }
}
