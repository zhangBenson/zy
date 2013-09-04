package com.gogowise.dao.user;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.Pagination;
import com.gogowise.domain.UserFans;

import javax.persistence.Entity;
import java.util.List;

public interface UserFansDao extends ModelDao<UserFans> {

    public UserFans findByUserAndFans(Integer userID, Integer fanID);

    public List<UserFans> findAllFansForUser(Integer userID,Pagination pagination);

    public List<UserFans> findUsersAsFans(Integer fansID,Pagination pagination);

}
