package com.gogowise.rep.org.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.org.enity.OrgFans;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-10-8
 * Time: 上午11:24
 * To change this template use File | Settings | File Templates.
 */
public interface OrgFansDao extends ModelDao<OrgFans> {

    public OrgFans findByOrgAndUser(Integer orgID,Integer fansID);

}
