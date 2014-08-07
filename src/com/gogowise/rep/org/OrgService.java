package com.gogowise.rep.org;

import com.gogowise.rep.ModelService;
import com.gogowise.rep.org.enity.Organization;

public interface OrgService extends ModelService {

    public boolean confirmOrgTeacher(Integer userId, Integer orgId);

    public boolean confirmedOtherOrg(Integer userId, Integer orgId);


    public Organization findMyOrg(Integer userId);

    public boolean isMember(Integer userId, Integer orgId);

}
