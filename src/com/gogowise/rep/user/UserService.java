package com.gogowise.rep.user;

import com.gogowise.rep.ModelService;
import com.gogowise.rep.user.enity.BaseUser;

public interface UserService extends ModelService {

    public void grantPermission(BaseUser owner, String permission);

    public void removePermission(BaseUser owner, String permission);

    public Boolean havePermission(Integer userId, String roleName);

    public void regUser(BaseUser user, String roleType);
}
