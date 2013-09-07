package com.gogowise.rep.live;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.live.enity.MonitorAuthorize;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-12-7
 * Time: 上午10:42
 * To change this template use File | Settings | File Templates.
 */
public interface MonitorAuthorizeDao extends ModelDao<MonitorAuthorize> {
    public List<MonitorAuthorize> findByAuthorize(BaseUser authorize);
    public List<MonitorAuthorize> findByAuthorizeTo(BaseUser authorizeTo);
    public MonitorAuthorize findByAuthorizeToEamil(String email);
    public MonitorAuthorize findByAuthorizeAndAuthorizeToEamil(BaseUser authorize,String authorizeToEamil);
    public boolean cancelAuthorize(BaseUser authorize,BaseUser authorzieTo);
    public boolean cancelAuthorize(BaseUser authorize,String authorzieToEmail);
}
