package com.gogowise.action.utils;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.UploadUtils;
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


@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({
        @Result(name = "json", type = "json")
})
public class UploadUtilsAction extends BasicAction {


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

    @Action(value = "uploadFile",interceptorRefs = {})
    public String uploadFile() throws IOException {
        String extName = UploadUtils.getExtension(fileuploadFileName);
        String newFileName = UploadUtils.getNameByTime() + extName;

        String savePath = UploadUtils.getRealPathForBaseDir();

        savePath = savePath + Constants.UPLOAD_FILE_PATH_TMP;


        //缩放处理，长宽不过200
        BufferedImage bufferedImage = ImageIO.read(fileupload);
        int imgWidth = bufferedImage.getWidth();
        int imgHeight = bufferedImage.getHeight();
        int newWidth = imgWidth, newHeight = imgHeight;
        Image image;
        if (imgWidth > imgHeight) {
            if (imgWidth > 300) {
                newWidth = 300;
                newHeight = 300 * imgHeight / imgWidth;
            }
        } else {
            if (imgHeight > 300) {
                newWidth = 300 * imgWidth / imgHeight;
                newHeight = 300;
            }
        }
        image = bufferedImage.getScaledInstance(newWidth, newHeight, Image.SCALE_DEFAULT);
        BufferedImage tag = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_BGR);
        Graphics2D g = (Graphics2D) tag.getGraphics();
        g.drawImage(image, 0, 0, null);
        String extNameWithoutDot = extName.substring(extName.indexOf(".") + 1);
        ImageIO.write(tag, extNameWithoutDot, fileupload);

        File newFileToCreate = new File(savePath + newFileName);
        File newPatchToCreate = new File(savePath);
        if (!newPatchToCreate.exists()) {
            newPatchToCreate.mkdirs();
        }
        UploadUtils.copy(fileupload, newFileToCreate);

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("utf-8");
        this.setGenFileName(newFileName);
        return "json";
    }


}
