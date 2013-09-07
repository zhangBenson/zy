package com.gogowise.rep.user;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.domain.user.UserMatters;
import org.springframework.stereotype.Repository;

@Repository("userMattersDao")
public class UserMattersDaoImpl extends ModelDaoImpl<UserMatters> implements UserMattersDao{

    public UserMatters findByUser(Integer userID) {
        String hql = "From UserMatters um where um.user.id=? and um.id=(Select max(umm.id) from UserMatters umm where umm.user.id=?) and um.viewed = false";
        return this.findFist(hql,userID,userID);
    }
}
