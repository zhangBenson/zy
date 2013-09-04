package com.gogowise.dao.user;


import com.gogowise.dao.ModelDao;
import com.gogowise.dao.live.LiveChannelDao;
import com.gogowise.dao.live.LiveChannelNewEventDao;
import com.gogowise.domain.*;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface BaseUserRoleTypeDao extends ModelDao<BaseUserRoleType> {
    public List<BaseUserRoleType> findByUserId(Integer userId);
    public Boolean havePermission(Integer userId, String roleName);

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 11-11-3
     * Time: 上午9:45
     * To change this template use File | Settings | File Templates.
     */
    interface UserAccountInfoDao extends ModelDao<UserAccountInfo> {
        public UserAccountInfo findByUserId(Integer id);
    }

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 11-11-3
     * Time: 上午9:53
     * To change this template use File | Settings | File Templates.
     */
    @Repository("userAccountInfoDao")
    class UserAccountInfoDaoImpl extends ModelDaoImpl<UserAccountInfo> implements UserAccountInfoDao {
        private UserAccountInfoDao userAccountInfoDao;
        private BaseUserDao baseUserDao;
        public UserAccountInfo findByUserId(Integer id) {
            List<UserAccountInfo> list =  this.find("select uc from UserAccountInfo uc where uc.user.id = ?", id);
            if (list.size() > 0 )   return list.get(0);
            UserAccountInfo userAccountInfo =  new UserAccountInfo();
            userAccountInfo.setUser( baseUserDao.findById(id));
            userAccountInfoDao.persistAbstract(userAccountInfo);
            return userAccountInfo;
        }

        public BaseUserDao getBaseUserDao() {
            return baseUserDao;
        }

        public void setBaseUserDao(BaseUserDao baseUserDao) {
            this.baseUserDao = baseUserDao;
        }

        public UserAccountInfoDao getUserAccountInfoDao() {
            return userAccountInfoDao;
        }

        public void setUserAccountInfoDao(UserAccountInfoDao userAccountInfoDao) {
            this.userAccountInfoDao = userAccountInfoDao;
        }
    }

    @Repository("userFansDao")
    class UserFansDaoImpl extends ModelDaoImpl<UserFans> implements UserFansDao{
        public UserFans findByUserAndFans(Integer userID, Integer fanID) {
            String hql = "From UserFans uf where uf.user.id=? and uf.fan.id=?";
            return this.findFist(hql, userID, fanID);
        }

        public List<UserFans> findAllFansForUser(Integer userID,Pagination pagination) {
            String hql = "From UserFans uf where uf.user.id=? order by uf.id asc";
            return this.find(hql,pagination ,userID);
        }

        public List<UserFans> findUsersAsFans(Integer fansID, Pagination pagination) {
            String hql = "From UserFans uf where uf.fan.id=?";
            return this.find(hql,pagination ,fansID);
        }
    }

    @Repository("userMattersDao")
    class UserMattersDaoImpl extends ModelDaoImpl<UserMatters> implements LiveChannelDao.UserMattersDao {

        public UserMatters findByUser(Integer userID) {
            String hql = "From UserMatters um where um.user.id=? and um.id=(Select max(umm.id) from UserMatters umm where umm.user.id=?) and um.viewed = false";
            return this.findFist(hql,userID,userID);
        }
    }

    @Repository("userPrivateChannelDao")
    class UserPrivateChannelDaoImpl extends ModelDaoImpl<UserPrivateChannel> implements LiveChannelNewEventDao.UserPrivateChannelDao {
        public UserPrivateChannel findByUser(Integer userID) {
            String hql = "From UserPrivateChannel upc where upc.user.id = ?";
            return this.findFist(hql,userID);
        }
    }

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 11-10-1
     * Time: 上午11:22
     * To change this template use File | Settings | File Templates.
     */
    @Repository("userRelationshipDao")
    class UserRelationShipDaoImpl extends ModelDaoImpl<UserRelationship> implements FavoritDao.UserRelationshipDao {
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

        public List<UserRelationship> queryFriendsByUserId(int id, Pagination page) {
            Criteria c = createRelationshipCriteria();
            c.add(Restrictions.eq("user.id", id));
            return c.list();
        }

        private Criteria createRelationshipCriteria() {
            Criteria c = this.getSession().createCriteria(UserRelationship.class);
            return c;
        }

        public BaseUserDao getBaseUserDao() {
            return baseUserDao;
        }

        public void setBaseUserDao(BaseUserDao baseUserDao) {
            this.baseUserDao = baseUserDao;
        }
    }

    @Repository("UserTaskDao")
    class UserTaskDaoImpl extends ModelDaoImpl<UserTask> implements FavoritDao.UserTaskDao {
         public void closeTask(Integer taskId) {
             UserTask userTask  = this.findById(taskId);
             userTask.setClosed(true);
             this.persistAbstract(userTask);
         }

        public void createTask(UserTask userTask) {
            this.persistAbstract(userTask);
        }

    }
}
