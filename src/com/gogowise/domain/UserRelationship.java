package com.gogowise.domain;

import javax.persistence.*;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-10-1
 * Time: 上午10:51
 * To change this template use File | Settings | File Templates.
 * 用户关系表 表示两者的关系   好友关系 等等
 */
@Entity
public class UserRelationship  extends  AbstractPersistence{


    @OneToOne
    private BaseUser user;
    @OneToOne
    private  BaseUser userFriend;

    private String validateCode;      //invited friend use it

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public BaseUser getUserFriend() {
        return userFriend;
    }

    public void setUserFriend(BaseUser userFriend) {
        this.userFriend = userFriend;
    }

    public String getValidateCode() {
        return validateCode;
    }

    public void setValidateCode(String validateCode) {
        this.validateCode = validateCode;
    }
}
