package com.gogowise.rep.org.enity;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.enity.BaseUser;

import javax.persistence.*;
import java.util.Calendar;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-10-24
 * Time: 下午3:09
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class Organization extends AbstractPersistence {
    @ManyToOne
    private BaseUser responsiblePerson;

    private String schoolName;
    private Integer memberSize = 0;
    private Boolean multipleOrg = false;


    private String depositBankName;
    private String depositBankAccount;
    private String depositName;

    private Calendar createDate = Calendar.getInstance();

    @Column(columnDefinition = "longtext")
    private String description;
    private String logoUrl;
    private String advUrl;
    private String businessLicenseUrl;


    private String contactName;
    private String telPhone;
    private String cellPhone;
    private String businessAddress;
    private String zipCode;
    private Boolean confirmed = false;

    private Calendar contractSignDate;
    private String contractUrl;

    private Boolean userFocused = false;  // a temp variable,used to
    private Integer fansNum = 0;

    @OneToMany(mappedBy = "org")
    private List<OrganizationTeacher> organizationTeachers;


    @ManyToOne(fetch = FetchType.LAZY)
    private BaseUser creator;

    @ManyToOne(fetch = FetchType.LAZY)
    private BaseUser reviewer;

    public BaseUser getResponsiblePerson() {
        return responsiblePerson;
    }

    public void setResponsiblePerson(BaseUser responsiblePerson) {
        this.responsiblePerson = responsiblePerson;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public Integer getMemberSize() {
        return memberSize;
    }

    public void setMemberSize(Integer memberSize) {
        this.memberSize = memberSize;
    }

    public Boolean getMultipleOrg() {
        return multipleOrg;
    }

    public void setMultipleOrg(Boolean multipleOrg) {
        this.multipleOrg = multipleOrg;
    }

    public Boolean getConfirmed() {
        return confirmed;
    }

    public void setConfirmed(Boolean confirmed) {
        this.confirmed = confirmed;
    }

    public String getDepositBankName() {
        return depositBankName;
    }

    public void setDepositBankName(String depositBankName) {
        this.depositBankName = depositBankName;
    }

    public String getDepositBankAccount() {
        return depositBankAccount;
    }

    public void setDepositBankAccount(String depositBankAccount) {
        this.depositBankAccount = depositBankAccount;
    }

    public String getDepositName() {
        return depositName;
    }

    public void setDepositName(String depositName) {
        this.depositName = depositName;
    }

    public Calendar getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Calendar createDate) {
        this.createDate = createDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public String getBusinessLicenseUrl() {
        return businessLicenseUrl;
    }

    public void setBusinessLicenseUrl(String businessLicenseUrl) {
        this.businessLicenseUrl = businessLicenseUrl;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getTelPhone() {
        return telPhone;
    }

    public void setTelPhone(String telPhone) {
        this.telPhone = telPhone;
    }

    public String getCellPhone() {
        return cellPhone;
    }

    public void setCellPhone(String cellPhone) {
        this.cellPhone = cellPhone;
    }

    public String getBusinessAddress() {
        return businessAddress;
    }

    public void setBusinessAddress(String businessAddress) {
        this.businessAddress = businessAddress;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public List<OrganizationTeacher> getOrganizationTeachers() {
        return organizationTeachers;
    }

    public void setOrganizationTeachers(List<OrganizationTeacher> organizationTeachers) {
        this.organizationTeachers = organizationTeachers;
    }

    public Calendar getContractSignDate() {
        return contractSignDate;
    }

    public void setContractSignDate(Calendar contractSignDate) {
        this.contractSignDate = contractSignDate;
    }

    public Boolean getUserFocused() {
        return userFocused;
    }

    public void setUserFocused(Boolean userFocused) {
        this.userFocused = userFocused;
    }

    public String getContractUrl() {
        return contractUrl;
    }

    public void setContractUrl(String contractUrl) {
        this.contractUrl = contractUrl;
    }

    public BaseUser getCreator() {
        return creator;
    }

    public void setCreator(BaseUser creator) {
        this.creator = creator;
    }

    public BaseUser getReviewer() {
        return reviewer;
    }

    public void setReviewer(BaseUser reviewer) {
        this.reviewer = reviewer;
    }

    public Integer getFansNum() {
        if(fansNum == null) return 0;
        return fansNum;
    }

    public void setFansNum(Integer fansNum) {
        this.fansNum = fansNum;
    }

    public String getAdvUrl() {
        return advUrl;
    }

    public void setAdvUrl(String advUrl) {
        this.advUrl = advUrl;
    }
}
