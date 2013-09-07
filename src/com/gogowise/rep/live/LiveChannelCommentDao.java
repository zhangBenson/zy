package com.gogowise.rep.live;

import com.gogowise.rep.ModelDao;
import com.gogowise.domain.live.LiveChannelComment;
import com.gogowise.domain.Pagination;

import java.util.List;


public interface LiveChannelCommentDao extends ModelDao<LiveChannelComment> {

    public List<LiveChannelComment> findByChannelID(Integer channelID ,Pagination pagination);
}
