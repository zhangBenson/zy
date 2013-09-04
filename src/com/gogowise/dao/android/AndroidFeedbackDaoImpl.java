package com.gogowise.dao.android;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-10-4
 * Time: 下午5:30
 * To change this template use File | Settings | File Templates.
 */

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.AndroidFeedback;
import com.gogowise.domain.BaseUser;
import com.gogowise.domain.MonitorAuthorize;
import com.gogowise.domain.SerialNO;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository("androidFeedbackDao")
public class AndroidFeedbackDaoImpl extends ModelDao.ModelDaoImpl<AndroidFeedback> implements AndroidFeedbackDao{
   public void saveAndroidFeedback(AndroidFeedback androidFeedback){
          if(androidFeedback!=null){
              this.persistAbstract(androidFeedback);
          }
   }


    /**
     * Created by IntelliJ IDEA.
     * User: AN
     * Date: 12-12-7
     * Time: 上午10:42
     * To change this template use File | Settings | File Templates.
     */
    public static interface MonitorAuthorizeDao extends ModelDao<MonitorAuthorize> {
        public List<MonitorAuthorize> findByAuthorize(BaseUser authorize);
        public List<MonitorAuthorize> findByAuthorizeTo(BaseUser authorizeTo);
        public MonitorAuthorize findByAuthorizeToEamil(String email);
        public MonitorAuthorize findByAuthorizeAndAuthorizeToEamil(BaseUser authorize, String authorizeToEamil);
        public boolean cancelAuthorize(BaseUser authorize, BaseUser authorzieTo);
        public boolean cancelAuthorize(BaseUser authorize, String authorzieToEmail);
    }

    /**
     * Created by IntelliJ IDEA.
     * User: AN
     * Date: 12-12-6
     * Time: 下午5:23
     * To change this template use File | Settings | File Templates.
     */
    public static interface SerialNoDao extends ModelDao<SerialNO>{
         public SerialNO findBySerialNum(String serialNum);
    }
}
