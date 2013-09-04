package com.gogowise.dao.live;

import com.gogowise.dao.ModelDao;
import com.gogowise.dao.live.LiveChannelDao;
import com.gogowise.domain.Pagination;
import com.gogowise.domain.ShowComment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("showCommentDao")
public class ShowCommentDaoImpl extends ModelDao.ModelDaoImpl<ShowComment> implements LiveChannelDao.ShowCommentDao {

    public List<ShowComment> findByShow(Integer showID, Pagination pagination) {
        String hql = "From ShowComment sc where sc.show.id=? order by sc.commentTime desc";
        return this.find(hql,pagination,showID);
    }

}
