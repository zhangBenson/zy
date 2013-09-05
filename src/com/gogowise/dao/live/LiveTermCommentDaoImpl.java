package com.gogowise.dao.live;

import com.gogowise.dao.ModelDaoImpl;
import com.gogowise.domain.LiveTermComment;
import com.gogowise.domain.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("liveTermCommentDao")
public class LiveTermCommentDaoImpl extends ModelDaoImpl<LiveTermComment> implements LiveTermCommentDao{

    public List<LiveTermComment> findByTermsID(Integer termsID, Pagination pagination) {
        String hql = "From LiveTermComment ltc where ltc.channelTerms.id=? order by ltc.commentTime desc ,ltc.id desc";
        return this.find(hql,pagination,termsID);
    }
}
