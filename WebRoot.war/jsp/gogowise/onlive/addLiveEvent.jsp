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
    <a href=""><s:property value="%{getText('liveChannel.that.i.focused')}"/></a>
    <i>&gt;</i>
    <%--<a href="">某某某某直播</a>--%>
    <%--<i>&gt;</i>--%>
    <span><s:property value="%{getText('add.liveChannel.new.events')}"/></span>
</div>

<div class="eidtorWrap fl">
    <s:form action="saveLiveEvent">
        <s:hidden name="liveChannel.id"/>
        <p>
            <label><s:property value="%{getText('liveChannel.new.events.title')}"/></label>&nbsp;&nbsp;&nbsp;<span
                class="tip_words" id="event_title_tip"></span> <br/><br/>
            <input class="text event_title" type="text" name="liveChannelNewEvent.title"/><br/><br/><br/>
        </p>

        <p>
            <label for="editor1"><s:property value="%{getText('liveChannel.new.events.content')}"/></label> &nbsp;&nbsp;&nbsp;<span
                class="tip_words" id="event_content_tip"></span> <br/><br/>
            <textarea cols="80" id="editor1" name="liveChannelNewEvent.content" rows="10"><s:property
                    value="%{getText('liveChannel.new.events.description')}"/></textarea>
            <ckeditor:replace replace="editor1" basePath="js/ckeditor/" config="<%=settings %>"/>
        </p>

        <p>
            <input class="submit a_focus" type="submit" onclick="return checkEvent();"
                   value="<s:property value="%{getText('show.confirm.to.public')}"/>"/>
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