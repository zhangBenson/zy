package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.Utils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;


@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({
        @Result(name = BasicAction.RESULT_JSON, type =BasicAction.RESULT_JSON )
})
public class MaterialUploadToBetaAction extends BasicAction {


    private File fileupload;

    private String fileuploadFileName;
    private String genFileName;

    @JSON(serialize = false)
    public File getFileupload() {
        return fileupload;
    }


    public void setFileupload(File fileupload) {
        this.fileupload = fileupload;
    }

//    @JSON(serialize = false)
    public String getFileuploadFileName() {
        return fileuploadFileName;
    }

    public void setFileuploadFileName(String fileuploadFileName) {
        this.fileuploadFileName = fileuploadFileName;
    }

    public String getGenFileName() {
        return genFileName;
    }

    public void setGenFileName(String genFileName) {
        this.genFileName = genFileName;
    }

    @Action(value = "uploadCourseMaterialToBeta")
    public String uploadCourseMaterialToBeta()  {
        String savePath = ServletActionContext.getServletContext().getRealPath("") + "/" + Constants.UPLOAD_FILE_PATH_TMP+"/";
        Random r = new Random();
        int rannum = (int) (r.nextDouble() * (99999 - 10000 + 1)) + 10000;
        SimpleDateFormat sDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String nowTimeStr = sDateFormat.format(new Date());

        String extName = "";
        if (fileuploadFileName.lastIndexOf(".") >= 0) {
            extName = fileuploadFileName.substring(fileuploadFileName.lastIndexOf("."));
        }
        String newFileName = nowTimeStr + rannum + extName;

        fileupload.renameTo(new File(savePath + newFileName));
        try {
            Utils.pptConvert(savePath + newFileName, savePath+"PPT");
        } catch (IOException e) {
            logger.error("Cannot covert to PPT", e);
        }

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("utf-8");
        this.setGenFileName(newFileName);
        return RESULT_JSON;
    }

}
