package com.gogowise.action;

import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.Utils;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.live.LiveChannelDao;
import com.gogowise.rep.live.MyShowDao;
import com.gogowise.rep.live.PersonalOnliveDao;
import com.gogowise.rep.live.enity.LiveChannel;
import com.gogowise.rep.live.enity.MyShow;
import com.gogowise.rep.live.enity.PersonalOnlive;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.dao.BaseUserRoleTypeDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({
        @Result(name = "input", location = "/jsp/gogowise/list.jsp"),
        @Result(name = "success", type = "tiles", location = ".index")
})
public class IndexAction extends BasicAction {




    private BaseUserDao baseUserDao;
    private OrganizationDao organizationDao;
    private PersonalOnliveDao personalOnliveDao;
    private LiveChannelDao liveChannelDao;
    private CourseDao courseDao;
    private MyShowDao myShowDao;
    private BaseUser baseUser;
    private List<Course> courses;
    private List<Course> moocCourses;
    private List<MyShow> myShows;
    private List<PersonalOnlive> personalOnlives;
    private List<PersonalOnlive> hottestOnlives;
    private List<LiveChannel> liveChannels;
    private Pagination pagination = new Pagination(3);


    private List<Organization> organizations = new ArrayList<>();

    private BaseUserRoleTypeDao baseUserRoleTypeDao;

    private File fileupload;
    private String fileuploadFileName;
    private String genFileName;

    private String posterLink1;
    private String posterLink2;
    private String posterLink3;
    private String posterLink4;

    private String posterAddress1;
    private String posterAddress2;
    private String posterAddress3;
    private String posterAddress4;

    String logInfo = "";
    private String language;
    /**
     *
     */
    private static final long serialVersionUID = -2512666132359957051L;



    @Action(value = "listAllContent",
            results = {@Result(name = SUCCESS, type = "tiles", location = ".listAllContent")}
    )
    public String listAllContent() throws Exception {
        return SUCCESS;
    }

    @Action(value = "deployBeta",
            results = {@Result(name = SUCCESS, type = "tiles", location = ".listAllContent")}
    )
    public String deployBeta() throws Exception {
        String filePath = "deploy.bat";
        String realPath = ServletActionContext.getServletContext().getRealPath(filePath);
        String cmd = "cmd /c start " + realPath;
        Process ps = Runtime.getRuntime().exec(cmd);
        return SUCCESS;
    }

    @Action(value = "viewLog",
            results = {@Result(name = SUCCESS, type = "tiles", location = ".listAllContent")}
    )
    public String viewLog() throws Exception {
        logInfo = loadLog("D:\\dev\\WorkSpace\\gogowise\\log\\buildLog.txt");
        return SUCCESS;
    }

    public static String loadLog(String filePath) throws IOException {

        String lineBreak = "<tr><td>";
        String lineBreak1 = "</td></tr>";
        File f = new File(filePath);
        BufferedReader br = null;
        String ret = null;
        try {
            br = new BufferedReader(new FileReader(f));
            String line = null;
            StringBuffer sb = new StringBuffer((int) f.length());
            while ((line = br.readLine()) != null) {
                sb.append(lineBreak).append(line).append(lineBreak1);
            }
            ret = sb.toString();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (Exception e) {
                }
            }
        }
        return ret;
    }

    public String getLogInfo() {
        return logInfo;
    }

    public void setLogInfo(String logInfo) {
        this.logInfo = logInfo;
    }


    @Action(value = "index",
            results = {@Result(name = SUCCESS, type = "tiles", location = ".index")}
    )
    public String index() {
//        if("en_US".equals(language)){
        ActionContext.getContext().getSession().put("WW_TRANS_I18N_LOCALE",new Locale("en","US"));
        ActionContext.getContext().getSession().put("request_locale",new Locale("en","US"));
        ActionContext.getContext().getSession().put("request_only_locale",new Locale("en","US"));
        ActionContext.getContext().setLocale(new Locale("en","US"));
//        }
        courses = courseDao.findNonMoocCourses(pagination);
        moocCourses = courseDao.findMoocCourses(pagination);
        organizations = organizationDao.findLatestOrgs(new Pagination(8));
        this.loadPoster();
        return SUCCESS;
    }

    public void loadPoster()
    {
        String   line  = null;
        String fPath = ServletActionContext.getServletContext().getRealPath("/poster.txt");
        try
        {
            BufferedReader br = new BufferedReader( new FileReader(fPath) );
            line = br.readLine();
            this.posterLink1 = line;
            line = br.readLine();
            this.posterLink2 = line;
            line = br.readLine();
            this.posterLink3 = line;
            line = br.readLine();
            this.posterLink4 = line;
            br.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    @Action(value = "changePoster",
            results = {@Result(name = SUCCESS, type = "tiles", location = ".changePoster"),
                    @Result(name = ERROR, type = "tiles", location = ".noPermission")}
    )
    public String changePoster()
    {
        return SUCCESS;
    }

    @Action(value = "posterImageProcess", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".posterImageProcess") })
    public String orgLogoProcess() {
        return SUCCESS;
    }

    @Action(value = "savePoster",
            results = {@Result(name = SUCCESS, type = "tiles", location = ".changePoster"),
                    @Result(name = ERROR, type = "tiles", location = ".noPermission")}
    )
    public String savePoster() throws IOException
    {
        String fPath = ServletActionContext.getServletContext().getRealPath("/poster.txt");
        FileWriter fw = new FileWriter( new File(fPath ) );
        fw.write(this.getPosterLink1()+"\r\n");
        fw.write(this.getPosterLink2()+"\r\n");
        fw.write(this.getPosterLink3()+"\r\n");
        fw.write(this.getPosterLink4()+"\r\n");
        fw.close();

        //更换现在的图片
        String savePath = ServletActionContext.getServletContext().getRealPath("") + Constants.UPLOAD_FILE_PATH_TMP + "/";

        File poster1  = new File( savePath + "/" + this.getPosterAddress1() );
        File poster2  = new File( savePath + "/" + this.getPosterAddress2() );
        File poster3  = new File( savePath + "/" + this.getPosterAddress3() );
        File poster4  = new File( savePath + "/" + this.getPosterAddress4() );

        File dstFile1 = new File(ServletActionContext.getServletContext().getRealPath("") + "/images/index/pic1.jpg");
        File dstFile2 = new File(ServletActionContext.getServletContext().getRealPath("") + "/images/index/pic2.jpg");
        File dstFile3 = new File(ServletActionContext.getServletContext().getRealPath("") + "/images/index/pic3.jpg");
        File dstFile4 = new File(ServletActionContext.getServletContext().getRealPath("") + "/images/index/pic4.jpg");

        Utils.copy(poster1, dstFile1);
        Utils.copy(poster2, dstFile2);
        Utils.copy(poster3, dstFile3);
        Utils.copy(poster4, dstFile4);

        return SUCCESS;

    }

//    @Action(value = "uploadPosterWithJson")
//    public String uploadPosterWithJson() {
//        String savePath = ServletActionContext.getServletContext().getRealPath("") + Constants.UPLOAD_FILE_PATH_TMP + "/";
//
//        Random r = new Random();
//        int rannum = (int) (r.nextDouble() * (99999 - 10000 + 1)) + 10000;
//        String nowTimeStr = Calendar.getInstance().getTimeInMillis() + "";
//
//        String extName = "";
//        String updatedFileNameOnly = "";
//        if (fileuploadFileName.lastIndexOf(".") >= 0) {
//            extName = fileuploadFileName.substring(fileuploadFileName.lastIndexOf("."));
//            updatedFileNameOnly = fileuploadFileName.replace(extName, "");
//        }
//
//        String newFileName = rannum + nowTimeStr + extName;
//
//        fileupload.renameTo(new File(savePath + newFileName));
//
//        String srcPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_FILE_PATH_TMP + "/" + newFileName);
//        String dstPath = ServletActionContext.getServletContext().getRealPath("/images/index/" + newFileName);
//
//        Utils.copy(new File(srcPath), new File(dstPath));
//
//        HttpServletResponse response = ServletActionContext.getResponse();
//        response.setCharacterEncoding("utf-8");
//        this.setGenFileName(newFileName);
//        return RESULT_JSON;
//    }

    public Integer getPersonalOnlivesNum(){
        return this.getPersonalOnlives().size();
    }

    public Integer getCoursesNum(){
        return this.getCourses().size();
    }

    public Integer getShowsNum(){
        return this.getMyShows().size();
    }

    public Integer getLiveChannelsNum(){
        return this.getLiveChannels().size();
    }

    public OrganizationDao getOrganizationDao() {
        return organizationDao;
    }

    public void setOrganizationDao(OrganizationDao organizationDao) {
        this.organizationDao = organizationDao;
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public BaseUser getBaseUser() {
        return baseUser;
    }

    public void setBaseUser(BaseUser baseUser) {
        this.baseUser = baseUser;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }
    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public List<Course> getCourses() {
        return courses;
    }

    public void setCourses(List<Course> courses) {
        this.courses = courses;
    }

    public List<Course> getMoocCourses() {
        return moocCourses;
    }

    public void setMoocCourses(List<Course> moocCourses) {
        this.moocCourses = moocCourses;
    }

    public MyShowDao getMyShowDao() {
        return myShowDao;
    }

    public void setMyShowDao(MyShowDao myShowDao) {
        this.myShowDao = myShowDao;
    }

    public List<MyShow> getMyShows() {
        return myShows;
    }

    public void setMyShows(List<MyShow> myShows) {
        this.myShows = myShows;
    }

    public List<PersonalOnlive> getPersonalOnlives() {
        return personalOnlives;
    }

    public void setPersonalOnlives(List<PersonalOnlive> personalOnlives) {
        this.personalOnlives = personalOnlives;
    }

    public List<LiveChannel> getLiveChannels() {
        return liveChannels;
    }

    public void setLiveChannels(List<LiveChannel> liveChannels) {
        this.liveChannels = liveChannels;
    }

    public PersonalOnliveDao getPersonalOnliveDao() {
        return personalOnliveDao;
    }

    public void setPersonalOnliveDao(PersonalOnliveDao personalOnliveDao) {
        this.personalOnliveDao = personalOnliveDao;
    }

    public LiveChannelDao getLiveChannelDao() {
        return liveChannelDao;
    }

    public void setLiveChannelDao(LiveChannelDao liveChannelDao) {
        this.liveChannelDao = liveChannelDao;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public List<PersonalOnlive> getHottestOnlives() {
        return hottestOnlives;
    }

    public void setHottestOnlives(List<PersonalOnlive> hottestOnlives) {
        this.hottestOnlives = hottestOnlives;
    }

    public List<Organization> getOrganizations() {
        return organizations;
    }

    public void setOrganizations(List<Organization> organizations) {
        this.organizations = organizations;
    }

    public BaseUserRoleTypeDao getBaseUserRoleTypeDao() {
        return baseUserRoleTypeDao;
    }

    public void setBaseUserRoleTypeDao(BaseUserRoleTypeDao baseUserRoleTypeDao) {
        this.baseUserRoleTypeDao = baseUserRoleTypeDao;
    }

    public String getPosterLink1() {
        return posterLink1;
    }

    public void setPosterLink1(String posterLink1) {
        this.posterLink1 = posterLink1;
    }

    public String getPosterLink2() {
        return posterLink2;
    }

    public void setPosterLink2(String posterLink2) {
        this.posterLink2 = posterLink2;
    }

    public String getPosterLink3() {
        return posterLink3;
    }

    public void setPosterLink3(String posterLink3) {
        this.posterLink3 = posterLink3;
    }

    public String getPosterLink4() {
        return posterLink4;
    }

    public void setPosterLink4(String posterLink4) {
        this.posterLink4 = posterLink4;
    }

    public String getPosterAddress1() {
        return posterAddress1;
    }

    public void setPosterAddress1(String posterAddress1) {
        this.posterAddress1 = posterAddress1;
    }

    public String getPosterAddress2() {
        return posterAddress2;
    }

    public void setPosterAddress2(String posterAddress2) {
        this.posterAddress2 = posterAddress2;
    }

    public String getPosterAddress3() {
        return posterAddress3;
    }

    public void setPosterAddress3(String posterAddress3) {
        this.posterAddress3 = posterAddress3;
    }

    public String getPosterAddress4() {
        return posterAddress4;
    }

    public void setPosterAddress4(String posterAddress4) {
        this.posterAddress4 = posterAddress4;
    }

    public void setFileuploadFileName(String fileuploadFileName) {
        this.fileuploadFileName = fileuploadFileName;
    }

    public void setFileupload(File fileupload) {
        this.fileupload = fileupload;
    }

    public String getGenFileName() {
        return genFileName;
    }

    public void setGenFileName(String genFileName) {
        this.genFileName = genFileName;
    }
}
