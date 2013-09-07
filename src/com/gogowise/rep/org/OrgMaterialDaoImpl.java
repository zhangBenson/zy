package com.gogowise.rep.org;


import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.domain.org.OrgMaterial;
import com.gogowise.domain.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("orgMaterialDao")
public class OrgMaterialDaoImpl extends ModelDaoImpl<OrgMaterial> implements OrgMaterialDao {


     public List<OrgMaterial> findByOrgId(Pagination pagination, Integer oid) {
        return this.find("From OrgMaterial om where om.organization.id=? order by om.provideTime desc",pagination,oid);
    }
}
