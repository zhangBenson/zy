package com.gogowise.dao.org;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.OrgMaterial;
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
