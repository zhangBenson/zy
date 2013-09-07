package com.gogowise.rep.live;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.live.live.LiveChannelComment;
import com.gogowise.rep.Pagination;

import java.util.List;


public interface LiveChannelCommentDao extends ModelDao<LiveChannelComment> {

    public List<LiveChannelComment> findByChannelID(Integer channelID ,Pagination pagination);
}
