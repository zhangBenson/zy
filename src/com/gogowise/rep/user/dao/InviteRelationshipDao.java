package com.gogowise.rep.user.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.competition.enity.CompetitionSession;
import com.gogowise.rep.competition.enity.InviteRelationship;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.user.enity.UserRelationship;

import java.util.List;
/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-9-29
 * Time: 下午1:01
 * To change this template use File | Settings | File Templates.
 */
public interface InviteRelationshipDao extends ModelDao<InviteRelationship> {
    public List<InviteRelationship>  queryRelationByUserId(int id,Pagination page);
    public void inviteUser(BaseUser inviter,BaseUser user,CompetitionSession competitionSession);
    public void inviteUsers(BaseUser inviter,List<BaseUser> users,CompetitionSession competitionSession);
    public void save(InviteRelationship relationship);
    public InviteRelationship queryByInvitedCode(String invitedCode);
    public void update(InviteRelationship relationship);
    public Boolean isAlreadyInvite(Integer inviter,Integer userId);//judge a user is already invited
    public void addFriend(Integer inviter,Integer userId);
    public UserRelationship queryUserRelationshipByCode(String code);
    public void addUnknownFriends(Integer inviter,String invitedCode);
}
