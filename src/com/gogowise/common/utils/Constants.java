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
    public static final String UPLOAD_FILE_PATH_TMP = "/upload/tmp";
    public static final String UPLOAD_PATH = "/upload/";

    public static final String DOWNLOAD_RESOURCE_PAHT = "/download/resource";
    public static final String DOWNLOAD_COURSE_RESOURCE_PAHT = "/download/courseResource";

    public static final String DOWNLOAD_CONTRACT = "/download/contract";


    public static final int BUFFER_SIZE = 4 * 1024 * 1024;


    public static final String WHICH_SITE_CAN＿HAVE＿SECDOMAIN = "www.gogowise.com";
    public static final String WELCOME_PAGE = "index.jsp";
    public static final int MIN_SECDOMAIN_LENGTH = 5;
    public static final String DEFAULT_BLANK_VALUE = "";
    public static final String DEFAULT_USER_LOGO = "images/defaultImgs/portrait.png";
    public static final Integer DEFAULT_INT_VALUE = 0;
    public static final Double DEFAULT_DOUBLE_VALUE = 3.0;


    public static final String ORG_CONFIRM_EMAIL = "zlhades@hotmail.com";
    public static final Integer MASTER_TYPE = 0;
    public static final Integer STUDENT_TYPE = 1;
    public static final Integer ANONYMOUS_TYPE = 2;
    public static final String COURSE_CONFIRM_EMAIL = "zlhades@hotmail.com";


    /*---------------------------zhibi------------------------------------------*/
    public static final String ZHIBI_SYSTEM_EMAIL = "zlhades@hotmail.com";


    /* ----------------------basic action-----------------------------*/
    public static final String RESULT_NAME_TILES = "tiles";
    public static final String RESULT_NAME_REDIRECT_ACTION = "redirectAction";
    public static final String RESULT_NAME_REDIRECT = "redirect";

    /* ----------------------Session variable-----------------------------*/
    public static final String SESSION_USER_ID = "userID";
    public static final String SESSION_USER_NICKNANE = "nickName";
    public static final String SESSION_USER_EMAIL = "email";
    public static final String SESSION_USER_LOGO_URL = "userLogoUrl";
    public static final String HIG_SEC_USER_EMAIL = "HIG_SEC_USER_EMAIL";
    public static final String SESSION_USER_FANSNUM = "userFansNum";
    public static final String SESSION_USER_IS_TEACHER = "isTeacher";
    public static final String SESSION_USER_OWN_ORG = "user_own_org";


    /*---------------------definition ccs type for myFirstPage menu--------------*/
    public static final Integer OPERA_TYPE_FOR_COURSE_CREATION = 4;
    public static final Integer OPERA_TYPE_FOR_COURSE_MODIFY = 5;

    /*---------------------COURSE  TYPE--------------*/
    public static final Integer COURSE_TYPE_ORG = 1;
    public static final Integer COURSE_TYPE_VORG = 2;


    public static final String ZHI_YUAN_SCHOOL_NAME = "知元模拟学校";
    public static final Integer CLASS_TYPE_OF_MAINTENANCE = 1;
    public static final Integer CLASS_TYPE_OF_REPEAT = 2;

    public static final String CHAT_TYPE_UTF_8 = "utf-8";
    public static final Integer DEFAULT_PAGE_OF_COMMENTS_INCREASED_SIZE = 5;
    public static final String DEFAULT_COURSE_IMAGE = "images/defaultImgs/course.gif";              //course
    public static final String DEFAULT_PERSON_IMAGE = "images/defaultImgs/portrait.png";           //person
    public static final String DEFAULT_OTHER_IMAGE = "images/defaultImgs/other.jpg";               //others
    public static final String DEFAULT_ORGANIZATION_IMAGE = "images/defaultImgs/org.jpg";       //org

    public static final Integer TRANSFER_TYPE_OF_DEFAULT = 1;
    public static final Integer TRANSFER_TYPE_OF_CHARGE_FOR_MCHANNEL = 2;


    /* -------------------------- Question patch ----------------------------------------- */
    public static String QUESTION_EXT_PATH = "/exe/question/batch.sh";
    public static String QUESTION_FILE_NAME = "question.xml";

    public static String PPT_PDF_EXT_PATH = "/exe/ppt/PPT2PDF.sh";
    public static String PPT_EXT_PATH = "/exe/ppt/PDF2PNG.sh";


    public static Integer Class_User_Status_Default = 0;
    public static Integer Class_User_Status_In = 1;
    public static Integer Class_User_Status_Finish = 2;

}
