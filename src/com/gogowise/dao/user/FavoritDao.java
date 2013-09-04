package com.gogowise.dao.user;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.Favorite;
import com.gogowise.domain.Pagination;
import com.gogowise.domain.UserRelationship;
import com.gogowise.domain.UserTask;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface FavoritDao extends ModelDao<Favorite> {

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 11-10-1
     * Time: 上午11:15
     * To change this template use File | Settings | File Templates.
     */
    interface UserRelationshipDao {
        public List<UserRelationship> queryFriendsByUserId(int id, Pagination page);

        public void addFriend(Integer inviter, Integer userId);

        public UserRelationship queryUserRelationshipByCode(String code);

        public void addUnknownFriends(Integer inviter, String invitedCode);
    }

    interface UserTaskDao extends ModelDao<UserTask>{
        public void closeTask(Integer taskId);

        public void createTask(UserTask userTask);
    }

    @Repository("favoriteDao")
    class FavoriteDaoImpl extends ModelDaoImpl<Favorite> implements FavoritDao {


    }
}
