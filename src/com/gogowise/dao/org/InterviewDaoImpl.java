package com.gogowise.dao.org;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.*;
import org.springframework.stereotype.Repository;

import java.util.Calendar;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-4-1
 * Time: 上午10:36
 * To change this template use File | Settings | File Templates.
 */
@Repository("interviewDao")
public class InterviewDaoImpl extends ModelDao.ModelDaoImpl<Interview> implements ChangeResponserHistoryDao.InterviewDao {

    public List<Interview> findByUser(Integer uid,Pagination pagination) {
        String hql = "select distinct i From Interview i join i.interviewAppointers ir where i.startTime>? and ( i.interviewer.id=? or ir.interviewee.id=?) order by i.startTime asc";
        Calendar calendar = Calendar.getInstance();
       // calendar.add(Calendar.HOUR_OF_DAY,-1);
        calendar.add(Calendar.MINUTE,-30);
        return this.find(hql,pagination,calendar,uid,uid);

    }

    @Repository("organizationTeacherDao")
    public static class OrganizationTeacherDaoImpl extends ModelDaoImpl<OrganizationTeacher> implements ChangeResponserHistoryDao.OrganizationTeacherDao {
         public List<OrganizationTeacher> find(Integer orgId,Pagination pagination){
             return  this.find("From OrganizationTeacher ot where ot.org.id = ? order by ot.id desc", pagination,orgId);
         }

    }

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 12-10-8
     * Time: 上午11:25
     * To change this template use File | Settings | File Templates.
     */
    @Repository("orgFansDao")
    public static class OrgFansDaoImpl extends ModelDaoImpl<OrgFans> implements ChangeResponserHistoryDao.OrgFansDao {

        public OrgFans findByOrgAndUser(Integer orgID, Integer fansID) {
            String hql = "From OrgFans ofs where ofs.organization.id = ? and ofs.fan.id = ?";
            return this.findFist(hql,orgID ,fansID);
        }

    }

    @Repository("orgMaterialDao")
    public static class OrgMaterialDaoImpl extends ModelDaoImpl<OrgMaterial> implements ChangeResponserHistoryDao.OrgMaterialDao {


         public List<OrgMaterial> findByOrgId(Pagination pagination, Integer oid) {
            return this.find("From OrgMaterial om where om.organization.id=? order by om.provideTime desc",pagination,oid);
        }
    }

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 12-4-19
     * Time: 上午11:57
     * To change this template use File | Settings | File Templates.
     */
    @Repository("orgMeetingDao")
    public static class OrgMeetingDaoImpl extends ModelDaoImpl<OrgMeeting> implements ChangeResponserHistoryDao.OrgMeetingDao {

        public List<OrgMeeting> findForUserCenter(Pagination pagination, Integer uid) {
            String hql = "select distinct om From OrgMeeting om left join om.orgMeetingMembers omm where om.startTime>? and (om.hostMan.id = ? or omm.member.id = ?) order by om.startTime asc";
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.HOUR_OF_DAY,-1);
            calendar.add(Calendar.MINUTE,-20);
            return this.find(hql,pagination,calendar,uid,uid);
        }
    }

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 12-4-19
     * Time: 上午11:59
     * To change this template use File | Settings | File Templates.
     */
    @Repository("orgMeetingMemberDao")
    public static class OrgMeetingMemberDaoImpl extends ModelDaoImpl<OrgMeetingMember> implements ChangeResponserHistoryDao.OrgMeetingMemberDao {

        public List<OrgMeetingMember> findByMeeting(Integer mid) {
            return this.find("From OrgMeetingMember omm where omm.orgMeeting.id = ?",mid);
        }
    }
}
