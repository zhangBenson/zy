package com.gogowise.rep.course;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.user.enity.Comments;
import com.gogowise.rep.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("commentsDao")
public class CommentsDaoImpl extends ModelDaoImpl<Comments> implements CommentsDao {
       public List<Comments> findByCommentTo(Integer userId, Pagination page) {
           String hql = "select c from Comments c where c.to.id = ? order by c.id desc ";
           return this.find(hql, page, userId);
       }

}
