package com.gogowise.action.utils;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.user.BaseUserDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.common.utils.Constants;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
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
import java.io.*;

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
public class ImageProcessAction extends BasicAction{
    private BaseUserDao baseUserDao;
    private BaseUser user;
    private Course course;
    private Organization org;
    private int imgX;
    private int imgY;
    private int imgWidth;
    private int imgHeight;
    private String userPortraitName;
    private String courseLogoName;
    private String courseLogoUrl;

    @Action(value = "cropUserPortrait")
    public void cropUserPortrait() throws IOException {
        if (StringUtils.isNotBlank(this.getUserPortraitName())) {
            String srcPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_FILE_PATH_TMP + "/" + this.getUserPortraitName());
            String toPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + "/userPortrait/" + this.getUserPortraitName());

             //获取拓展名
            String extName="";
            if (userPortraitName.lastIndexOf(".") >= 0) {
                extName = userPortraitName.substring(userPortraitName.lastIndexOf(".")+1);
            }

            BufferedImage tag = getBufferImage(srcPath);

            createFiles(toPath);

            ImageIO.write(tag,extName,new FileOutputStream(toPath));

            //持久化
            BaseUser _user = baseUserDao.findById(getSessionUserId());
            _user.setPic(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + "/userPortrait/" + this.getUserPortraitName());
            baseUserDao.persistAbstract(_user);
            this.setUser(_user);
            this.setUserToSession(_user);

            PrintWriter out = ServletActionContext.getResponse().getWriter();
            out.print(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + "/userPortrait");
            out.close();
        }
    }
    @Action(value = "cropCourseLogo")
    public void cropCourseLogo() throws IOException {
        if (StringUtils.isNotBlank(this.getCourseLogoName())) {
            String srcPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_FILE_PATH_TMP + "/" + this.getCourseLogoName());
//            String toPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_COURSE_PATH + "/" + getSessionUserId()+"/"+this.getCourseLogoName());
//            String toPath = srcPath;

             //获取拓展名
            String extName="";
            if (courseLogoName.lastIndexOf(".") >= 0) {
                extName = courseLogoName.substring(courseLogoName.lastIndexOf(".")+1);
            }

            BufferedImage tag = getBufferImage(srcPath);

            createFiles(srcPath);

            ImageIO.write(tag,extName,new FileOutputStream(srcPath));

//            PrintWriter out = ServletActionContext.getResponse().getWriter();
//            out.print(Constants.UPLOAD_COURSE_PATH + "/" + getSessionUserId());
//            out.close();
        }
    }

    @Action(value = "userPortraitCrop", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".userPortraitCrop") })
    public String userPortraitCrop() {
        return SUCCESS;
    }
    @Action(value = "courseLogoProcess", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".courseLogoProcess") })
    public String courseLogoProcess() {
        return SUCCESS;
    }

    private void createFiles(String toPath){
        File toFile = new File(toPath);
        if(!toFile.getParentFile().exists()){
            toFile.getParentFile().mkdirs();
        }else{
            File[] files = toFile.getParentFile().listFiles();
            for(File file:files){
                if(file.getName() == courseLogoName)
                    file.delete();
            }
        }
    }

    /**
     * 从指定路径中取出图片并对其裁剪
     * @param srcPath  指定图片的路径
     * @return  处理之后的BufferedImage对象
     */
    private BufferedImage getBufferImage(String srcPath) throws IOException{
        //对图片的处理
        BufferedImage bImg = ImageIO.read(new FileInputStream(srcPath));
        Image image = bImg.getScaledInstance(bImg.getWidth(),bImg.getHeight(),Image.SCALE_DEFAULT);

        CropImageFilter cif = new CropImageFilter(imgX,imgY,imgWidth,imgHeight);
         Image img = Toolkit.getDefaultToolkit().createImage(new FilteredImageSource(image.getSource(),cif));

        BufferedImage tag = new BufferedImage(imgWidth,imgHeight,BufferedImage.TYPE_INT_RGB);
        Graphics2D g = (Graphics2D)tag.getGraphics();
        g.drawImage(img, 0, 0, null);
        g.dispose();

        return tag;
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

    public String getUserPortraitName() {
        return userPortraitName;
    }

    public void setUserPortraitName(String userPortraitName) {
        this.userPortraitName = userPortraitName;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public Organization getOrg() {
        return org;
    }

    public void setOrg(Organization org) {
        this.org = org;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public String getCourseLogoName() {
        return courseLogoName;
    }

    public void setCourseLogoName(String courseLogoName) {
        this.courseLogoName = courseLogoName;
    }
}
