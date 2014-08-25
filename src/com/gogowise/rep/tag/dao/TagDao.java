package com.gogowise.rep.tag.dao;


import com.gogowise.rep.ModelDao;
import com.gogowise.rep.tag.enity.Tag;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-15 15:16
 * Email: jhji@ir.hit.edu.cn
 */
public interface TagDao extends ModelDao<Tag> {

    public Tag findByName(String name);
    public List<Tag> findByNameLikely(String name);
    public List<Tag> findAll();
}
