package com.gogowise.rep.org.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.org.enity.ChangeResponserHistory;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-3
 * Time: 上午9:29
 * To change this template use File | Settings | File Templates.
 */
public interface ChangeResponserHistoryDao extends ModelDao<ChangeResponserHistory> {
    public void confirmChange(String effectiveCode);
    public ChangeResponserHistory findByEffectiveCode(String effectiveCode);
}
