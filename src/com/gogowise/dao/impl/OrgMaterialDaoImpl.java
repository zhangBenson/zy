package com.gogowise.dao.impl;


import com.gogowise.domain.OrgMaterial;
import com.gogowise.domain.Pagination;
import org.springframework.stereotype.Repository;
import com.gogowise.dao.OrgMaterialDao;

import java.util.List;

@Repository("orgMaterialDao")
public class OrgMaterialDaoImpl extends ModelDaoImpl<OrgMaterial> implements OrgMaterialDao {


     public List<OrgMaterial> findByOrgId(Pagination pagination, Integer oid) {
        return this.find("From OrgMaterial om where om.organization.id=? order by om.provideTime desc",pagination,oid);
    }
}
