package com.gogowise.dao.org;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.*;

import java.util.List;

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

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 12-4-1
     * Time: 下午4:46
     * To change this template use File | Settings | File Templates.
     */
    interface InterviewAppointerDao extends ModelDao<InterviewAppointer> {

        public List<InterviewAppointer> findByInterview(Integer interviewId);

        public InterviewAppointer findByInterviewAndUser(Integer interviewId, String userEmail);
    }

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 12-4-1
     * Time: 上午10:35
     * To change this template use File | Settings | File Templates.
     */
    interface InterviewDao extends ModelDao<Interview>{

         public List<Interview> findByUser(Integer uid, Pagination pagination);
    }

    interface OrganizationCommentDao extends ModelDao<OrganizationComment>{

        public List<OrganizationComment> findOrgCommentByOrgId(Integer orgId, Pagination pagination);
    }

    interface OrganizationDao extends ModelDao<Organization> {
        public void createOrganization(Organization organization);

        public Organization findOrganizationByOrganizationName(String name);

        public Organization findByAuthTeacher(Integer id);

        public Organization findConfirmedOrg(Integer userId);

        public List<BaseUser> findHotTeacherByOrgId(Integer orgId, Pagination pagination);

        public List<BaseUser> findLatestTeacherByOrgId(Integer orgId, Pagination pagination);

        public Organization findOngoingOrg(Integer userId);

        public List<Organization> findOngoingForAdmin();

        public Organization findByResId(Integer userId);

        public Organization findMyOrg(Integer userId);

        public void updateResposerInfo(BaseUser existUser, BaseUser newUser);

        public void updateOrgInfo(Organization oldOrg, Organization newOrg);

        public void updateOrgContactInfo(Organization oldOrg, Organization newOrg);

        public List<Organization> findLatestOrgs(Pagination pagination);

        public List<Organization> searchOrgs(String searchStr, Pagination pagination);
    }

    /**
     * Created by IntelliJ IDEA.
     * User: Benson
     * Date: 11-8-7
     * Time: 下午8:23
     * To change this template use File | Settings | File Templates.
     */
    interface OrganizationHistoryDao extends ModelDao<OrganizationHistory> {

        public void addHistory(OrganizationHistory history);

        public BaseUser findAgentByResponser(Integer resId);

        public void addHistory(Organization organization);
    }

    interface OrganizationTeacherDao extends ModelDao<OrganizationTeacher>{

        public List<OrganizationTeacher> find(Integer orgId, Pagination pagination);
    }

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 12-10-8
     * Time: 上午11:24
     * To change this template use File | Settings | File Templates.
     */
    interface OrgFansDao extends ModelDao<OrgFans> {

        public OrgFans findByOrgAndUser(Integer orgID, Integer fansID);

    }

    /**
     * Created by IntelliJ IDEA.
     * User: AN
     * Date: 12-5-14
     * Time: 上午1:50
     * To change this template use File | Settings | File Templates.
     */

    interface OrgMaterialDao extends ModelDao<OrgMaterial>{
         public List<OrgMaterial> findByOrgId(Pagination pagination, Integer oid);

    }

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 12-4-19
     * Time: 上午11:50
     * To change this template use File | Settings | File Templates.
     */
    interface OrgMeetingDao extends ModelDao<OrgMeeting>{

        public List<OrgMeeting> findForUserCenter(Pagination pagination, Integer uid);
    }

    interface OrgMeetingMemberDao extends ModelDao<OrgMeetingMember>{

        public List<OrgMeetingMember> findByMeeting(Integer mid);
    }
}
