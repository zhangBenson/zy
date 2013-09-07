package com.gogowise.dao.org;

import com.gogowise.dao.ModelDaoImpl;
import com.gogowise.domain.org.OrgMeeting;
import com.gogowise.domain.Pagination;
import org.springframework.stereotype.Repository;

import java.util.Calendar;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-4-19
 * Time: 上午11:57
 * To change this template use File | Settings | File Templates.
 */
@Repository("orgMeetingDao")
public class OrgMeetingDaoImpl extends ModelDaoImpl<OrgMeeting> implements OrgMeetingDao{

    public List<OrgMeeting> findForUserCenter(Pagination pagination, Integer uid) {
        String hql = "select distinct om From OrgMeeting om left join om.orgMeetingMembers omm where om.startTime>? and (om.hostMan.id = ? or omm.member.id = ?) order by om.startTime asc";
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.HOUR_OF_DAY,-1);
        calendar.add(Calendar.MINUTE,-20);
        return this.find(hql,pagination,calendar,uid,uid);
    }
}
