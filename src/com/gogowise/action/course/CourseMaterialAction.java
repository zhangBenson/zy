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
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-10-23
 * Time: 下午3:05
 * To change this template use File | Settings | File Templates.
 */

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class CourseMaterialAction extends BasicAction {
    /**
     *
     */
    private static final long serialVersionUID = 2466562905933168403L;
    private static final Map<Integer, String> TYPE_MAP = new HashMap<>();

    public static final int VIDEO = 1;
    public static final int DOC = 2;
    public static final int QUESTION = 3;
    public static final int OTHER = 0;

    private ConvertQuestionService convertQuestionService;
    private CourseService courseService;
    static {
        TYPE_MAP.put(VIDEO, "VIDEO");
        TYPE_MAP.put(DOC, "DOC");
        TYPE_MAP.put(QUESTION, "QUESTION");
        TYPE_MAP.put(OTHER, "OTHER");
    }
    private Course course;
    private Integer classId;


    private CourseMaterial courseMaterial;
    private CourseMaterialDao courseMaterialDao;
    private CourseDao courseDao;
    private ClassDao classDao;
    private List<CourseMaterial> courseMaterials = new ArrayList<CourseMaterial>();


    @Action(value = "uploadCourseMaterial",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".uploadCourseMaterial")})
    public String uploadCourseMaterial(){
        courseMaterials = courseMaterialDao.findByCourseId(null, this.getCourse().getId());
        return SUCCESS;
    }

    @Action(value = "saveCourseMaterial",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "uploadCourseMaterial", "course.id","${course.id}"})})
    public String saveCourseMaterial(){

        //重命名
        String typeStr = TYPE_MAP.get(courseMaterial.getType());
        String nowTimeStr = Calendar.getInstance().getTimeInMillis()+"";
        String extName = getExtention(courseMaterial.getFullPath());
        String newName = typeStr + "_" + nowTimeStr + extName;

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

        courseMaterialDao.persistAbstract(courseMaterial);

        try {
            //Conver ppt to jpg
            if (".ppt".endsWith(extName) || ".pptx".endsWith(extName)) {
                String dstDir = ServletActionContext.getServletContext().getRealPath(Constants.DOWNLOAD_COURSE_RESOURCE_PAHT + "/" + this.getCourse().getId() + "/ppt" + nowTimeStr);

                Utils.pptConvert(dstPath, dstDir);

            } else if (QUESTION == courseMaterial.getType()) {
                String xmlPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_FILE_PATH_TMP + "/test.xml" );
                List<Question> questions = convertQuestionService.convert(xmlPath);
                courseService.saveQuestion(courseMaterial, questions);
            }
        } catch (Exception e) {
            logger.error("Cannot covert ", e);
        }

        return SUCCESS;
    }

    @Action(value="deleteCourseMaterial")
    public void deleteCourseMaterial(){
        CourseMaterial courseMaterial = courseMaterialDao.findById(this.getCourseMaterial().getId());

        String filePath =  ServletActionContext.getServletContext().getRealPath(courseMaterial.getFullPath());
        new File(filePath).delete();

        courseMaterialDao.delete(courseMaterial);
    }


    // getters and setters

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public CourseMaterial getCourseMaterial() {
        return courseMaterial;
    }

    public void setCourseMaterial(CourseMaterial courseMaterial) {
        this.courseMaterial = courseMaterial;
    }

    public CourseMaterialDao getCourseMaterialDao() {
        return courseMaterialDao;
    }

    public void setCourseMaterialDao(CourseMaterialDao courseMaterialDao) {
        this.courseMaterialDao = courseMaterialDao;
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public List<CourseMaterial> getCourseMaterials() {
        return courseMaterials;
    }

    public void setCourseMaterials(List<CourseMaterial> courseMaterials) {
        this.courseMaterials = courseMaterials;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public ClassDao getClassDao() {
        return classDao;
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
}
