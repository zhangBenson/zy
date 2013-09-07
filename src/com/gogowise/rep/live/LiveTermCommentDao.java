package com.gogowise.rep.live;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.live.enity.LiveTermComment;
import com.gogowise.rep.Pagination;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-7-23
 * Time: 下午4:20
 * To change this template use File | Settings | File Templates.
 */
public interface LiveTermCommentDao extends ModelDao<LiveTermComment> {

    public List<LiveTermComment> findByTermsID(Integer termsID,Pagination pagination);

}
