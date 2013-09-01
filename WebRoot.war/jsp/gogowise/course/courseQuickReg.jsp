<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ include file="/js/course/courseCreation_js.jsp" %>
<link href="css/courseCreation.css" rel="stylesheet" type="text/css" />

<div class="course_create_container">

  <div class="create_content">
    <div class="content_course_class_info">
      <ul style="width:460px;">
        <li><span class="blue_tittle"><s:property value="%{getText('course.info.courseName')}" />：</span><span class="orangeWords"><s:property value="course.name"/></span></li>
        <li><span class="blue_tittle"><s:property value="%{getText('lable.course.date')}" />：</span><span class="orangeWords"><s:date name="course.startDate" format="%{getText('global.display.date.cn')}"/></span></li>
        <li><span class="blue_tittle"><s:property value="%{getText('label.online.class.totalperods')}" />：</span><span class="orangeWords"><s:property value="course.totalHours"/></span></li>
        <li><span class="blue_tittle"><s:property value="%{getText('label.online.class.tutor.price')}" />：</span><span class="orangeWords"><s:property value="course.charges"/>&nbsp;<s:property value="%{getText('label.zhibi.'+course.consumptionType)}"/></span></li>
        <li><span class="blue_tittle"><s:property value="%{getText('label.forcast.lecturer')}" />：</span><span class="orangeWords">
            <s:if test="course.teacherEmail != null">
                <s:property value="course.teacherEmail"/>
            </s:if>
            <s:else>
                <s:property value="course.teacher.email"/>
            </s:else>
        </span></li>
      </ul>
      <div class="course_logo" style="width:300px;float:right;">
          <s:if test="course.logoUrl!=null">
               <img src="<s:property value="course.logoUrl"/>"/>
          </s:if>
          <s:else>
               <img src="images/upimg.gif"/>
          </s:else>
      </div>
      <div class="course_intro"><span class="blue_tittle"><s:property value="%{getText('course.info.description')}" />：</span><br/><span class="orangeWords"><s:property value="course.description"/></span></div>
      <h3><s:property value="%{getText('course.classes.info')}" /></h3>
      <div class="info_class">
        <table>
          <tr>
            <td class="htitle"><s:property value="%{getText('lable.course.no')}" /></td>
            <td class="htitle"><s:property value="%{getText('lable.course.nickname')}" /></td>
            <td class="htitle"><s:property value="%{getText('lable.course.starttime')}" /></td>
            <td class="htitle"><s:property value="%{getText('label.lastingtime')}" /></td>
          </tr>
          <tbody>
          <s:iterator value="course.classes">
            <tr>
              <td><s:property value="name"/></td>
              <td><s:property value="nickName"/></td>
              <td><s:date name="date" format="%{getText('global.display.hour.minute')}"/></td>
              <td><s:property value="duration"/></td>
            </tr>
           </s:iterator>
          </tbody>
        </table>
      </div>
      <h3 id="fee_reg"><s:property value="%{getText('button.registration')}" /></h3>
      <div id="fee_reg_content">
          <p><s:property value="%{getText('please.input.email')}" /></p>
          <span class="reg_email_tip"><s:property value="%{getText('lable.your.email')}" />：</span> <input id="reg_email_input" class="email_input" name="email" type="text"/><span class="email_input_msg input_msg"></span>
          <input class="reg_btn" type="button" value="<s:property value="%{getText('button.registration')}" />" onclick="return yzQuickReg();"/>
      </div>

      <div class="gotoIndex">
          <h3 class="warm_tip"><s:property value="%{getText('org.warmtip')}" />：</h3>
          <span class="tip_words"><s:property value="%{getText('label.quick.reg.success.tips.first.part')}" />&nbsp;<span id="user_free_reg_email"></span><s:property value="%{getText('label.quick.reg.success.tips.last.part')}" /><span onclick="gotoEmailHost();" class="tip_btn"><s:property value="%{getText('message.check.email.for.quickReg')}" /></span></span>
      </div>

      <div class="share_div">
          <!-- JiaThis Button BEGIN -->
          <div id="ckepop">
              <span class="jiathis_txt"><s:property value="%{getText('label.shared.with')}" />：</span>
              <a class="jiathis_button_qzone">QQ空间</a>
              <a class="jiathis_button_renren">人人网</a>
              <a class="jiathis_button_tqq">腾讯微博</a>
              <a class="jiathis_button_tsina">新浪微博</a>
              <a class="jiathis_button_fb">Facebook</a>
              <a class="jiathis_button_twitter">Twitter</a>
              <a href="http://www.jiathis.com/share?uid=1617054" class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank"><s:property value="%{getText('others.more')}" /></a>
          </div>
          <script type="text/javascript">
              var share_url = "http://www.gogowise.com/voaCourseBlog.html?course.id=<s:property value="course.id"/>";
              var share_tittle = "<s:property value='course.name'/> @GoGoWise知元课程 ";
              var share_summary = "<s:property value='course.description'/>";
              var share_image_url = "http://www.gogowise.com/<s:property value='course.logoUrl'/>";
              var jiathis_config = {
                  boldNum:0,
                  siteNum:7,
                  showClose:false,
//                  sm:"t163,kaixin001,renren,douban,tsina,tqq,tsohu",
                  imageUrl:share_image_url,
                  imageWidth:26,
                  marginTop:150,
                  url:share_url,
                  title:share_tittle,
                  summary:share_summary,
                  pic:share_image_url,
                  data_track_clickback:true
//                  hideMore:true
              }
          </script>
          <script type="text/javascript" src="http://v2.jiathis.com/code/jia.js?uid=1617054" charset="utf-8"></script>
      </div>
    </div>
  </div>
</div>
</div>

<style type="text/css">
    .gotoIndex{
        display: none;
        float:left;
        width:100%;
    }
    .gotoIndex h3.warm_tip{
        width:100%;
    }
    .gotoIndex .tip_words{
        float:left;
        width:100%;
        font-size: 12px;
    }
    .gotoIndex .tip_btn{
        color:rgb(29, 160, 236);
        text-decoration: none;
        font-family: "华文行楷";
        font-size:24px;
        font-weight: bold;
        cursor: pointer;
    }
    .gotoIndex .tip_btn:hover{
        color:#f90;
        text-decoration: underline;
    }
    #fee_reg{float:left;width:100%;margin:20px 0px 10px 0px;}
    #fee_reg_content {float:left;width:100%;clear:left;}
     #fee_reg_content p{
        color:#444;
        width:100%;
        margin-bottom:5px;
     }
    #fee_reg_content .reg_email_tip{
        float:left;
        font-size: 14px;
        line-height: 30px;
        margin-right: 5px;
    }
    #fee_reg_content  .email_input{
        float:left;
        border: 1px solid #ccc;
        width:400px;
        height:28px;
        padding-left:2px;
        line-height: 28px;
        clear:right;
    }
    #fee_reg_content .reg_btn{
        clear:left;
        float:left;
        border: none;
        background: orange;
        height:30px;
        color:#fff;
        font-size: 16px;
        font-weight: bold;
        line-height: 30px;
        padding:0px 13px;
        margin-top:10px;
        margin-bottom: 10px;
        margin-left:200px;
        box-shadow:1px 2px 2px rgba(0,0,0,0.2);
        border-radius: 3px;
        cursor: pointer;
    }
    .course_create_container{
        width:960px;
        margin-bottom: 20px;
    }
    .course_create_container .create_content{
        margin-left: 100px;
    }
    h3{
        color: #cc6600;
        margin-top:20px;
        float:left;
    }
    .course_logo img{
        margin-top: 25px;
        height:135px;
        width: 180px;
        padding:4px;
        border:1px solid #ccc;
    }
    .share_div{
        float:left;
        width:100%;
        margin-top: 30px;
    }
</style>