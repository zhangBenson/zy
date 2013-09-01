package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.utils.Constants;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;


@Controller
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

//    @Action(value = "uploadCourseMaterialToTemp")
    public String uploadCourseMaterial() throws IOException {
        String extName = "";
        String newFileName = "";
        String nowTimeStr = "";
        SimpleDateFormat sDateFormat;
        Random r = new Random();

        String savePath = ServletActionContext.getServletContext().getRealPath("") + "/" + Constants.UPLOAD_FILE_PATH_TMP+"/";


        //生成随机文件名：当前年月日时分秒+五位随机数（为了在实际项目中防止文件同名而进行的处理）
        int rannum = (int) (r.nextDouble() * (99999 - 10000 + 1)) + 10000; //获取随机数
        sDateFormat = new SimpleDateFormat("yyyyMMddHHmmss"); //时间格式化的格式
        nowTimeStr = sDateFormat.format(new Date()); //当前时间

        //获取拓展名
        if (fileuploadFileName.lastIndexOf(".") >= 0) {
            extName = fileuploadFileName.substring(fileuploadFileName.lastIndexOf("."));
        }
        newFileName = nowTimeStr + rannum + extName; //文件重命名后的名字

        fileupload.renameTo(new File(savePath + newFileName)); //保存文件

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("utf-8");
        this.setGenFileName(newFileName);
        return "json";
    }

}
