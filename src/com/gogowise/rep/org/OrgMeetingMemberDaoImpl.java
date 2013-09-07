package com.gogowise.rep.org;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.org.org.OrgMeetingMember;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-4-19
 * Time: 上午11:59
 * To change this template use File | Settings | File Templates.
 */
@Repository("orgMeetingMemberDao")
public class OrgMeetingMemberDaoImpl extends ModelDaoImpl<OrgMeetingMember> implements OrgMeetingMemberDao{

    public List<OrgMeetingMember> findByMeeting(Integer mid) {
        return this.find("From OrgMeetingMember omm where omm.orgMeeting.id = ?",mid);
    }
}
