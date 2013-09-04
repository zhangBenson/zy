package com.gogowise.dao.user;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.*;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Benson
 * Date: 11-8-7
 * Time: 下午8:23
 * To change this template use File | Settings | File Templates.
 */
public interface BaseUserDao extends ModelDao<BaseUser> {

//    public void persistAbstract(BaseUser user);
    public BaseUser findByEmail(String email);
    public BaseUser findByNickName(String nickName);
    public BaseUser findByEmailAndNickName(String email, String nickName);
    public BaseUser logon(String email, String password);

    public List<BaseUser> findHotTeacher( Pagination pagination);
    public List<BaseUser> findByFansNum(Pagination pagination);
    public List<BaseUser> findHottestTeacher(Pagination pagination);

    public List<BaseUser> searchUsers(String searchStr , Pagination pagination);

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 11-9-29
     * Time: 下午1:01
     * To change this template use File | Settings | File Templates.
     */
    interface InviteRelationshipDao extends ModelDao<InviteRelationship>{
        public List<InviteRelationship>  queryRelationByUserId(int id, Pagination page);
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
}
