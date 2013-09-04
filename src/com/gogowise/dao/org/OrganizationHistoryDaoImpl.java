//package com.gogowise.dao.impl;
//
//import com.gogowise.dao.user.BaseUserDao;
//import com.gogowise.dao.org.ChangeResponserHistoryDao.OrganizationHistoryDao;
//import com.gogowise.domain.BaseUser;
//import com.gogowise.domain.Organization;
//import com.gogowise.domain.OrganizationHistory;
//import org.springframework.stereotype.Repository;
//
///**
// * Created by IntelliJ IDEA.
// * User: Benson
// * Date: 11-8-7
// * Time: 下午8:23
// * To change this template use File | Settings | File Templates.
// */
//@Repository("organizationHistoryDao")
//public class OrganizationHistoryDaoImpl extends ModelDaoImpl<OrganizationHistory> implements OrganizationHistoryDao {
//    private BaseUserDao baseUserDao;
//
//    public void addHistory(OrganizationHistory history) {
//        this.persistAbstract(history);
//    }
//
//    public void addHistory(Organization organization) {
//        OrganizationHistory _history = new OrganizationHistory();
////        _history.setAgent(organization.getAgent());
//        _history.setResponser(organization.getResponsiblePerson());
//        _history.setOrganization(organization);
//        this.persistAbstract(_history);
//    }
//
//    public BaseUser findAgentByResponser(Integer resId) {
//        return null;  //To change body of implemented methods use File | Settings | File Templates.
//    }
//
//    public BaseUserDao getBaseUserDao() {
//        return baseUserDao;
//    }
//
//    public void setBaseUserDao(BaseUserDao baseUserDao) {
//        this.baseUserDao = baseUserDao;
//    }
//}
