package com.gogowise.rep.live;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.live.live.LiveTermComment;
import com.gogowise.rep.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("liveTermCommentDao")
public class LiveTermCommentDaoImpl extends ModelDaoImpl<LiveTermComment> implements LiveTermCommentDao{

    public List<LiveTermComment> findByTermsID(Integer termsID, Pagination pagination) {
        String hql = "From LiveTermComment ltc where ltc.channelTerms.id=? order by ltc.commentTime desc ,ltc.id desc";
        return this.find(hql,pagination,termsID);
    }
}
