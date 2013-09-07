package com.gogowise.domain.user;


import com.gogowise.domain.AbstractPersistence;
import com.gogowise.domain.user.BaseUser;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import java.util.Calendar;


@Entity
public class UserEvent extends AbstractPersistence {

    @OneToOne
    private BaseUser owner;
    private String disPlayMessage;
    private String actionLink;
    private Calendar createDate = Calendar.getInstance();
    private  Integer eventType;

    private String messageProperty1;
    private String messageProperty2;
    private String messageProperty3;
    private String messageProperty4;
    private String messageProperty5;


    public BaseUser getOwner() {
        return owner;
    }

    public void setOwner(BaseUser owner) {
        this.owner = owner;
    }

    public String getDisPlayMessage() {
        return disPlayMessage;
    }

    public void setDisPlayMessage(String disPlayMessage) {
        this.disPlayMessage = disPlayMessage;
    }

    public String getActionLink() {
        return actionLink;
    }

    public void setActionLink(String actionLink) {
        this.actionLink = actionLink;
    }

    public Calendar getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Calendar createDate) {
        this.createDate = createDate;
    }

    public String getMessageProperty1() {
        return messageProperty1;
    }

    public void setMessageProperty1(String messageProperty1) {
        this.messageProperty1 = messageProperty1;
    }

    public String getMessageProperty2() {
        return messageProperty2;
    }

    public void setMessageProperty2(String messageProperty2) {
        this.messageProperty2 = messageProperty2;
    }

    public String getMessageProperty3() {
        return messageProperty3;
    }

    public void setMessageProperty3(String messageProperty3) {
        this.messageProperty3 = messageProperty3;
    }

    public String getMessageProperty4() {
        return messageProperty4;
    }

    public void setMessageProperty4(String messageProperty4) {
        this.messageProperty4 = messageProperty4;
    }

    public String getMessageProperty5() {
        return messageProperty5;
    }

    public void setMessageProperty5(String messageProperty5) {
        this.messageProperty5 = messageProperty5;
    }

    public Integer getEventType() {
        return eventType;
    }

    public void setEventType(Integer eventType) {
        this.eventType = eventType;
    }
}
