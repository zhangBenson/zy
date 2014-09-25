package com.gogowise.rep.user.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.Pagination;

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

    public List<BaseUser> findHotTeacher(Pagination pagination);

    public List<BaseUser> findByFansNum(Pagination pagination);

    public List<BaseUser> searchUsers(String searchStr, Pagination pagination);
}
