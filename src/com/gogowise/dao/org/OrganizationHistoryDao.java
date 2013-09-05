package com.gogowise.dao.org;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.BaseUser;
import com.gogowise.domain.Organization;
import com.gogowise.domain.OrganizationHistory;

/**
 * Created by IntelliJ IDEA.
 * User: Benson
 * Date: 11-8-7
 * Time: 下午8:23
 * To change this template use File | Settings | File Templates.
 */
public interface OrganizationHistoryDao extends ModelDao<OrganizationHistory> {

    public void addHistory(OrganizationHistory history);

    public BaseUser findAgentByResponser(Integer resId);

    public void addHistory(Organization organization);
}
