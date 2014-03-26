package com.gogowise.common.utils;

/**
 * Created by IntelliJ IDEA.
 * User: zhangb
 * Date: Jun 4, 2009
 * Time: 3:32:44 PM
 * To change this template use File | Settings | File Templates.
 */
public class Constants {

    public static final int PAGE_SIZE = 9;
    public static final String UPLOAD_FILE_PATH_TMP = "/upload/file/tmp";
    public static final String UPLOAD_FILE_PATH_PPT = "/upload/file/ppt";
    public static final String UPLOAD_USER_PATH = "/upload/user";
    public static final String UPLOAD_COURSE_PATH = "/upload/course";
    public static final String UPLOAD_SHOW_PATH = "/upload/show";
    public static final String UPLOAD_ANNOUNCE_PATH = "/upload/announce";
    public static final String UPLOAD_ONLIVE_PATH = "/upload/onlive";
    public static final String UPLOAD_ONLIVE_TERM_PATH = "/upload/onlive/terms";


    public static final String UPLOAD_IMAGE_PATH_FOR_COURSE = "/upload/images/course";

    public static final String ORG_LOGO_PATH = "/orgLogo/";
    public static final String ORG_ADV_PATH = "/orgAdv/";
    public static final String USER_PORTRAIT_PATH = "/userPortrait";

    public static final String UPLOAD_COMPETITION_IMAGE_PATH = "/upload/images/competition";
    public static final String DOWNLOAD_RESOURCE_PAHT = "/download/resource";
    public static final String DOWNLOAD_ORG_RESOURCE_PAHT = "/download/orgResource";
    public static final String DOWNLOAD_COURSE_RESOURCE_PAHT = "/download/courseResource";

    public static final String DOWNLOAD_CONTRACT = "/download/contract";

    public static final int COURSE_MATERIAL_TYPE_VIDEO = 1;
    public static final int COURSE_MATERIAL_TYPE_DOCUMENT = 2;
    public static final int COURSE_MATERIAL_TYPE_OHTER = 3;


    public static final int BUFFER_SIZE = 4 * 1024 * 1024;
    public static final int MAX_SINGER_SIZE = 9;
    public static final int MAX_Judge_SIZE = 2;

    public static final Integer TYPE_SINGER = 1;
    public static final Integer TYPE_JUDGE = 2;
    public static final Integer TYPE_HOST = 3;
    public static final String TYPE_SINGER_STRING = "1";
    public static final String TYPE_JUDGE_STRING = "2";
    public static final String TYPE_HOST_STRING = "3";

    public static final String WHICH_SITE_CAN＿HAVE＿SECDOMAIN = "test.gogowise.com";
    public static final String WELCOME_PAGE = "index.jsp";
    public static final int MIN_SECDOMAIN_LENGTH = 5;
    public static final String DEFAULT_BLANK_VALUE = "";
    public static final String DEFAULT_USER_LOGO = "images/defaultImgs/portrait.png";
    public static final Integer DEFAULT_INT_VALUE = 0;
    public static final Double DEFAULT_DOUBLE_VALUE = 3.0;
    public static final String SUCCESS_OBSERVATED = "您已经成功预定";
    public static final String SUCCESS_OBSERVATE = "恭喜您预订成功";
    public static final String SAVE_CLASS_MSG_NULL = "";
    public static final String DEFAULT_PASSWORD = "123";
    public static final Integer TYPE_OF_MASTER = 1;
    public static final Integer TYPE_OF_TEACHER = 2;
    public static final Integer TYPE_OF_CAMERAMAN = 3;
    public static final Integer TYPE_OF_PERSONALTEACHER = 4;
    public static final String SYSTEM_ORGANIZATION_TEACHER = "organization2teacher";
    public static final String SYSTEM_ORGANIZATION_CAMERAMAN = "organization2cameraMan";
    public static final String SYSTEM_TEACHER_ORGANIZATION = "teacher2organization";
    public static final String SYSTEM_TEACHER_CAMERAMAN = "teacher2cameraMan";
    public static final String SYSTEM_CAMERAMAN_TEACHER = "cameraMan2teacher";
    public static final String SYSTEM_ADMIN = "systemAdmin";
    public static final String SYSTEM_TEACHER_ADMIN = "systemTeacher2Admin";
    public static final String SYSTEM_CAMERA_ADMIN = "systemCameraMan2Admin";
    public static final String SYSTEM_CONFIRM_EMAIL = "zlhades@outlook.com";
    public static final String ORG_CONFIRM_EMAIL = "zlhades@outlook.com";
    public static final Integer MASTER_TYPE = 0;
    public static final Integer STUDENT_TYPE = 1;
    public static final Integer ANONYMOUS_TYPE = 2;
    public static final String COURSE_CONFIRM_EMAIL = "zlhades@hotmail.com";


    /*---------------------------zhibi------------------------------------------*/
    public static final String ZHIBI_SYSTEM_EMAIL = "zlhades@hotmail.com";


    /* ----------------------basic action-----------------------------*/
    public static final String RESULT_NAME_TILES = "tiles";
    public static final String RESULT_NAME_REDIRECT_ACTION = "redirectAction";
    public static final String RESULT_CHAIN_ACTION = "chain";

    /* ----------------------Session variable-----------------------------*/
    public static final String SESSION_USER_ID = "userID";
    public static final String SESSION_USER_NICKNANE = "nickName";
    public static final String SESSION_USER_EMAIL = "email";
    public static final String SESSION_USER_LOGO_URL = "userLogoUrl";
    public static final String HIG_SEC_USER_EMAIL = "HIG_SEC_USER_EMAIL";
    public static final String SESSION_USER_FANSNUM = "userFansNum";
    public static final String SESSION_USER_ROLE_TYPE = "roleType";
    public static final String SESSION_USER_IS_TEACHER = "isTeacher";
    public static final String SESSION_USER_OWN_ORG = "user_own_org";
    public static final String SESSION_USER_PRIVATE_CHANNEL_ID = "user_private_channelID";


    /*---------------------definition ccs type for myFirstPage menu--------------*/
    public static final Integer OPERA_TYPE_FOR_MYFIRSTPAGE = 1;
    public static final Integer OPERA_TYPE_FOR_NEW_COURSE = 2;
    public static final Integer OPERA_TYPE_FOR_LIVING_COURSE = 3;
    public static final Integer OPERA_TYPE_FOR_COURSE_CREATION = 4;
    public static final Integer OPERA_TYPE_FOR_COURSE_MODIFY = 5;
    public static final Integer OPERA_TYPE_FOR_AGE_COURSE = 6;
    public static final Integer OPERA_TYPE_FOR_ALL_COURSE = 7;
    public static final Integer OPERA_TYPE_FOR_DATA_CENTER = 8;
    public static final Integer OPERA_TYPE_FOR_COURSE_REG = 9;
    public static final Integer OPERA_TYPE_FOR_COURSE_HISTORY = 10;
    public static final Integer OPERA_TYPE_FOR_MY_FORCAST_COURSE = 11;
    public static final Integer OPERA_TYPE_FOR_ORG_MATTER = 12;
    public static final Integer OPERA_TYPE_FOR_SHOW_MATTER = 13;
    public static final Integer OPERA_TYPE_FOR_ONLIVE_MATTER = 14;

    /*---------------------COURSE  TYPE--------------*/
    public static final Integer COURSE_TYPE_PERSION = 0;
    public static final Integer COURSE_TYPE_ORG = 1;
    public static final Integer COURSE_TYPE_VORG = 2;


    public static final String ZHI_YUAN_SCHOOL_NAME = "知元模拟学校";
    public static final Integer CLASS_TYPE_OF_NORMAL = 0;
    public static final Integer CLASS_TYPE_OF_MAINTENANCE = 1;
    public static final Integer CLASS_TYPE_OF_REPEAT = 2;
    public static final Integer IDENTITY_TYPE_OF_INTERVIEWER = 0;
    public static final Integer IDENTITY_TYPE_OF_INTERVIEWEE = 1;

    public static final String CHAT_TYPE_UTF_8 = "utf-8";
    public static final Integer MY_FIRST_PAGE_INIT = 0;
    public static final Integer MY_FIRST_PAGE_INTERVIEW_MORE = 1;
    public static final Integer MY_FIRST_PAGE_MEETING_MORE = 2;
    public static final Integer DEFAULT_PAGE_OF_COMMENTS_INCREASED_SIZE = 5;
    public static final String DEFAULT_COURSE_IMAGE = "images/defaultImgs/course.gif";              //course
    public static final String DEFAULT_PERSON_IMAGE = "images/defaultImgs/portrait.png";           //person
    public static final String DEFAULT_OTHER_IMAGE = "images/defaultImgs/other.jpg";               //others
    public static final String DEFAULT_SHOW_IMAGE = "images/defaultImgs/show.jpg";                //show
    public static final String DEFAULT_ORGANIZATION_IMAGE = "images/defaultImgs/org.jpg";       //org
    public static final String DEFAULT_ONLIVE_IMAGE = "images/defaultImgs/onlive.jpg";       //onlive
    public static final String DEFAULT_AD_IMAGE = "images/defaultImgs/ad.jpg";       //onlive

    public static final Integer DEFAULT_COURSE_TYPE_OF_LANGUAGE = 1;           //英语.其他语言
    public static final Integer DEFAULT_COURSE_TYPE_OF_LIFE_TRIP = 2;          //生活.旅行.摄影
    public static final Integer DEFAULT_COURSE_TYPE_OF_CAREER_GROWN = 3;             //职场.成长
    public static final Integer DEFAULT_COURSE_TYPE_OF_SCIENCE_TECHNOLOGY = 4;          //互联网.科技.创业
    public static final Integer DEFAULT_COURSE_TYPE_OF_STUDY_ABROAD = 5;          //留学.雅思.托福
    public static final Integer DEFAULT_COURSE_TYPE_OF_SOCIETY = 6;          //社会.杂谈

    public static final Integer TRANSFER_TYPE_OF_DEFAULT = 1;
    public static final Integer TRANSFER_TYPE_OF_CHARGE_FOR_MCHANNEL = 2;


    public static final Integer MEMBER_TYPE_OF_CONTESTANT = 2;
    public static final Integer MEMBER_TYPE_OF_QUEST = 3;
    public static final Integer MEMBER_TYPE_OF_FANS = 0;
    public static final String CSS = "<style type=\"text/css\">\n" +
            "*{padding:0;margin:0;}\n" +
            "#receiptContainer {float: left;width: 100%;font-family: \"微软雅黑\", \"宋体\", \"Lucida Sans Unicode\", \"Lucida Grande\", sans-serif;font-size: 16px;}\n" +
            "#receiptContainer .orangeWords {color: #F90;}\n" +
            "#logoDiv {float: left;height: 60px;width: 100%;text-align: left;}\n" +
            "#receiptContent {float: left;width: 100%;}\n" +
            "#receiptContainer #receiptContent ul li {height: 30px;}\n" +
            "#receiptContainer #receiptContent ul li a {margin-left: 20px;margin-top: 15px;margin-bottom: 15px;}\n" +
            "#receiptContainer #receiptContent ul .sayhello {margin-top: 30px;}\n" +
            "#receiptContainer #receiptContent ul .tittle {margin-bottom: 15px;}\n" +
            "#receiptContainer #receiptContent ul .courseName {margin-top: 20px;}\n" +
            "#receiptContainer #receiptContent ul .startTime {margin-bottom: 20px;}\n" +
            "</style>";

    public static final String BIG_COURSE_ADVERTISE_EMAIL_CSS = "<style type=\"text/css\">\n" +
            "#rvmDiv #logoDiv { background-image: url(http://www.gogowise.com/images/logo.jpg); background-repeat: no-repeat; height: 65px; margin-left: 45px; }\n" +
            "#rvmDiv #rvmcontentDiv ul .welcomeTittle { margin-left: 30px; }\n" +
            "#rvmDiv { float: left; width: 100%; font-family: \"微软雅黑\", \"宋体\", \"Lucida Sans Unicode\", \"Lucida Grande\", sans-serif; }\n" +
            "#logoDiv { float: left; width: 100%; }\n" +
            "#rvmcontentDiv { float: left; width: 100%; }\n" +
            "#rvmDiv #rvmcontentDiv ul li { list-style-type: none; }\n" +
            "#rvmDiv #rvmcontentDiv .orangeWords { color: rgb(255,155,55); }\n" +
            "#rvmDiv #rvmcontentDiv ul .lastWords { margin-top: 50px; }\n" +
            "table tr td{border:1px solid #09F;}\n" +
            "table, tr, td { border-collapse:collapse;}\n" +
            "</style>";

    /* ---------------------  Search Type ----------------------------------- */
    public static int SEARCH_TYPE_ALL = 1;
    public static int SEARCH_TYPE_MEMBER = 2;
    public static int SEARCH_TYPE_ORG = 3;
    public static int SEARCH_TYPE_COURSE = 4;
    public static int SEARCH_TYPE_SHOW = 5;
    public static int SEARCH_TYPE_LIVE = 6;

    /* -------------------------- Hot List Type ----------------------------------------- */
    public static int HOT_TYPE_TEACHER = 1;
    public static int HOT_TYPE_BLOGGER = 2;


    /* -------------------------- Question patch ----------------------------------------- */
    public static String QUESTION_EXT_PATH = "/exe/question/batch.sh";
    public static String QUESTION_FILE_NAME = "/question.xml";

    public static String PPT_PDF_EXT_PATH = "/exe/ppt/PPT2PDF.sh";
    public static String PPT_EXT_PATH = "/exe/ppt/PDF2PNG.sh";


}
