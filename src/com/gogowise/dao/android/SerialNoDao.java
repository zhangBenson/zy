package com.gogowise.dao.android;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.SerialNO;

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
