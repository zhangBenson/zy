package com.gogowise.rep.user.dao;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.user.enity.UserRelationship;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-10-1
 * Time: 上午11:22
 * To change this template use File | Settings | File Templates.
 */
@Repository("userRelationshipDao")
public class UserRelationShipDaoImpl extends ModelDaoImpl<UserRelationship> implements UserRelationshipDao {
    private BaseUserDao baseUserDao;

    public void addFriend(Integer inviter, Integer userId) {
        List<UserRelationship> list = this.find("From UserRelationship ur where ur.user.id=? and ur.userFriend.id=?", inviter, userId);
        if (list.size() == 0) {
            UserRelationship userRelationship = new UserRelationship();
            userRelationship.setUser(baseUserDao.findById(inviter));
            userRelationship.setUserFriend(baseUserDao.findById(userId));
            this.persistAbstract(userRelationship);
        }
    }

    public UserRelationship queryUserRelationshipByCode(String code) {
        List<UserRelationship> list = this.find("From UserRelationship ur where ur.validateCode=?", code);
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }


    public void addUnknownFriends(Integer inviter, String invitedCode) {
        UserRelationship userRelationship = new UserRelationship();
        userRelationship.setUser(baseUserDao.findById(inviter));
        userRelationship.setValidateCode(invitedCode);
        this.persistAbstract(userRelationship);
    }

    @SuppressWarnings("unchecked")
    public List<UserRelationship> queryFriendsByUserId(int id, Pagination page) {
        Criteria c = createRelationshipCriteria();
        c.add(Restrictions.eq("user.id", id));
        return c.list();
    }

    private Criteria createRelationshipCriteria() {
        return this.getSession().createCriteria(UserRelationship.class);
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }
}
