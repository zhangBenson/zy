package com.gogowise.dao.android;

import com.gogowise.dao.ModelDao;
import com.gogowise.dao.android.IEMIDao;
import com.gogowise.domain.IEMI;
import org.springframework.stereotype.Repository;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-11-21
 * Time: 上午1:20
 * To change this template use File | Settings | File Templates.
 */
@Repository("iemiDao")
public class IEMIDaoImpl extends ModelDao.ModelDaoImpl<IEMI> implements IEMIDao {
      public Boolean validIEMI(String iemiString){
          return (findFist("From IEMI i where i.iemiString=?",iemiString)==null? false:true);
      }
}
