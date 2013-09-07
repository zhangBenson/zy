package com.gogowise.rep.user;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.competition.enity.CompetitionSession;
import com.gogowise.rep.competition.enity.InviteRelationship;
import com.gogowise.rep.user.user.BaseUser;
import com.gogowise.rep.user.user.UserRelationship;
import com.gogowise.common.utils.MD5;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-9-29
 * Time: 下午1:06
 * To change this template use File | Settings | File Templates.
 */
@Repository("inviteRelationshipDao")
public class InviteRelationshipDaoImpl extends ModelDaoImpl<InviteRelationship> implements InviteRelationshipDao {

    private UserRelationshipDao userRelationshipDao;
    private BaseUserDao baseUserDao;

    public List<InviteRelationship> queryRelationByUserId(int id, Pagination page) {
        return this.findByHql("From InviteRelationship r where r.inviteder.id=" + id);
//       return c.list();
    }

    public void inviteUser(BaseUser inviter, BaseUser user, CompetitionSession competitionSession) {
        //TODO: 有问题米有？？？？
        InviteRelationship relationship = new InviteRelationship();
        relationship.setInviter(inviter);
        relationship.setInviteder(user);
        relationship.setInvitedCode(MD5.endCode(String.valueOf(System.currentTimeMillis())));
        relationship.setCompetitionSessionId(competitionSession);
        this.persistAbstract(relationship);
    }

    public void inviteUsers(BaseUser inviter, List<BaseUser> users, CompetitionSession competitionSession) {
        for (BaseUser user : users) {
            inviteUser(inviter, user, competitionSession);
        }
    }

    public UserRelationship queryUserRelationshipByCode(String code) {
        return userRelationshipDao.queryUserRelationshipByCode(code);
    }

    public void addFriend(Integer inviter, Integer userId) {
        userRelationshipDao.addFriend(inviter, userId);
    }

    public void addUnknownFriends(Integer inviter, String invitedCode) {
        userRelationshipDao.addUnknownFriends(inviter, invitedCode);
    }

    public void save(InviteRelationship relationship) {
        this.persistAbstract(relationship);
    }

    public void update(InviteRelationship relationship) {
        this.persistAbstract(relationship);
    }

    public Boolean isAlreadyInvite(Integer inviter, Integer userId) {
        List<InviteRelationship> list = this.find("From InviteRelationship invite where invite.inviter.id=?and invite.inviteder.id=?", inviter, userId);
        return list.size() > 0;
    }

    public InviteRelationship queryByInvitedCode(String invitedCode) {
        List<InviteRelationship> relationships = this.find("From InviteRelationship r where r.invitedCode = ?", invitedCode);
        if (relationships.size() != 0) {
            return relationships.get(0);
        }
        return null;
    }


    public UserRelationshipDao getUserRelationshipDao() {
        return userRelationshipDao;
    }

    public void setUserRelationshipDao(UserRelationshipDao userRelationshipDao) {
        this.userRelationshipDao = userRelationshipDao;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }
}
