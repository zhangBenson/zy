package com.gogowise.dao.live;

import com.gogowise.dao.ModelDaoImpl;
import com.gogowise.domain.user.BaseUser;
import com.gogowise.domain.live.MonitorAuthorize;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-12-7
 * Time: 上午10:43
 * To change this template use File | Settings | File Templates.
 */
@Repository("monitorAuthorizeDao")
public class MonitorAuthorizeDaoImpl extends ModelDaoImpl<MonitorAuthorize> implements MonitorAuthorizeDao{
    public List<MonitorAuthorize> findByAuthorize(BaseUser authorize){
        return this.find("From MonitorAuthorize m where m.authorize=? and m.authorizeTo != null",authorize);

    }
    public List<MonitorAuthorize> findByAuthorizeTo(BaseUser authorizeTo){
        return this.find("From MonitorAuthorize m where m.authorizeTo=? and accept=true",authorizeTo);
    }

    public MonitorAuthorize findByAuthorizeToEamil(String email){
        return this.findFist("From MonitorAuthorize m where m.monitorAuthorizeToEmail=?",email);
    }

    public MonitorAuthorize findByAuthorizeAndAuthorizeToEamil(BaseUser authorize,String authorizeToEmail){
        return this.findFist("From MonitorAuthorize m where m.monitorAuthorizeToEmail=? and m.authorize=?",authorizeToEmail,authorize);
    }

    private MonitorAuthorize findByAuthorzieAndAuthorizeTo(BaseUser authorize,BaseUser authorzieTo){
        return this.findFist("From MonitorAuthorize m where m.authorize=? and m.authorizeTo=?",authorize,authorzieTo);
    }

    public boolean cancelAuthorize(BaseUser authorize,BaseUser authorizeTo){
        MonitorAuthorize ma = this.findByAuthorzieAndAuthorizeTo(authorize,authorizeTo);
        try{
            this.delete(ma);
        }catch (Exception e){
            return false;
        }
        return true;
    }

    public boolean cancelAuthorize(BaseUser authorize,String authorzieToEmail){
        MonitorAuthorize ma = this.findByAuthorizeAndAuthorizeToEamil(authorize,authorzieToEmail);
        try{
            this.delete(ma);
        }catch (Exception e){
            return false;
        }
        return true;
    }

}
