package com.gogowise.rep.android;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.android.enity.SerialNO;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-12-6
 * Time: 下午5:23
 * To change this template use File | Settings | File Templates.
 */
public interface SerialNoDao extends ModelDao<SerialNO> {
     public SerialNO findBySerialNum(String serialNum);
}
