<%@ page import="com.ckeditor.CKEditorConfig" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%
	CKEditorConfig settings = new CKEditorConfig();
	settings.addConfigValue("width","770");
    settings.addConfigValue("toolbar","[[ 'Source', '-', 'Bold', 'Italic','-','Image','-','NumberedList','BulletedList','-','Outdent','Indent','-','JustifyLeft',"+
            "'JustifyCenter','JustifyRight','JustifyBlock','-','Link','Unlink','Anchor' ]]");
%>
<div class="pageLoc fl">
    <a href="javascript:;"><s:property value="%{getText('my.live.trailer')}"/></a>
    <i>&gt;</i>
    <%--<a href="">某某某某课程</a>--%>
    <%--<i>&gt;</i>--%>
    <span><s:property value="%{getText('live.trailer.edit.trailer')}"/></span>
</div>

<div class="eidtorWrap fl">
    <s:form action="saveLiveTrailer">
        <s:hidden name="course.id"/>
        <p>
            <label><s:property value="%{getText('live.trailer.edit.main.titler')}"/></label>&nbsp;&nbsp;&nbsp;<span class="tip_words" id="announce_title_tip"></span> <br/><br/>
            <input class="text announce_title" type="text" name="liveTrailer.title"/>    <br/><br/><br/>
        </p>

        <p>
            <label for="editor1"><s:property value="%{getText('live.trailer.edit.main.content')}"/></label>&nbsp;&nbsp;&nbsp;<span class="tip_words"  id="announce_content_tip"></span>  <br/><br/>
            <textarea cols="80" id="editor1" name="liveTrailer.content" rows="10" placeholder="<s:property value="%{getText('live.trailer.edit.main.content.description')}"/>"></textarea>
            <ckeditor:replace  replace="editor1" basePath="js/ckeditor/"  config="<%=settings %>"/>
        </p>

        <p>
            <input class="submit a_focus" id="announce_submit_btn" type="submit" onclick="return checkAnnouncement();" value="<s:property value="%{getText('course.maintenance.confirm')}"/>"/>
        </p>
    </s:form>


</div>

<script type="text/javascript">
    var plsFillTitle = "请填写直播主题";
    var plsFillContent = "请填写直播内容！";

    $(document).ready(function(){
        $(".announce_title").keyup(function(){
            changeWordNumber($(".announce_title"),$("#announce_title_tip"),40);
        });
    });

    function checkAnnouncement(){
        var announceTitle = $(".announce_title").val();
        var ckeditor = CKEDITOR.instances.editor1;
        var announceContent = ckeditor.getData();

        var b1,b2;

        if(announceTitle == "")  {
            $("#announce_title_tip").html(plsFillTitle);
            b1 = false;
        }else b1 = true;

        if(announceContent == "") {
            $("#announce_content_tip").html();
            b2 = false;
        }else b2 = true;

        return b1&&b2;
    }

</script>

<style type="text/css">
    .pageLoc{
        width: 800px;
        margin: 30px 0 0 20px;
    }
    .pageLoc a{
        color:#004276;
        font-size: 12px;
    }
    .pageLoc a:hover{
        text-decoration: underline;
    }
    .pageLoc i{
        font-size: 14px;
        margin: 0 10px;
    }


    .eidtorWrap{
        padding:20px 0 0 20px;
        width: 800px;
    }
    .eidtorWrap input.text{
        width: 770px;
        height: 30px;
        line-height: 30px;
        border: 1px solid #cdcdcd;
        border-radius: 3px;
    }
    .eidtorWrap input.submit{
        cursor: pointer;
        margin-top: 15px;
        margin-left: 5px;
    }
</style>