package com.gogowise.dao.live;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.Pagination;
import com.gogowise.domain.live.ShowComment;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-7-9
 * Time: 下午1:24
 * To change this template use File | Settings | File Templates.
 */
public interface ShowCommentDao extends ModelDao<ShowComment> {

    public List<ShowComment> findByShow(Integer showID,Pagination pagination);

}
