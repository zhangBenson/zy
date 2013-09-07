package com.gogowise.rep.org.org;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.user.BaseUser;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-4-18
 * Time: 下午5:20
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class OrgMeeting extends AbstractPersistence {
    @OneToOne
    private Organization organization;
    @OneToOne
    private BaseUser hostMan;
    private String hostManEmail;
    private String content;
    private Calendar startTime;

    @OneToMany(mappedBy = "orgMeeting")
    private List<OrgMeetingMember> orgMeetingMembers = new ArrayList<OrgMeetingMember>();




    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    public BaseUser getHostMan() {
        return hostMan;
    }

    public void setHostMan(BaseUser hostMan) {
        this.hostMan = hostMan;
    }

    public String getHostManEmail() {
        return hostManEmail;
    }

    public void setHostManEmail(String hostManEmail) {
        this.hostManEmail = hostManEmail;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Calendar getStartTime() {
        return startTime;
    }

    public void setStartTime(Calendar startTime) {
        this.startTime = startTime;
    }

    public List<OrgMeetingMember> getOrgMeetingMembers() {
        return orgMeetingMembers;
    }

    public void setOrgMeetingMembers(List<OrgMeetingMember> orgMeetingMembers) {
        this.orgMeetingMembers = orgMeetingMembers;
    }
    public Integer getMemberNum(){
        return orgMeetingMembers.size();
    }

    public Integer getMemberConfirmedNum(){
        int total = 0;
        for(OrgMeetingMember orgMeetingMember : orgMeetingMembers){
            if(orgMeetingMember.getAccept() == true){
                total ++ ;
            }
        }
        return total;
    }
}
