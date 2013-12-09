package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.user.enity.Comments;
import com.gogowise.rep.Pagination;

import java.util.List;

public interface CommentsDao extends ModelDao<Comments> {

    public List<Comments> findByCommentTo(Integer userId, Pagination page);
}
