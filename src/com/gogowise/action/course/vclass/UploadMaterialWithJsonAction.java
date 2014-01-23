package com.gogowise.action.course.vclass;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.Utils;
import com.gogowise.rep.course.ConvertQuestionService;
import com.gogowise.rep.course.CourseService;
import com.gogowise.rep.course.dao.ClassDao;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.dao.CourseMaterialDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.CourseMaterial;
import com.gogowise.rep.course.enity.Question;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Calendar;
import java.util.List;
import java.util.Random;


@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class UploadMaterialWithJsonAction extends BasicAction {


    private ConvertQuestionService convertQuestionService;
    private CourseService courseService;

    private Course course;
    private Integer classId;


    private CourseMaterial courseMaterial = new CourseMaterial();
    private CourseMaterialDao courseMaterialDao;
    private CourseDao courseDao;
    private ClassDao classDao;


    private File fileupload;

    private String fileuploadFileName;
    private String genFileName;

    private Integer totalPages;
    private String path;

    public Integer getTotalPages() {
        return totalPages;
    }

    public String getPath() {
        return path;
    }

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

    public void setCourseMaterial(CourseMaterial courseMaterial) {
        this.courseMaterial = courseMaterial;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public void setCourseMaterialDao(CourseMaterialDao courseMaterialDao) {
        this.courseMaterialDao = courseMaterialDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public void setClassDao(ClassDao classDao) {
        this.classDao = classDao;
    }

    public void setConvertQuestionService(ConvertQuestionService convertQuestionService) {
        this.convertQuestionService = convertQuestionService;
    }

    public void setCourseService(CourseService courseService) {
        this.courseService = courseService;
    }

    //    @Action(value = "uploadMaterialWithJson")
    public String uploadMaterialWithJson() {
        String savePath = ServletActionContext.getServletContext().getRealPath("") + "/" + Constants.UPLOAD_FILE_PATH_TMP + "/";
        Random r = new Random();
        int rannum = (int) (r.nextDouble() * (99999 - 10000 + 1)) + 10000;
        String nowTimeStr = Calendar.getInstance().getTimeInMillis() + "";


        String extName = "";
        String updatedFileNameOnly = "";
        if (fileuploadFileName.lastIndexOf(".") >= 0) {
            extName = fileuploadFileName.substring(fileuploadFileName.lastIndexOf("."));
            updatedFileNameOnly = fileuploadFileName.replace(extName, "");
        }
        if (courseMaterial.getSourceTitle() == null) {
            courseMaterial.setSourceTitle(updatedFileNameOnly);
        }
        String newFileName = rannum + nowTimeStr + extName;

        fileupload.renameTo(new File(savePath + newFileName));

        String basePath = ServletActionContext.getServletContext().getRealPath(".");
        String newName = courseMaterial.getTypeString() + "_" + nowTimeStr + extName;

        String srcPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_FILE_PATH_TMP + "/" + newFileName);
        String dstPath = ServletActionContext.getServletContext().getRealPath(Constants.DOWNLOAD_COURSE_RESOURCE_PAHT + "/" + this.course.getId() + "/" + newName);

        Utils.copy(new File(srcPath), new File(dstPath));

        //文件相关属性设置
        courseMaterial.setUploadTime(Calendar.getInstance());

        if (classId != null) {
            courseMaterial.setCourseClass(classDao.findById(classId));
        } else {
            courseMaterial.setCourse(courseDao.findById(this.course.getId()));
        }

        courseMaterial.setFullPath(Constants.DOWNLOAD_COURSE_RESOURCE_PAHT + "/" + this.course.getId() + "/" + newName);
        courseMaterial.setIsDisplay(true);
        courseMaterialDao.persistAbstract(courseMaterial);

        try {
            //Conver ppt to jpg

            if (CourseMaterial.PPT == courseMaterial.getType()) {
                String dstPdfDir = ServletActionContext.getServletContext().getRealPath(Constants.DOWNLOAD_COURSE_RESOURCE_PAHT + "/" + this.course.getId() + "/");
                String dstDir = this.getRealPathForBaseDir() + Constants.DOWNLOAD_COURSE_RESOURCE_PAHT + "/" + this.course.getId() + "/ppt/" + nowTimeStr;
                String pdfName = courseMaterial.getTypeString() + "_" + nowTimeStr + "pdf";
                Utils.pptConvert(dstPath, dstPdfDir, pdfName, dstDir);
                File desDirInfo = new File(dstDir);
                System.out.println("================================" + desDirInfo.listFiles().length);
            } else if (CourseMaterial.QUESTION == courseMaterial.getType()) {
                String dstDir = this.getRealPathForBaseDir() + Constants.DOWNLOAD_COURSE_RESOURCE_PAHT + "/" + this.course.getId() + "/question/" + nowTimeStr;
                Utils.questionConvert(dstPath, dstDir);
                String xmlPath = dstDir + Constants.QUESTION_FILE_NAME;
                List<Question> questions = convertQuestionService.convert(xmlPath);
                courseService.saveQuestion(courseMaterial, questions);
            }
        } catch (Exception e) {
            logger.error("Cannot covert ", e);
        }


        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("utf-8");
        this.setGenFileName(newFileName);
        return RESULT_JSON;
    }

}
