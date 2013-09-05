package com.gogowise.dao.impl;

import com.gogowise.dao.CommentsDao;
import com.gogowise.domain.Comments;
import com.gogowise.domain.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("commentsDao")
public class CommentsDaoImpl extends ModelDaoImpl<Comments> implements CommentsDao {
       public List<Comments> findByCommentTo(Integer userId, Pagination page) {
           String hql = "select c from Comments c where c.to.id = ? order by c.id desc ";
           return this.find(hql, page, userId);
       }

}
