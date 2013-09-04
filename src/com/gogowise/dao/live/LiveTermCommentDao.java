package com.gogowise.dao.live;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.LiveTermComment;
import com.gogowise.domain.Pagination;
import com.gogowise.domain.ValidUser;

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

    /**
     * Created by IntelliJ IDEA.
     * User: AN
     * Date: 12-11-16
     * Time: 下午9:41
     * To change this template use File | Settings | File Templates.
     */
    interface ValidUserDao  extends ModelDao<ValidUser>{
           public List<ValidUser>  findAll();

    }
}
