package com.gogowise.action.utils;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
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
        String extName = "";
        String newFileName = "";
        String nowTimeStr = "";
        SimpleDateFormat sDateFormat;
        Random r = new Random();

        String savePath = ServletActionContext.getServletContext().getRealPath("");

        savePath = savePath + Constants.UPLOAD_FILE_PATH_TMP+"/";


        //生成随机文件名：当前年月日时分秒+五位随机数（为了在实际项目中防止文件同名而进行的处理）
        int rannum = (int) (r.nextDouble() * (99999 - 10000 + 1)) + 10000; //获取随机数
        sDateFormat = new SimpleDateFormat("yyyyMMddHHmmss"); //时间格式化的格式
        nowTimeStr = sDateFormat.format(new Date()); //当前时间

        //获取拓展名
        if (fileuploadFileName.lastIndexOf(".") >= 0) {
            extName = fileuploadFileName.substring(fileuploadFileName.lastIndexOf("."));
        }

        //缩放处理，长宽不过200
        BufferedImage bufferedImage = ImageIO.read(fileupload);
        int imgWidth = bufferedImage.getWidth();
        int imgHeight = bufferedImage.getHeight();
        int newWidth = imgWidth, newHeight = imgHeight;
        Image image;
        if(imgWidth>imgHeight){
            if(imgWidth>300){
                newWidth = 300;
                newHeight = 300*imgHeight/imgWidth;
            }
        }else{
            if(imgHeight>300){
                newWidth = 300*imgWidth/imgHeight;
                newHeight = 300;
            }
        }
        image = bufferedImage.getScaledInstance(newWidth,newHeight,Image.SCALE_DEFAULT);
        BufferedImage tag = new BufferedImage(newWidth,newHeight,BufferedImage.TYPE_INT_BGR);
        Graphics2D g = (Graphics2D)tag.getGraphics();
        g.drawImage(image,0,0,null);
        String extNameWithoutDot = extName.substring(extName.indexOf(".")+1);
        ImageIO.write(tag,extNameWithoutDot,fileupload);


        newFileName = nowTimeStr + rannum + extName; //文件重命名后的名字

        File newFileToCreate = new File(savePath + newFileName);
        File newPatchToCreate = new File(savePath );
        if (!newPatchToCreate.exists()) {
            newPatchToCreate.mkdirs();
        }
        fileupload.renameTo(newFileToCreate); //保存文件

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("utf-8");
//        response.getWriter().print(newFileName);
        this.setGenFileName(newFileName);
        return "json";
    }

//    public String updateUserInfo() {
//        int i = 0;
//        for (File myFile : this.getUploads()) {
//            String path = "/" + getSessionUserId() + "/" + i + this.getExtention(this.getUploadsFileName().get(i));
//            File imageFile = new File(ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_USER_PATH) + path);
//            if (!imageFile.getParentFile().exists()) {
//                imageFile.getParentFile().mkdirs();
//            } else {
//                File files[] = imageFile.getParentFile().listFiles();
//                for (File file : files) {
//                    file.delete();
//                }
//            }
//            copy(myFile, imageFile);
////            this.getUser().setPic(Constants.UPLOAD_USER_PATH + path);
//            i++;
//        }
//
//        return SUCCESS;
//    }


}
