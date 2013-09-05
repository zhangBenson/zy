package com.gogowise.dao;

import com.gogowise.domain.Comments;
import com.gogowise.domain.Pagination;

import java.util.List;

public interface CommentsDao extends ModelDao<Comments>{

    public List<Comments> findByCommentTo(Integer userId, Pagination page);
}
