package com.gogowise.rep.org;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.org.enity.Interview;
import com.gogowise.rep.Pagination;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-4-1
 * Time: 上午10:35
 * To change this template use File | Settings | File Templates.
 */
public interface InterviewDao extends ModelDao<Interview> {

     public List<Interview> findByUser(Integer uid,Pagination pagination);
}
