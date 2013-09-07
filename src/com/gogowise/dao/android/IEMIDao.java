package com.gogowise.dao.android;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.android_domain.IEMI;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-11-21
 * Time: 上午1:19
 * To change this template use File | Settings | File Templates.
 */
public interface IEMIDao  extends ModelDao<IEMI> {
    public Boolean validIEMI(String iemiString);
}
