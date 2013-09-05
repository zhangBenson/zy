package com.gogowise.dao;

import com.gogowise.domain.LiveChannelComment;
import com.gogowise.domain.Pagination;

import java.util.List;


public interface LiveChannelCommentDao extends ModelDao<LiveChannelComment>{

    public List<LiveChannelComment> findByChannelID(Integer channelID ,Pagination pagination);
}
