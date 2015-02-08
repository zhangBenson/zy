package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.PPTConverter;
import com.gogowise.common.utils.UploadUtils;
import com.gogowise.common.utils.WordConverter;
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
import java.io.File;
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
    public String uploadMaterialWithJson() throws Exception {
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

            int tmpType = CourseMaterial.getTypeByString(extName);
            if( tmpType != CourseMaterial.OTHER ){
                courseMaterial.setType(tmpType);
            }

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
    public String saveCourseMaterial() throws Exception {

        String fileName = courseMaterial.getFullPath();
        //文件相关属性设置
        courseMaterial.setUploadTime(Calendar.getInstance());
        setCourseOrClassInMaterial();

        courseMaterial.setFullPath(UploadUtils.copyTmpFileByUser(fileName, this.getSessionUserId()));
        courseMaterial.setIsDisplay(true);
        courseMaterialDao.persistAbstract(courseMaterial);
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


    private void doConvert(String fileName) throws Exception {
        if (CourseMaterial.PPT == courseMaterial.getType()) {
            convertPPT(fileName);
        } else if (CourseMaterial.QUESTION == courseMaterial.getType()) {
            convertQuestion(fileName);
        } else if( CourseMaterial.DOC == courseMaterial.getType() ){
            convertDOC(fileName);
        }
    }

    private void convertQuestion(String fileName) throws Exception {
        WordConverter wordConverter = new WordConverter();
        wordConverter.convert(fileName, this.getSessionUserId());
        List<Question> questions = wordConverter.getQuestions();
        courseService.saveQuestion(courseMaterial, questions);
    }

    private void convertPPT(String fileName) throws Exception {
        PPTConverter converter = new PPTConverter();
        converter.convert(fileName, this.getSessionUserId());
        courseMaterial.setConvertPath(converter.getDesVPath());

        courseMaterial.setTotalPages(converter.getIndex());
        LOGGER.info("=====ppt=====" + courseMaterial.getConvertPath() + "==" + courseMaterial.getTotalPages());
    }

    private void convertDOC(String fileName) throws Exception{
        //TODO:need Zhang wei add the process
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
