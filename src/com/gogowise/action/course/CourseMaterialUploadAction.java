package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.UploadUtils;
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
        @Result(name = "json", type = "json")
})
public class CourseMaterialUploadAction extends BasicAction {


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

    @Action(value = "uploadCourseMaterialToTemp")
    public String uploadCourseMaterial() throws IOException {
        String extName = UploadUtils.getExtension(fileuploadFileName);
        String newFileName = UploadUtils.getNameByTime() + extName;

        String savePath = UploadUtils.getRealPathForBaseDir() + Constants.UPLOAD_FILE_PATH_TMP;

        UploadUtils.copy(fileupload, new File(savePath + newFileName));

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("utf-8");
        this.setGenFileName(newFileName);
        return "json";
    }

}
