package com.gogowise.action.vid;


import com.gogowise.action.BasicAction;
import com.gogowise.dao.ModelDao;
import com.gogowise.domain.Pagination;
import com.gogowise.domain.Vid;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class VidAction extends BasicAction {


    private ModelDao modelDao;
    private List<Vid> vids;
    private String typeString;
    private String idStrings;
    private String titleString;


    @Action(value = "listVid",
            results = {@Result(name = SUCCESS, type = "tiles", location = ".vid")}
    )
    public String listVid() throws Exception {

        if (typeString != null) {
            vids = this.getModelDao().find("From Vid where type = ? order by id desc", new Pagination(100), typeString);
        } else {
            vids = this.getModelDao().find("From Vid order by id desc", new Pagination(100));
        }


        StringBuffer sb = new StringBuffer();
        StringBuffer sb1 = new StringBuffer();
        int i = 0;
        for (Vid vid : vids) {
            i++;
            sb.append("\'");
            sb1.append("\'");

            sb.append(vid.getName());
            sb1.append(vid.getTitle());
            if (vids.size() == i) {
                sb.append("\'");
                sb1.append("\'");
            } else {
                sb.append("\',");
                sb1.append("\',");
            }
        }

        this.setIdStrings(sb.toString());
        this.setTitleString(sb1.toString());
        return SUCCESS;
    }

    public ModelDao getModelDao() {
        return modelDao;
    }

    public void setModelDao(ModelDao modelDao) {
        this.modelDao = modelDao;
    }

    public List<Vid> getVids() {
        return vids;
    }

    public void setVids(List<Vid> vids) {
        this.vids = vids;
    }

    public String getTypeString() {
        return typeString;
    }

    public void setTypeString(String typeString) {
        this.typeString = typeString;
    }

    public String getIdStrings() {
        return idStrings;
    }

    public void setIdStrings(String idStrings) {
        this.idStrings = idStrings;
    }

    public String getTitleString() {
        return titleString;
    }

    public void setTitleString(String titleString) {
        this.titleString = titleString;
    }
}
