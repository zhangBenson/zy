package com.gogowise.domain;

import com.gogowise.utils.Constants;
import com.gogowise.utils.Utils;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-7-18
 * Time: 下午3:13
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class ChannelTerms extends AbstractPersistence{
    @ManyToOne
    private LiveChannel liveChannel;
    private String subTitle;
    private Calendar startTime;
    private String logoUrl;
    private String description;
    private String titbits;
    @OneToOne
    private BaseUser host;
    private String hostEmail;
    @OneToMany(mappedBy = "channelTerms")
    private List<MemberOfLiveChannel> memberOfLiveChannels = new ArrayList<MemberOfLiveChannel>();
    private Calendar createTime;
    private Integer currentID = -1;
    private Integer viewTheOnliveNum = 0;
    private Integer viewTheVideoNum = 0;

    private Boolean haveRecord = false;  //是否录像了
    private Calendar recordTime;     //录像的时间

    public LiveChannel getLiveChannel() {
        return liveChannel;
    }

    public void setLiveChannel(LiveChannel liveChannel) {
        this.liveChannel = liveChannel;
    }

    public String getSubTitle() {
        return subTitle;
    }

    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle;
    }

    public Calendar getStartTime() {
        return startTime;
    }

    public void setStartTime(Calendar startTime) {
        this.startTime = startTime;
    }

    public BaseUser getHost() {
        return host;
    }

    public void setHost(BaseUser host) {
        this.host = host;
    }

    public String getHostEmail() {
        return hostEmail;
    }

    public void setHostEmail(String hostEmail) {
        this.hostEmail = hostEmail;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTitbits() {
        return titbits;
    }

    public void setTitbits(String titbits) {
        this.titbits = titbits;
    }

    public List<MemberOfLiveChannel> getMemberOfLiveChannels() {
        return memberOfLiveChannels;
    }

    public void setMemberOfLiveChannels(List<MemberOfLiveChannel> memberOfLiveChannels) {
        this.memberOfLiveChannels = memberOfLiveChannels;
    }

    public Calendar getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Calendar createTime) {
        this.createTime = createTime;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public Integer getCurrentID() {
        return currentID;
    }

    public void setCurrentID(Integer currentID) {
        this.currentID = currentID;
    }

    public Integer getViewTheOnliveNum() {
        return viewTheOnliveNum;
    }

    public void setViewTheOnliveNum(Integer viewTheOnliveNum) {
        this.viewTheOnliveNum = viewTheOnliveNum;
    }

    public Integer getViewTheVideoNum() {
        return viewTheVideoNum;
    }

    public void setViewTheVideoNum(Integer viewTheVideoNum) {
        this.viewTheVideoNum = viewTheVideoNum;
    }

    public Integer getMemberOfChannelNum(){
        return this.getMemberOfLiveChannels().size();
    }
    public Boolean getHaveRecord() {
        return haveRecord;
    }

    public void setHaveRecord(Boolean haveRecord) {
        this.haveRecord = haveRecord;
    }

    public Calendar getRecordTime() {
        return recordTime;
    }

    public void setRecordTime(Calendar recordTime) {
        this.recordTime = recordTime;
    }

    public List<MemberOfLiveChannel> getContestants(){
          List<MemberOfLiveChannel> contestants = new ArrayList<MemberOfLiveChannel>();
          for(MemberOfLiveChannel curr : this.getMemberOfLiveChannels()){
              if(curr.getType() == Constants.MEMBER_TYPE_OF_CONTESTANT) contestants.add(curr);
          }
          return contestants;
    }

    public List<MemberOfLiveChannel> getConfirmedContestants(){
          List<MemberOfLiveChannel> contestants = new ArrayList<MemberOfLiveChannel>();
          for(MemberOfLiveChannel curr : this.getMemberOfLiveChannels()){
              if(curr.getType() == Constants.MEMBER_TYPE_OF_CONTESTANT && curr.getMember() != null && curr.getAcceptInvite()) contestants.add(curr);
          }
          return contestants;
    }

    public Integer getConfirmedContestantsNum(){
        return this.getConfirmedContestants().size();
    }

    public Integer getContestantsNum(){
        return this.getContestants().size();
    }

    public Integer getAcceptContestantsNum(){
        int total = 0;
        for(MemberOfLiveChannel mc : this.getContestants()){
            if(mc.getAcceptInvite()) total ++ ;
        }
        return total;
    }
    public List<MemberOfLiveChannel> getGuests(){
          List<MemberOfLiveChannel> guests = new ArrayList<MemberOfLiveChannel>();
          for(MemberOfLiveChannel curr : this.getMemberOfLiveChannels()){
              if(curr.getType() == Constants.MEMBER_TYPE_OF_QUEST) guests.add(curr);
          }
          return guests;
    }

    public List<MemberOfLiveChannel> getConfirmedGuests(){
          List<MemberOfLiveChannel> guests = new ArrayList<MemberOfLiveChannel>();
          for(MemberOfLiveChannel curr : this.getMemberOfLiveChannels()){
              if(curr.getType() == Constants.MEMBER_TYPE_OF_QUEST && curr.getMember() != null && curr.getAcceptInvite()) guests.add(curr);
          }
          return guests;
    }

    public Integer getConfirmedGuestsNum(){
        return this.getConfirmedGuests().size();
    }

    public Integer getGuestsNum(){
        return this.getGuests().size();
    }
    public Integer getAcceptGuestsNum(){
        int total = 0;
        for(MemberOfLiveChannel mc : this.getGuests()){
            if(mc.getAcceptInvite()) total ++ ;
        }
        return total;
    }

    public Integer getTermSequence(){
        int sequence = 0;
        for(ChannelTerms ct : this.getLiveChannel().getChannelTermses()){
            sequence++;
            if(ct.getId().equals(this.getId()));{
                 break;
            }
        }
        return sequence;
    }

    public List<ChannelTerms> getOtherTerms(){
        List<ChannelTerms> channelTermses = new ArrayList<ChannelTerms>();
        for(ChannelTerms ct : this.getLiveChannel().getChannelTermses()){
            if(!ct.getId().equals(this.getId())){
                  channelTermses.add(ct);
            }
        }
        return channelTermses;
    }

    public Integer getOtherTermsNum(){
        return this.getOtherTerms().size();
    }

    public Boolean isFinished(){
        Calendar endTime = (Calendar)this.getStartTime().clone();
        endTime.add(Calendar.MINUTE,120);
        if(endTime.before(Utils.getCurrentCalender())){
            return true;
        }
        return false;
    }
}
