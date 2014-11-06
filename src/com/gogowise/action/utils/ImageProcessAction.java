package com.gogowise.action.utils;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.UploadUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.CropImageFilter;
import java.awt.image.FilteredImageSource;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by GoGoWise
 * User: GGW
 * Date: 12-4-30
 * Time: 下午6:08
 * To change this template use File | Settings | File Templates.
 */
@SuppressWarnings("UnusedDeclaration")
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class ImageProcessAction extends BasicAction {

    private int imgX;
    private int imgY;
    private int imgWidth;
    private int imgHeight;
    private String upLoadImgName;
    private String upLoadImgUrl;

    private String key;


    @Action(value = "imgProcess", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".imgProcess")})
    public String imgProcess() {
        return SUCCESS;
    }


    @Action(value = "cropLogo")
    public void cropLogo() throws IOException {

        FileOutputStream fileOutputStream = null;
        try {

            String srcPath = UploadUtils.getRealPathForBaseDir() + Constants.UPLOAD_FILE_PATH_TMP + upLoadImgName;
            String extName = UploadUtils.getExtension(upLoadImgName);
            if (upLoadImgName.lastIndexOf(".") >= 0) {
                extName = upLoadImgName.substring(upLoadImgName.lastIndexOf(".") + 1);
            }

            BufferedImage target = getBufferedImage(srcPath);
            new File(srcPath).delete();
            fileOutputStream = new FileOutputStream(srcPath);
            ImageIO.write(target, extName, fileOutputStream);

        } finally {

            if (fileOutputStream != null) {
                fileOutputStream.close();
            }
        }

    }

    private BufferedImage getBufferedImage(String srcPath) throws IOException {
        FileInputStream fileInputStream = null;
        BufferedImage target = null;
        try {


            fileInputStream = new FileInputStream(srcPath);
            BufferedImage bImg = ImageIO.read(fileInputStream);
            Image image = bImg.getScaledInstance(bImg.getWidth(), bImg.getHeight(), Image.SCALE_DEFAULT);

            CropImageFilter cif = new CropImageFilter(imgX, imgY, imgWidth, imgHeight);
            Image img = Toolkit.getDefaultToolkit().createImage(new FilteredImageSource(image.getSource(), cif));

            target = new BufferedImage(imgWidth, imgHeight, BufferedImage.TYPE_INT_RGB);
            Graphics2D g = (Graphics2D) target.getGraphics();
            g.drawImage(img, 0, 0, null);
            g.dispose();
            if (fileInputStream != null) {
                fileInputStream.close();
            }
        } finally {

            if (fileInputStream != null) {
                fileInputStream.close();
            }
        }
        return target;
    }

    public int getImgX() {
        return imgX;
    }

    public void setImgX(int imgX) {
        this.imgX = imgX;
    }

    public int getImgY() {
        return imgY;
    }

    public void setImgY(int imgY) {
        this.imgY = imgY;
    }

    public int getImgWidth() {
        return imgWidth;
    }

    public void setImgWidth(int imgWidth) {
        this.imgWidth = imgWidth;
    }

    public int getImgHeight() {
        return imgHeight;
    }

    public void setImgHeight(int imgHeight) {
        this.imgHeight = imgHeight;
    }

    public String getUpLoadImgName() {
        return upLoadImgName;
    }

    public void setUpLoadImgName(String upLoadImgName) {
        this.upLoadImgName = upLoadImgName;
    }

    public String getUpLoadImgUrl() {
        return upLoadImgUrl;
    }

    public void setUpLoadImgUrl(String upLoadImgUrl) {
        this.upLoadImgUrl = upLoadImgUrl;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }
}
