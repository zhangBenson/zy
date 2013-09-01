package com.gogowise.domain;

import org.hibernate.envers.Audited;

import javax.persistence.Entity;
import javax.persistence.OneToOne;


@Entity
public class UserAccountInfo extends  AbstractPersistence{
    @OneToOne
    private BaseUser user;
    @Audited
    private String bankAccount;
    @Audited
    private String bankName;
    @Audited
    private String disposeName;
    @Audited
    private Double zhiBi = 0.000;
    @Audited
    private Double availableZhiBi = 0.000;
    @Audited
    private Double zhiQuan = 0.000;

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public String getBankAccount() {
        return bankAccount;
    }

    public void setBankAccount(String bankAcount) {
        this.bankAccount = bankAcount;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getDisposeName() {
        return disposeName;
    }

    public void setDisposeName(String disposeName) {
        this.disposeName = disposeName;
    }

    public Double getZhiBi() {
        if (zhiBi == null) return 0.000;
        return zhiBi;
    }

    public void setZhiBi(Double zhiBi) {
        this.zhiBi = zhiBi;
    }

    public Double getZhiQuan() {
        if (zhiQuan == null) return 0.000;
        return zhiQuan;
    }

    public void setZhiQuan(Double zhiQuan) {
        this.zhiQuan = zhiQuan;
    }

    public Double getAvailableZhiBi() {
        if (availableZhiBi == null) return 0.000;
        return availableZhiBi;
    }

    public void setAvailableZhiBi(Double availableZhiBi) {
        this.availableZhiBi = availableZhiBi;
    }
}
