package com.gogowise.rep.org;

import com.gogowise.rep.ModelService;
import com.gogowise.rep.user.enity.BaseUser;

import java.util.List;

public interface OrgService extends ModelService {

    public boolean confirmOrgTeacher(Integer userId, Integer orgId);

    public boolean confirmedOtherOrg(Integer userId, Integer orgId);
}
