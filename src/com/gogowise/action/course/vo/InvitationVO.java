package com.gogowise.action.course.vo;


import com.gogowise.action.BasicVO;

public class InvitationVO extends BasicVO {
    private Integer id;
    private String invitedStudentEmail;
    private Boolean acceptInvite;

    public String getInvitedStudentEmail() {
        return invitedStudentEmail;
    }

    public void setInvitedStudentEmail(String invitedStudentEmail) {
        this.invitedStudentEmail = invitedStudentEmail;
    }

    public Boolean getAcceptInvite() {
        return acceptInvite;
    }

    public void setAcceptInvite(Boolean acceptInvite) {
        this.acceptInvite = acceptInvite;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
