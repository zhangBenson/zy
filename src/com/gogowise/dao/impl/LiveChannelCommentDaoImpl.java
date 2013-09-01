package com.gogowise.dao.impl;

import com.gogowise.dao.LiveChannelCommentDao;
import com.gogowise.domain.LiveChannelComment;
import com.gogowise.domain.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("liveChannelCommentDao")
public class LiveChannelCommentDaoImpl extends ModelDaoImpl<LiveChannelComment> implements LiveChannelCommentDao{

    public List<LiveChannelComment> findByChannelID(Integer channelID ,Pagination pagination) {
        String hql = "From LiveChannelComment lcc where lcc.liveChannel.id=? order by lcc.id desc";
        return this.find(hql,pagination,channelID);
    }
}
