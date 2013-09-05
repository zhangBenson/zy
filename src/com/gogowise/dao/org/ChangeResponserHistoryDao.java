package com.gogowise.dao.org;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.ChangeResponserHistory;

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
