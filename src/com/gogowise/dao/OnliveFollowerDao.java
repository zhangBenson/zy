package com.gogowise.dao;

import com.gogowise.domain.OnliveFollower;
import com.gogowise.domain.Pagination;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-7-19
 * Time: 下午3:34
 * To change this template use File | Settings | File Templates.
 */
public interface OnliveFollowerDao extends ModelDao<OnliveFollower>{

    public OnliveFollower findByLiveAndUser(Integer onliveID, Integer userID);

    public List<OnliveFollower> findHottestOnlive(Pagination pagination);

    public List<OnliveFollower> findByOnlive(Integer onliveID, Pagination pagination);

}
