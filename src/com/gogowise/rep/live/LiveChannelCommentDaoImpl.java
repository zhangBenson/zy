package com.gogowise.rep.live;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.live.enity.LiveChannelComment;
import com.gogowise.rep.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("liveChannelCommentDao")
public class LiveChannelCommentDaoImpl extends ModelDaoImpl<LiveChannelComment> implements LiveChannelCommentDao{

    public List<LiveChannelComment> findByChannelID(Integer channelID ,Pagination pagination) {
        String hql = "From LiveChannelComment lcc where lcc.liveChannel.id=? order by lcc.id desc";
        return this.find(hql,pagination,channelID);
    }
}
