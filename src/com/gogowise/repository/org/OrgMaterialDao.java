package com.gogowise.repository.org;

import com.gogowise.repository.ModelDao;
import com.gogowise.domain.org.OrgMaterial;
import com.gogowise.domain.Pagination;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-5-14
 * Time: 上午1:50
 * To change this template use File | Settings | File Templates.
 */

public interface OrgMaterialDao extends ModelDao<OrgMaterial> {
     public List<OrgMaterial> findByOrgId(Pagination pagination,Integer oid);

}
