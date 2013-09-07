package com.gogowise.dao.org;

import com.gogowise.dao.ModelDaoImpl;
import com.gogowise.domain.org.OrgFans;
import org.springframework.stereotype.Repository;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-10-8
 * Time: 上午11:25
 * To change this template use File | Settings | File Templates.
 */
@Repository("orgFansDao")
public class OrgFansDaoImpl extends ModelDaoImpl<OrgFans> implements OrgFansDao{

    public OrgFans findByOrgAndUser(Integer orgID, Integer fansID) {
        String hql = "From OrgFans ofs where ofs.organization.id = ? and ofs.fan.id = ?";
        return this.findFist(hql,orgID ,fansID);
    }

}
