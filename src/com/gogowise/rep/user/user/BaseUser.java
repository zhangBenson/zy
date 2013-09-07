package com.gogowise.rep.user.user;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.common.utils.Constants;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Calendar;

@Entity
@Table(name = "MemberShip")
public class BaseUser extends AbstractPersistence {
    private String password;
    private String email;
    private String cardId;   //身份证号码
    private String userName;
    private String nickName;
    private Boolean sexy = true;
    private String pic = Constants.DEFAULT_PERSON_IMAGE;
    private String question;
    private String answer;
    private Calendar dueDate = Calendar.getInstance();
    private Calendar regDate = Calendar.getInstance();
    private Boolean isLive = true;
    private String regIp = "";
    private Integer timeZone = 8;
    private Calendar lastLoginDate = Calendar.getInstance();
    private Boolean isLockedOut = true;    //是否几多
    private Integer failedPasswordAttemptCount = 0;
    private Integer failedPasswordAnswerAttemptCount = 0;
    private Integer userType = 0;
    private String activeCode;
    private Boolean ableToLogon = true;       //是否有效
    private String telphone;
    private Boolean isCompletedAlInfo = false;
    private Calendar birthDay;
    private String idCardUrl;   //身份证扫描件url
    private String selfDescription;
    private String language;
    private Integer fansNum = 0;  //被关注的人数
    private Boolean isTeacher = false;
    private Long onliveTimes; //即时直播的次数
    private Boolean userFocused = false; //用于直播中心判断用户是否被当前用户关注 ,临时变量

    private Boolean openPrivateChannel = false;//是否开通了私人频道

    private String address;
    private double latitude;
    private double longitude;

//    @ManyToMany
//    @JoinTable(name = "userrelationship",
//            joinColumns = {@JoinColumn(name = "user_id", referencedColumnName = "id")},
//            inverseJoinColumns = {@JoinColumn(name = "userFriend_id", referencedColumnName = "id")})
//    private List<BaseUser> follows = new ArrayList<BaseUser>();


    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public Boolean getAbleToLogon() {
        return ableToLogon;
    }

    public void setAbleToLogon(Boolean ableToLogon) {
        this.ableToLogon = ableToLogon;
    }

    public String getActiveCode() {
        return activeCode;
    }

    public void setActiveCode(String activeCode) {
        this.activeCode = activeCode;
    }

    public String getQuestion() {
        return this.question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Boolean getSexy() {
        return sexy;
    }

    public void setSexy(Boolean sexy) {
        this.sexy = sexy;
    }


    public Calendar getDueDate() {
        return dueDate;
    }

    public void setDueDate(Calendar dueDate) {
        this.dueDate = dueDate;
    }

    public Calendar getRegDate() {
        return regDate;
    }

    public void setRegDate(Calendar regDate) {
        this.regDate = regDate;
    }

    public Boolean getLive() {
        return isLive;
    }

    public void setLive(Boolean live) {
        isLive = live;
    }

    public String getRegIp() {
        return regIp;
    }

    public void setRegIp(String regIp) {
        this.regIp = regIp;
    }

    public Integer getTimeZone() {
        return timeZone;
    }

    public void setTimeZone(Integer timeZone) {
        this.timeZone = timeZone;
    }

    public Calendar getLastLoginDate() {
        return lastLoginDate;
    }

    public void setLastLoginDate(Calendar lastLoginDate) {
        this.lastLoginDate = lastLoginDate;
    }

    public Boolean getLockedOut() {
        return isLockedOut;
    }

    public void setLockedOut(Boolean lockedOut) {
        isLockedOut = lockedOut;
    }

    public Integer getFailedPasswordAttemptCount() {
        return failedPasswordAttemptCount;
    }

    public void setFailedPasswordAttemptCount(Integer failedPasswordAttemptCount) {
        this.failedPasswordAttemptCount = failedPasswordAttemptCount;
    }

    public Integer getFailedPasswordAnswerAttemptCount() {
        return failedPasswordAnswerAttemptCount;
    }

    public void setFailedPasswordAnswerAttemptCount(Integer failedPasswordAnswerAttemptCount) {
        this.failedPasswordAnswerAttemptCount = failedPasswordAnswerAttemptCount;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }

    public Boolean getCompletedAlInfo() {
        return isCompletedAlInfo;
    }

    public void setCompletedAlInfo(Boolean completedAlInfo) {
        isCompletedAlInfo = completedAlInfo;
    }

    public Calendar getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(Calendar birthDay) {
        this.birthDay = birthDay;
    }

    public String getIdCardUrl() {
        return idCardUrl;
    }

    public void setIdCardUrl(String idCardUrl) {
        this.idCardUrl = idCardUrl;
    }

    public String getSelfDescription() {
        return selfDescription;
    }

    public void setSelfDescription(String selfDescription) {
        this.selfDescription = selfDescription;
    }

    public String getLanguage() {
        if (language != null)
            return language;
        else
            return  "zh";
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public Integer getFansNum() {
        if(this.fansNum == null) return 0;
        return fansNum;
    }

    public void setFansNum(Integer fansNum) {
        this.fansNum = fansNum;
    }

    public Boolean getTeacher() {
        return isTeacher;
    }

    public void setTeacher(Boolean teacher) {
        isTeacher = teacher;
    }

    public Long getOnliveTimes() {
        return onliveTimes;
    }

    public void setOnliveTimes(Long onliveTimes) {
        this.onliveTimes = onliveTimes;
    }

    public Boolean getUserFocused() {
        return userFocused;
    }

    public void setUserFocused(Boolean userFocused) {
        this.userFocused = userFocused;
    }

    public Boolean getOpenPrivateChannel() {
        return openPrivateChannel;
    }

    public void setOpenPrivateChannel(Boolean openPrivateChannel) {
        this.openPrivateChannel = openPrivateChannel;
    }
}
