package com.gogowise.dao.live;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.MyShow;
import com.gogowise.domain.Pagination;
import com.gogowise.domain.ShowFans;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-6-13
 * Time: 下午1:21
 * To change this template use File | Settings | File Templates.
 */
public interface ShowFansDao extends ModelDao<ShowFans> {

    public List<ShowFans> findByShow(Integer showId ,Pagination pagination);

    public ShowFans findByUserAndShow(Integer userID, Integer showID);
}
