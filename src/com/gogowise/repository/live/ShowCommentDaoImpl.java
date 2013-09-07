package com.gogowise.repository.live;

import com.gogowise.repository.ModelDaoImpl;
import com.gogowise.domain.Pagination;
import com.gogowise.domain.live.ShowComment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("showCommentDao")
public class ShowCommentDaoImpl extends ModelDaoImpl<ShowComment> implements ShowCommentDao{

    public List<ShowComment> findByShow(Integer showID, Pagination pagination) {
        String hql = "From ShowComment sc where sc.show.id=? order by sc.commentTime desc";
        return this.find(hql,pagination,showID);
    }

}
