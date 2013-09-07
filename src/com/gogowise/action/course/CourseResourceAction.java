package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.action.valueobject.VideoSession;
import com.gogowise.rep.course.*;
import com.gogowise.rep.system.MatterDao;
import com.gogowise.rep.user.BaseUserDao;
import com.gogowise.domain.*;
import com.gogowise.domain.course.*;
import com.gogowise.domain.live.Matter;
import com.gogowise.domain.user.BaseUser;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.EmailUtil;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.CompactWriter;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-23
 * Time: 下午3:14
 * To change this template use File | Settings | File Templates.
 */
@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class CourseResourceAction extends BasicAction {
    /**
     *
     */
    private static final long serialVersionUID = -5768619063356621401L;
    private File download;
    private String downloadFileName;
    private CourseResourceDao courseResourceDao;
    private CourseResource courseResource;
    private List<CourseQuestion> courseQuestions = new ArrayList<CourseQuestion>();
    private List<CourseResource> courseResources = new ArrayList<CourseResource>();
    private List<CourseComment> courseComments = new ArrayList<CourseComment>();
    private CourseQuestionDao courseQuestionDao;
    private CourseCommentDao courseCommentDao;
    private BaseUserDao baseUserDao;
    private CourseDao courseDao;
    private ClassDao classDao;
    private CourseClass courseClass;
    private Course course;
    private String fname;
    private InputStream fstream;
    private String initSeesionString;
    private String flashPatch;
    private Pagination page = new Pagination();
    private MatterDao matterDao;

    @Action(value = "openVideoClass")
    public void openVideoSession() throws IOException {
        if (this.getCourseClass().getId() != null) {
            courseClass = classDao.findById(this.getCourseClass().getId());
        }
        VideoSession videoSession = new VideoSession();
        initSession(videoSession);
        XStream xstream = new XStream();
        xstream.alias("Session", VideoSession.class);
        OutputStream output = new ByteArrayOutputStream();
        xstream.marshal(videoSession, new CompactWriter(new OutputStreamWriter(output)));
        this.setInitSeesionString(output.toString());
        initFlashPath();
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        out.println(initSeesionString);
        out.close();
    }

    private void initSession(VideoSession videoSession) {
        videoSession.initWithSession(this.getCourseClass());
        videoSession.setUserID(this.getSessionUserId());
    }

    private void initFlashPath() {
        this.flashPatch = "flash/VideoPlayer.swf";
    }

    @Action(value = "saveCourseResource", results = {@Result(name = SUCCESS, type = "redirectAction", params = {"actionName", "initCourseResource","course.id","${course.id}"}),
                                                        @Result(name = INPUT,type = Constants.RESULT_NAME_TILES,location = ".courseResource")})
    public String saveCourseResource() {
        String path = "/" + this.getSessionUserId() + "/" + this.getDownloadFileName();

        File resourceFile = new File(ServletActionContext.getServletContext().getRealPath(Constants.DOWNLOAD_RESOURCE_PAHT) + path);
        if (!resourceFile.getParentFile().exists()) {
            resourceFile.getParentFile().mkdirs();
        }
        copy(this.getDownload(), resourceFile);
        courseResource.setCourse(courseDao.findById(this.getCourse().getId()));
        courseResource.setProvider(baseUserDao.findById(this.getSessionUserId()));
        courseResource.setSourceTitle(this.getDownloadFileName());
        courseResource.setFullPath(ServletActionContext.getServletContext().getRealPath(Constants.DOWNLOAD_RESOURCE_PAHT) + path);
        courseResource.setProvideTime(Calendar.getInstance());
        courseResourceDao.persistAbstract(courseResource);
        List<BaseUser> regs=courseDao.findRegUser(this.getCourse().getId(),new Pagination(200));
        BaseUser  self=baseUserDao.findByEmail(this.getSessionUserEmail());
        regs.add(courseDao.findById(course.getId()).getPersonalTeacher());
        course=courseDao.findById(course.getId());
            for(int i=0;i<regs.size();i++){
                 if(!(regs.get(i).getEmail().equals(self.getEmail()))){
                   String href = getBasePath() + "/voaCourseBlog.html?course.id="+course.getId();
                 String title = this.getText("course.resourse.teacher.comment.to.st.title",new String[]{self.getNickName(),course.getName()});
                 String content = this.getText("course.resourse.teacher.comment.to.st.content",new String[]{
                         regs.get(i).getNickName(),
                         self.getNickName(),
                         course.getName(),
                         courseResource.getSourceTitle(),
                         courseResource.getDescription(),
                         href,href
                 });
                 EmailUtil.sendMail(regs.get(i).getEmail(),title,content);
                 Matter matter =new Matter(Calendar.getInstance(),null,Matter.MATTER_COURSE_RESOURCE,baseUserDao.findByEmail(this.getSessionUserEmail()),null,regs.get(i).getEmail(),course,null,null,null,false);
                 matterDao.persistAbstract(matter);
                 }
            }
        return SUCCESS;
    }

    @Action(value = "initCourseResource", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location =".courseResource")})
    public String initCourseResource(){
        course = courseDao.findById(this.getCourse().getId());
        courseResources = courseResourceDao.findByCourseId(page, course.getId());
        return SUCCESS;
    }
    public String downloadFile() {
        courseResource = courseResourceDao.findById(this.getCourseResource().getId());
        fname = courseResource.getSourceTitle();
        // String path = "/"+this.getSessionUserId()+"/"+fname;
        // String realPath = ServletActionContext.getServletContext().getRealPath(Constants.DOWNLOAD_RESOURCE_PAHT);
        try {
            fstream = new FileInputStream(courseResource.getFullPath());

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }


    public File getDownload() {
        return download;
    }

    public void setDownload(File download) {
        this.download = download;
    }

    public String getDownloadFileName() {
        return downloadFileName;
    }

    public void setDownloadFileName(String downloadFileName) {
        this.downloadFileName = downloadFileName;
    }

    public CourseResourceDao getCourseResourceDao() {
        return courseResourceDao;
    }

    public void setCourseResourceDao(CourseResourceDao courseResourceDao) {
        this.courseResourceDao = courseResourceDao;
    }

    public CourseResource getCourseResource() {
        return courseResource;
    }

    public void setCourseResource(CourseResource courseResource) {
        this.courseResource = courseResource;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public String getFname() {
        String name;
        try {
            name = new String(fname.getBytes("GBK"), "ISO-8859-1");
            return name;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public InputStream getFstream() {
        return fstream;
    }

    public void setFstream(InputStream fstream) {
        this.fstream = fstream;
    }

    public ClassDao getClassDao() {
        return classDao;
    }

    public void setClassDao(ClassDao classDao) {
        this.classDao = classDao;
    }

    public CourseClass getCourseClass() {
        return courseClass;
    }

    public void setCourseClass(CourseClass courseClass) {
        this.courseClass = courseClass;
    }

    public String getInitSeesionString() {
        return initSeesionString;
    }

    public void setInitSeesionString(String initSeesionString) {
        this.initSeesionString = initSeesionString;
    }

    public String getFlashPatch() {
        return flashPatch;
    }

    public void setFlashPatch(String flashPatch) {
        this.flashPatch = flashPatch;
    }

    public List<CourseQuestion> getCourseQuestions() {
        return courseQuestions;
    }

    public void setCourseQuestions(List<CourseQuestion> courseQuestions) {
        this.courseQuestions = courseQuestions;
    }

    public List<CourseResource> getCourseResources() {
        return courseResources;
    }

    public void setCourseResources(List<CourseResource> courseResources) {
        this.courseResources = courseResources;
    }

    public List<CourseComment> getCourseComments() {
        return courseComments;
    }

    public void setCourseComments(List<CourseComment> courseComments) {
        this.courseComments = courseComments;
    }

    public CourseQuestionDao getCourseQuestionDao() {
        return courseQuestionDao;
    }

    public void setCourseQuestionDao(CourseQuestionDao courseQuestionDao) {
        this.courseQuestionDao = courseQuestionDao;
    }

    public CourseCommentDao getCourseCommentDao() {
        return courseCommentDao;
    }

    public void setCourseCommentDao(CourseCommentDao courseCommentDao) {
        this.courseCommentDao = courseCommentDao;
    }

    public Pagination getPage() {
        return page;
    }

    public void setPage(Pagination page) {
        this.page = page;
    }

    public MatterDao getMatterDao() {
        return matterDao;
    }

    public void setMatterDao(MatterDao matterDao) {
        this.matterDao = matterDao;
    }
}
