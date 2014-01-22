package com.gogowise.action.course;

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
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.JAXBException;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class SaveMaterialAction extends BasicAction {
    /**
     *
     */
    private static final long serialVersionUID = 2466562905933168403L;


    private ConvertQuestionService convertQuestionService;
    private CourseService courseService;

    private Course course;
    private Integer classId;


    private CourseMaterial courseMaterial;
    private CourseMaterialDao courseMaterialDao;
    private CourseDao courseDao;
    private ClassDao classDao;

    private File fileupload;

    private String fileuploadFileName;
    private String genFileName;

    private Integer totalPages;
    private String convertPath;


    @Action(value = "saveCourseMaterial", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "uploadCourseMaterial", "course.id", "${course.id}"})})
    public String saveCourseMaterial() {
        String nowTimeStr = Calendar.getInstance().getTimeInMillis() + "";
        String extName = Utils.getExtention(courseMaterial.getFullPath());
        String newName = courseMaterial.getTypeString() + "_" + nowTimeStr + extName;

        String srcPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_FILE_PATH_TMP + "/" + courseMaterial.getFullPath());
        String dstPath = ServletActionContext.getServletContext().getRealPath(Constants.DOWNLOAD_COURSE_RESOURCE_PAHT + "/" + this.getCourse().getId() + "/" + newName);

        Utils.copy(new File(srcPath), new File(dstPath));

        //文件相关属性设置
        courseMaterial.setUploadTime(Calendar.getInstance());

        if (classId != null) {
            courseMaterial.setCourseClass(classDao.findById(classId));
        } else {
            courseMaterial.setCourse(courseDao.findById(this.getCourse().getId()));
        }

        courseMaterial.setFullPath(Constants.DOWNLOAD_COURSE_RESOURCE_PAHT + "/" + this.getCourse().getId() + "/" + newName);
        courseMaterial.setIsDisplay(true);
        courseMaterialDao.persistAbstract(courseMaterial);

        doConvert(nowTimeStr, dstPath);

        return SUCCESS;
    }


    private void doConvert(String nowTimeStr, String dstPath) {
        try {

            if (CourseMaterial.PPT == courseMaterial.getType()) {
                convertPpt(nowTimeStr, dstPath);
            } else if (CourseMaterial.QUESTION == courseMaterial.getType()) {
                convertQuestion(nowTimeStr, dstPath);
            }
        } catch (Exception e) {
            logger.error("Cannot covert ", e);
        }
    }

    private void convertQuestion(String nowTimeStr, String dstPath) throws IOException, JAXBException {
        String dstDir = this.getRealPathForBaseDir() + Constants.DOWNLOAD_COURSE_RESOURCE_PAHT + "/" + this.getCourse().getId() + "/question/" + nowTimeStr;
        Utils.questionConvert(dstPath, dstDir);
        String xmlPath = dstDir + Constants.QUESTION_FILE_NAME;
        List<Question> questions = convertQuestionService.convert(xmlPath);
        courseService.saveQuestion(courseMaterial, questions);
    }

    private void convertPpt(String nowTimeStr, String dstPath) throws IOException {
        String dstPdfDir = ServletActionContext.getServletContext().getRealPath(Constants.DOWNLOAD_COURSE_RESOURCE_PAHT + "/" + this.getCourse().getId() + "/");
        String dstDir = this.getRealPathForBaseDir() + Constants.DOWNLOAD_COURSE_RESOURCE_PAHT + "/" + this.getCourse().getId() + "/ppt/" + nowTimeStr;
        String pdfName = courseMaterial.getTypeString() + "_" + nowTimeStr + ".pdf";
        Utils.pptConvert(dstPath, dstPdfDir, pdfName, dstDir);
        File desDirInfo = new File(dstDir);
        courseMaterial.setConvertPath(dstPath);
        courseMaterial.setTotalPages(desDirInfo.listFiles().length);
        logger.info("==================PPT files==============" + desDirInfo.listFiles().length);
    }

    @Action(value = "uploadMaterialWithJson")
    public String uploadMaterialWithJson() {
        String savePath = ServletActionContext.getServletContext().getRealPath("") + "/" + Constants.UPLOAD_FILE_PATH_TMP + "/";
        if (courseMaterial == null) courseMaterial = new CourseMaterial();
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

        doConvert(nowTimeStr, dstPath);

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("utf-8");
        this.setGenFileName(newFileName);
        return RESULT_JSON;
    }


    // getters and setters

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }


    public void setCourseMaterial(CourseMaterial courseMaterial) {
        this.courseMaterial = courseMaterial;
    }

    @JSON(serialize = false)
    public CourseMaterial getCourseMaterial() {
        return courseMaterial;
    }

    public void setCourseMaterialDao(CourseMaterialDao courseMaterialDao) {
        this.courseMaterialDao = courseMaterialDao;
    }


    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
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

    public void setFileupload(File fileupload) {
        this.fileupload = fileupload;
    }

    public void setFileuploadFileName(String fileuploadFileName) {
        this.fileuploadFileName = fileuploadFileName;
    }

    public void setGenFileName(String genFileName) {
        this.genFileName = genFileName;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }

    public String getConvertPath() {
        return convertPath;
    }

    public void setConvertPath(String convertPath) {
        this.convertPath = convertPath;
    }

    public Integer getTotalPages() {
        return totalPages;
    }

    public String getGenFileName() {
        return genFileName;
    }
}
