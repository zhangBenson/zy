package com.gogowise.rep.org;

import com.gogowise.rep.ModelDao;
import com.gogowise.domain.user.BaseUser;
import com.gogowise.domain.org.Organization;
import com.gogowise.domain.org.OrganizationHistory;

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
