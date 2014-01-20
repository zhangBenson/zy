package com.gogowise.action.competition;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.Utils;
import com.gogowise.rep.competition.CompetitionDao;
import com.gogowise.rep.competition.enity.Competition;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.File;


@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class CompetitionAction extends BasicAction {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private CompetitionDao competitionDao;
    private Competition competition;
    private int competitionId;
    private File upload;
    private String uploadFileName;
    private String uploadContentType;
    private Boolean singUped = false;

    public String init() throws Exception {
//        this.setCompetitionId(1);
        if (this.getCompetition() != null && this.getCompetition().getId() != null) {
            this.competition = competitionDao.findById(this.getCompetition().getId());
        }
        if (this.competition == null) {
            this.competition = new Competition();
        }
        return SUCCESS;
    }

    public String competitionHome() throws Exception {
        singUped = competitionDao.findByCompetitionIdAndUserId(1, super.getSessionUserId());
        return SUCCESS;
    }


    public String save() throws Exception {
        if (this.upload != null) {
            String path = "/" + this.getCompetition().getId() + Utils.getExtention(this.uploadFileName);
            File imageFile = new File(ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_COMPETITION_IMAGE_PATH) + path);
            if (!imageFile.getParentFile().exists())
                imageFile.getParentFile().mkdirs();
            else {
                File files[] = imageFile.getParentFile().listFiles();
                for (int j = 0; j < files.length; j++) {
                    files[j].delete();
                }
            }
            Utils.copy(this.upload, imageFile);
            this.getCompetition().setLogoUrl(Constants.UPLOAD_COMPETITION_IMAGE_PATH + path);
        }

        this.competitionDao.persistAbstract(this.getCompetition());
        return SUCCESS;
    }

    //===============getter and setter==============


    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public CompetitionDao getCompetitionDao() {
        return competitionDao;
    }

    public void setCompetitionDao(CompetitionDao competitionDao) {
        this.competitionDao = competitionDao;
    }

    public Competition getCompetition() {
        return competition;
    }

    public void setCompetition(Competition competition) {
        this.competition = competition;
    }

    public int getCompetitionId() {
        return competitionId;
    }

    public void setCompetitionId(int competitionId) {
        this.competitionId = competitionId;
    }

    public Boolean getSingUped() {
        return singUped;
    }

    public void setSingUped(Boolean singUped) {
        this.singUped = singUped;
    }
}
