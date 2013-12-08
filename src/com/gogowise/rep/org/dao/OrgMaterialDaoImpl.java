package com.gogowise.rep.org.dao;


import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.org.enity.OrgMaterial;
import com.gogowise.rep.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("orgMaterialDao")
public class OrgMaterialDaoImpl extends ModelDaoImpl<OrgMaterial> implements OrgMaterialDao {


     public List<OrgMaterial> findByOrgId(Pagination pagination, Integer oid) {
        return this.find("From OrgMaterial om where om.organization.id=? order by om.provideTime desc",pagination,oid);
    }
}
