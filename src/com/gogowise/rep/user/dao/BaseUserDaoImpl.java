package com.gogowise.rep.user.dao;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.user.enity.BaseUser;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Benson
 * Date: 11-8-7
 * Time: 下午8:23
 * To change this template use File | Settings | File Templates.
 */
@Repository("baseUserDao")
public class BaseUserDaoImpl extends ModelDaoImpl<BaseUser> implements BaseUserDao {

    public BaseUser logon(String email, String password) {
        Criteria c = this.createCriteria(BaseUser.class).add(Restrictions.eq("email", email))
                .add(Restrictions.eq("password", password));
        List<BaseUser> bus = c.list();
        if (bus.size() == 0) return null;
        return bus.get(0);
    }

    public BaseUser findByEmail(String email) {
        return findFist("From BaseUser u where u.email=?", email);
    }

    public BaseUser findByEmailOrTelPhone(String email, String telPhone) {
        return findFist("From BaseUser u where u.email=? or u.telphone = ?", email, telPhone);
    }

    public BaseUser findByNickName(String nickName) {
        return findFist("From BaseUser u where u.nickName=?", nickName);
    }


}
