package com.gogowise.rep.user.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.user.enity.BaseUser;

/**
 * Created by IntelliJ IDEA.
 * User: Benson
 * Date: 11-8-7
 * Time: 下午8:23
 * To change this template use File | Settings | File Templates.
 */
public interface BaseUserDao extends ModelDao<BaseUser> {

    BaseUser findByEmail(String email);

    BaseUser findByEmailOrTelPhone(String email, String telPhone);

    BaseUser findByNickName(String nickName);

    BaseUser logon(String email, String password);

}
