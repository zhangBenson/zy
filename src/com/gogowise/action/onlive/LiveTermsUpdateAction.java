package com.gogowise.action.onlive;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.user.BaseUserDao;
import com.gogowise.rep.live.ChannelTermsDao;
import com.gogowise.rep.live.MemberOfLiveChannelDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.live.enity.ChannelTerms;
import com.gogowise.rep.live.enity.MemberOfLiveChannel;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.EmailUtil;
import com.gogowise.common.utils.Utils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


import java.util.ArrayList;
import java.util.List;


@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class LiveTermsUpdateAction extends BasicAction{
    private ChannelTermsDao channelTermsDao;
    private MemberOfLiveChannelDao memberOfLiveChannelDao;
    private BaseUserDao baseUserDao;
    private Integer id;
    private String subTitle;
    private String description;
    private String logoUrl;
    private String hostEmail;
    private List<String> contestants = new ArrayList<String>();
    private List<String> guests = new ArrayList<String>();

    @Action(value = "updateTermInfo")
    public void updateTermInfo(){
        ChannelTerms ct = channelTermsDao.findById(this.getId());
        ct.setSubTitle(Utils.getEmptyString(this.getSubTitle()));
        ct.setDescription(Utils.getEmptyString(this.getDescription()));
        if(StringUtils.isNotBlank(this.getLogoUrl()) && !this.getLogoUrl().equals(ct.getLogoUrl())){
                Utils.notReplaceFileFromTmp(Constants.UPLOAD_ONLIVE_TERM_PATH + "/" + getSessionUserId(), this.getLogoUrl());
                ct.setLogoUrl(Constants.UPLOAD_ONLIVE_TERM_PATH + "/" + getSessionUserId()+"/"+this.getLogoUrl());
        }
        if(StringUtils.isBlank(this.getLogoUrl())){
                ct.setLogoUrl(Constants.DEFAULT_ONLIVE_IMAGE);
        }
        if(StringUtils.isNotBlank(this.getHostEmail()) && !this.getHostEmail().equals(ct.getHostEmail())) {
            ct.setHostEmail(this.getHostEmail());
        }
        channelTermsDao.persistAbstract(ct);
        for(String contestant : contestants){
            if(StringUtils.isNotBlank(contestant) && memberOfLiveChannelDao.findByChannelTermAndEmail(this.getId(), contestant) == null){
                MemberOfLiveChannel memberOfLiveChannel = new MemberOfLiveChannel();
                memberOfLiveChannel.setChannelTerms(ct);
                memberOfLiveChannel.setType(Constants.MEMBER_TYPE_OF_CONTESTANT);
                memberOfLiveChannel.setMemberEmail(contestant);
                memberOfLiveChannelDao.persistAbstract(memberOfLiveChannel);
                sendEmail2Constant(ct,memberOfLiveChannel);
            }
        }
        for(String guest : guests){
            if(StringUtils.isNotBlank(guest) && memberOfLiveChannelDao.findByChannelTermAndEmail(this.getId(), guest) == null){
                MemberOfLiveChannel memberOfLiveChannel = new MemberOfLiveChannel();
                memberOfLiveChannel.setChannelTerms(ct);
                memberOfLiveChannel.setType(Constants.MEMBER_TYPE_OF_QUEST);
                memberOfLiveChannel.setMemberEmail(guest);
                memberOfLiveChannelDao.persistAbstract(memberOfLiveChannel);
                sendEmail2Guest(ct,memberOfLiveChannel);
            }
        }
    }

    private void sendEmail2Constant(ChannelTerms channelTerms,MemberOfLiveChannel memberOfLiveChannel){
       String memberEmailTitle = this.getText("liveChannel.email.to.contestant.title",new String[]{channelTerms.getLiveChannel().getCreator().getNickName(),channelTerms.getLiveChannel().getName()});
       BaseUser _member = baseUserDao.findByEmail(memberOfLiveChannel.getMemberEmail());
       String memberEmailHead =  this.getText("liveChannel.email.head",new String[]{_member == null ? memberOfLiveChannel.getMemberEmail():_member.getNickName()});
       String memberEmailContent;
       if(channelTerms.getLiveChannel().getOrganization() == null) memberEmailContent = this.getText("liveChannel.email.to.contestant.main.content.personal",new String[]{channelTerms.getLiveChannel().getCreator().getNickName(),channelTerms.getLiveChannel().getName()});
       else  memberEmailContent = this.getText("liveChannel.email.to.contestant.main.content.org",new String[]{channelTerms.getLiveChannel().getCreator().getNickName(),channelTerms.getLiveChannel().getOrganization().getSchoolName(),channelTerms.getLiveChannel().getName()});
       String href = getBasePath()+ "/emailHandleForLiveChannelInvitation.html?host=false&channelTerms.id="+channelTerms.getId()+"&user.email="+memberOfLiveChannel.getMemberEmail();
       String memberEmailBottom = this.getText("liveChannel.email.bottom",new String[]{href,href});
       EmailUtil.sendMail(memberOfLiveChannel.getMemberEmail(), memberEmailTitle, memberEmailHead + memberEmailContent + memberEmailBottom);
    }

    private void sendEmail2Guest(ChannelTerms channelTerms,MemberOfLiveChannel memberOfLiveChannel){
         String memberEmailTitle = this.getText("liveChannel.email.to.guest.title",new String[]{channelTerms.getLiveChannel().getCreator().getNickName(),channelTerms.getLiveChannel().getName()});
         BaseUser _member = baseUserDao.findByEmail(memberOfLiveChannel.getMemberEmail());
         String memberEmailHead =  this.getText("liveChannel.email.head",new String[]{_member == null ? memberOfLiveChannel.getMemberEmail():_member.getNickName()});
         String memberEmailContent;
         if(channelTerms.getLiveChannel().getOrganization() == null) memberEmailContent = this.getText("liveChannel.email.to.guest.main.content.personal",new String[]{channelTerms.getLiveChannel().getCreator().getNickName(),channelTerms.getLiveChannel().getName()});
         else  memberEmailContent = this.getText("liveChannel.email.to.guest.main.content.org",new String[]{channelTerms.getLiveChannel().getCreator().getNickName(),channelTerms.getLiveChannel().getOrganization().getSchoolName(),channelTerms.getLiveChannel().getName()});
         String href = getBasePath()+ "/emailHandleForLiveChannelInvitation.html?host=false&channelTerms.id="+channelTerms.getId()+"&user.email="+memberOfLiveChannel.getMemberEmail();
         String memberEmailBottom = this.getText("liveChannel.email.bottom",new String[]{href,href});
         EmailUtil.sendMail(memberOfLiveChannel.getMemberEmail(), memberEmailTitle, memberEmailHead + memberEmailContent + memberEmailBottom);

    }

    public ChannelTermsDao getChannelTermsDao() {
        return channelTermsDao;
    }

    public void setChannelTermsDao(ChannelTermsDao channelTermsDao) {
        this.channelTermsDao = channelTermsDao;
    }

    public MemberOfLiveChannelDao getMemberOfLiveChannelDao() {
        return memberOfLiveChannelDao;
    }

    public void setMemberOfLiveChannelDao(MemberOfLiveChannelDao memberOfLiveChannelDao) {
        this.memberOfLiveChannelDao = memberOfLiveChannelDao;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSubTitle() {
        return subTitle;
    }

    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public String getHostEmail() {
        return hostEmail;
    }

    public void setHostEmail(String hostEmail) {
        this.hostEmail = hostEmail;
    }

    public List<String> getContestants() {
        return contestants;
    }

    public void setContestants(List<String> contestants) {
        this.contestants = contestants;
    }

    public List<String> getGuests() {
        return guests;
    }

    public void setGuests(List<String> guests) {
        this.guests = guests;
    }
}
