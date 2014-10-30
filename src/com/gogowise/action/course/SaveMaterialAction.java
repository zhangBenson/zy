package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.PPTConvertor;
import com.gogowise.common.utils.UploadUtils;
import com.gogowise.rep.course.ConvertQuestionService;
import com.gogowise.rep.course.CourseService;
import com.gogowise.rep.course.dao.ClassDao;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.dao.CourseMaterialDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.CourseClass;
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


    @Action(value = "uploadMaterialWithJson")
    public String uploadMaterialWithJson() {
        String savePath = ServletActionContext.getServletContext().getRealPath("") + Constants.UPLOAD_FILE_PATH_TMP;
        if (courseMaterial == null) courseMaterial = new CourseMaterial();


        String extName;
        String updatedFileNameOnly = "";
        setCourseOrClassInMaterial();
        if (fileuploadFileName != null && fileuploadFileName.lastIndexOf(".") >= 0) {
            extName = fileuploadFileName.substring(fileuploadFileName.lastIndexOf("."));
            updatedFileNameOnly = fileuploadFileName.replace(extName, "");
            String newFileName = UploadUtils.getNameByTime() + extName;

            UploadUtils.copy(fileupload, new File(savePath + newFileName));
            courseMaterial.setFullPath(UploadUtils.copyTmpFileByUser(newFileName, this.getSessionUserId()));
            this.setGenFileName(newFileName);
        }
        if (courseMaterial.getSourceTitle() == null) {
            courseMaterial.setSourceTitle(updatedFileNameOnly);
        }


        //文件相关属性设置
        courseMaterial.setUploadTime(Calendar.getInstance());


        courseMaterial.setIsDisplay(true);
        courseMaterialDao.persistAbstract(courseMaterial);

        doConvert(this.getGenFileName());
        courseMaterialDao.persistAbstract(courseMaterial);

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("utf-8");

        return RESULT_JSON;
    }

    @Action(value = "saveCourseMaterial", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "uploadCourseMaterial", "course.id", "${course.id}"})})
    public String saveCourseMaterial() {

        String fileName = courseMaterial.getFullPath();
        //文件相关属性设置
        courseMaterial.setUploadTime(Calendar.getInstance());
        setCourseOrClassInMaterial();

        courseMaterial.setFullPath(UploadUtils.copyTmpFileByUser(fileName, this.getSessionUserId()));
        courseMaterial.setIsDisplay(true);
        doConvert(fileName);
        courseMaterialDao.persistAbstract(courseMaterial);
        return SUCCESS;
    }

    private void setCourseOrClassInMaterial() {
        if (classId != null) {
            CourseClass courseClass = classDao.findById(classId);
            if (courseClass != null) {
                courseMaterial.setCourseClass(courseClass);
                courseMaterial.setCourse(courseClass.getCourse());
                this.course = courseClass.getCourse();
            }
        } else {
            courseMaterial.setCourse(courseDao.findById(this.course.getId()));
        }
    }


    private void doConvert(String fileName) {
        try {

            if (CourseMaterial.PPT == courseMaterial.getType()) {
                convertDoc(fileName);
            } else if (CourseMaterial.QUESTION == courseMaterial.getType()) {
                convertQuestion(fileName);
            }
        } catch (Throwable e) {
            LOGGER.error("Cannot covert ", e);
        }
    }

    private void convertQuestion(String fileName) throws IOException, JAXBException {
        String xmlPath = UploadUtils.convertQuestion(fileName, this.getSessionUserId());
        List<Question> questions = convertQuestionService.convert(xmlPath);
        courseService.saveQuestion(courseMaterial, questions);
    }

    private void convertDoc(String fileName) throws Exception {
        courseMaterial.setConvertPath(new PPTConvertor().convert(fileName, this.getSessionUserId()));

        File desDirInfo = new File(courseMaterial.getConvertPath());
        if (desDirInfo != null && desDirInfo.listFiles().length > 0) {
            courseMaterial.setTotalPages(desDirInfo.listFiles().length - 1);
        } else {
            LOGGER.error("error convert size 0");
        }
        LOGGER.info("==================PPT files==============" + courseMaterial.getTotalPages());
    }




    // getters and setters


    public void setCourse(Course course) {
        this.course = course;
    }

    @JSON(serialize = false)
    public Course getCourse() {
        return course;
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
