<%@ page import="com.ckeditor.CKEditorConfig" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%
    CKEditorConfig settings = new CKEditorConfig();
    settings.addConfigValue("width", "770");
    settings.addConfigValue("toolbar", "[[ 'Source', '-', 'Bold', 'Italic','-','Image','-','NumberedList','BulletedList','-','Outdent','Indent','-','JustifyLeft'," +
            "'JustifyCenter','JustifyRight','JustifyBlock','-','Link','Unlink','Anchor' ]]");
%>
<div class="pageLoc fl">
    <a href="myFollowing.html">我关注的个人秀</a>
    <i>&gt;</i>
    <span>添加个人秀新鲜事</span>
</div>

<div class="eidtorWrap fl">
    <s:form action="saveShowNewEvent">
        <s:hidden name="myShow.id"/>
        <p>
            <label>个人秀新鲜事主题</label>&nbsp;&nbsp;&nbsp;<span class="tip_words" id="event_title_tip"></span> <br/><br/>
            <input class="text event_title" type="text" name="showNewEvent.title"/> <br/><br/><br/>
        </p>

        <p>
            <label for="editor1">编辑新鲜事主要内容</label> &nbsp;&nbsp;&nbsp;<span class="tip_words"
                                                                           id="event_content_tip"></span> <br/><br/>
            <textarea cols="80" id="editor1" name="showNewEvent.content" rows="10"></textarea>
            <ckeditor:replace replace="editor1" basePath="js/ckeditor/" config="<%=settings %>"/>
        </p>

        <p>
            <input class="submit a_focus" type="submit" onclick="return checkEvent();" value="确认添加"/>
        </p>
    </s:form>


</div>

<script type="text/javascript">
    $(document).ready(function () {
        $(".event_title").keyup(function () {
            changeWordNumber($(".event_title"), $("#event_title_tip"), 40);
        });
    });

    function checkEvent() {
        var eventTitle = $(".event_title").val();
        var ckeditor = CKEDITOR.instances.editor1;
        var eventContent = ckeditor.getData();

        var b1, b2;

        if (eventTitle == "") {
            $("#event_title_tip").html("请填写主题！");
            b1 = false;
        } else b1 = true;

        if (eventContent == "") {
            $("#event_content_tip").html("请填写内容！");
            b2 = false;
        } else b2 = true;

        return b1 && b2;
    }

</script>

<style type="text/css">
    .pageLoc {
        width: 800px;
        margin: 30px 0 0 20px;
    }

    .pageLoc a {
        color: #004276;
        font-size: 12px;
    }

    .pageLoc a:hover {
        text-decoration: underline;
    }

    .pageLoc i {
        font-size: 14px;
        margin: 0 10px;
    }

    .eidtorWrap {
        padding: 20px 0 0 20px;
        width: 800px;
    }

    .eidtorWrap input.text {
        width: 770px;
        height: 30px;
        line-height: 30px;
        border: 1px solid #cdcdcd;
        border-radius: 3px;
    }

    .eidtorWrap input.submit {
        cursor: pointer;
        margin-top: 15px;
        margin-left: 5px;
    }
</style>