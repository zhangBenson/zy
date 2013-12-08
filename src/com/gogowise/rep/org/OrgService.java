package com.gogowise.rep.org;

import com.gogowise.rep.ModelService;
import com.gogowise.rep.user.enity.BaseUser;

import java.util.List;

public interface OrgService extends ModelService {

    public List<BaseUser> findAllTeachersForOrg(Integer orgId);
}
