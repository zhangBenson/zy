package com.gogowise.rep.tag.dao;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.tag.enity.Tag;
import com.gogowise.rep.user.enity.BaseUserRoleType;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-15 15:16
 * Email: jhji@ir.hit.edu.cn
 */
@Repository("tagDao")
public class TagDaoImpl extends ModelDaoImpl<Tag> implements TagDao
{
    @Override
    public List<Tag> findByNameLikely(String name){
        String hql = "From Tag t where t.name like ? ";
        return  this.find(hql, "%" + name + "%");
    }

    public Tag findByName(String name){
        String hql = "From Tag t where t.name = ? ";
        return  this.findFist(hql, name );
    }

    @Override
    public List<Tag> findAll() {
        String hql = "From Tag";
        return this.find(hql);
    }
}
