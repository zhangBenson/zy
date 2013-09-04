package com.gogowise.dao.user;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("inviteRelationshipDao")
public interface InviteRelationshipDao {

        public List<InviteRelationship> queryRelationByUserId(int id, Pagination page);
        public void inviteUser(BaseUser inviter, BaseUser user, CompetitionSession competitionSession);
        public void inviteUsers(BaseUser inviter, List<BaseUser> users, CompetitionSession competitionSession);
        public void save(InviteRelationship relationship);
        public InviteRelationship queryByInvitedCode(String invitedCode);
        public void update(InviteRelationship relationship);
        public Boolean isAlreadyInvite(Integer inviter, Integer userId);//judge a user is already invited
        public void addFriend(Integer inviter, Integer userId);
        public UserRelationship queryUserRelationshipByCode(String code);
        public void addUnknownFriends(Integer inviter, String invitedCode);

}
