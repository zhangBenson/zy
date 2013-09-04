package com.gogowise.action.org;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.org.ChangeResponserHistoryDao;
import com.gogowise.domain.OrgMaterial;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class OrgResourseAction extends BasicAction{
    private String fname;
    private InputStream fstream;
    private ChangeResponserHistoryDao.OrgMaterialDao orgMaterialDao;
    private OrgMaterial orgMaterial;

    public String orgMaterialDownload(){
        orgMaterial = orgMaterialDao.findById(this.getOrgMaterial().getId());
        fname = orgMaterial.getSourceTitle();
        try {
            fstream = new FileInputStream(orgMaterial.getFullPath());

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return SUCCESS;

    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public InputStream getFstream() {
        return fstream;
    }

    public void setFstream(InputStream fstream) {
        this.fstream = fstream;
    }

    public ChangeResponserHistoryDao.OrgMaterialDao getOrgMaterialDao() {
        return orgMaterialDao;
    }

    public void setOrgMaterialDao(ChangeResponserHistoryDao.OrgMaterialDao orgMaterialDao) {
        this.orgMaterialDao = orgMaterialDao;
    }

    public OrgMaterial getOrgMaterial() {
        return orgMaterial;
    }

    public void setOrgMaterial(OrgMaterial orgMaterial) {
        this.orgMaterial = orgMaterial;
    }
}
