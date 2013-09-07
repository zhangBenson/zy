package com.gogowise.rep.system;

import com.gogowise.rep.ModelDao;
import com.gogowise.domain.live.Matter;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-6-16
 * Time: 下午3:46
 * To change this template use File | Settings | File Templates.
 */
public interface MatterDao extends ModelDao<Matter> {
    public List<Matter> findByToEmail(String toEmail);
    public Integer getMatterCount(String toEmail);
    public Matter findBySerialNo(String serialNo);
}