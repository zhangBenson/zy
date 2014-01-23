<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ include file="/js/org/orgInfoUpdate_js.jsp" %>

<script src="js/jqueryTabs.js" type="text/javascript"></script>
<script type='text/javascript' src='js/uploadify/jquery.uploadify.v2.1.4.js'></script>
<script type='text/javascript' src='js/uploadify/swfobject.js'></script>
<link href="css/course/uploadCourseMaterial.css" rel="stylesheet" type="text/css"/>

<div id="tabtag_4con">


    <h3><s:property value="%{getText('course.resource.upload.resource')}"/></h3>
    <table>
        <tr>
            <td><s:property value="%{getText('course.resource.path')}"/></td>
            <td>
                <div style="float: left;"><input type="file" name="fileupload" value="浏览" id="cm_upload_input"/></div>
                <span class="errorMessage" style="float: left;" id="cm_upload"></span>
            </td>
        </tr>
        <s:form action="saveCourseMaterial" method="POST">
            <input type="hidden" name="course.id" value="<s:property value="course.id" />"/>
            <input type="hidden" name="courseMaterial.fullSize" id="cm_size"/>
            <input type="hidden" name="courseMaterial.fullPath" id="cm_path"/>
            <input type="hidden" name="courseMaterial.path" id="cm_pathInfo"/>
            <input type="hidden" name="courseMaterial.totalPages" id="cm_totalPages"/>
            <tr>
                <td><s:property value="%{getText('course.resource.title')}"/></td>
                <td><input type="text" name="courseMaterial.sourceTitle"/><span class="errorMessage"
                                                                                id="cm_title"></span></td>
            </tr>
            <tr>
                <td><s:property value="%{getText('course.resource.type')}"/></td>
                <td>
                    <s:select
                            list="#{'1':getText('course.material.type.1'),'2':getText('course.material.type.2'),'3':getText('course.material.type.3')}"
                            headerKey="-1" headerValue="%{getText('course.resource.select.type')}"
                            name="courseMaterial.type"/>
                    <span class="errorMessage" id="cm_type"></span>
                </td>
            </tr>
            <tr>
                <td><s:property value="%{getText('course.resource.desc')}"/></td>
                <td><textarea name="courseMaterial.description" onkeyup="changeWordNumber(this,$('#cm_desc'),250);"
                              placeholder="<s:property value="%{getText('course.resource.fill.desc')}"/>"></textarea><span
                        class="errorMessage" id="cm_desc"></span></td>
            </tr>
            <tr>
                <td></td>
                <td><s:submit cssClass="submit_material_btn" onclick="return checkUploadForm();"
                              value="%{getText('course.resource.upload.resource')}"/></td>
            </tr>
        </s:form>
    </table>
</div>


<script type="text/javascript">
    var upload, sourceTitle, sourceType, sourceDesc;
    function checkUploadForm() {
        var b1 = true, b2 = true, b3 = true;
        upload = $("#cm_path").val();
        sourceTitle = $("input[name='courseMaterial.sourceTitle']").val();
        sourceType = $("select[name='courseMaterial.type']").val();

        $("#cm_upload").html("")
        $("#cm_title").html("")
        $("#cm_type").html("")
        if (!upload) {
            $("#cm_upload").html("<s:text name="course.resource.select.file"/>");
            b1 = false;
        }
        if (!sourceTitle) {
            $("#cm_title").html("<s:text name="course.resource.fill.title"/>");
            b2 = false;
        }
        if (sourceType == -1) {
            $("#cm_type").html("<s:text name="course.resource.select.type"/>");
            b3 = false;
        }

        return b1 && b2 && b3;
    }

    function deleteMaterial(obj, materialId) {
        var confirmed = confirm("<s:text name="course.resource.cannot.back"/>");
        if (!confirmed) return;
        $(obj).parents("tr").remove();
        $.post("deleteCourseMaterial.html", {"courseMaterial.id": materialId}, function () {
        });
    }

    $(document).ready(function () {
        //点击图片选择按钮
        $("#cm_upload_input").uploadify({
            /*注意前面需要书写path的代码*/
            'uploader': 'js/uploadify/uploadify.swf',
            'script': 'uploadMaterialWithJson.html',
//            'script':'http://beta.gogowise.com/uploadCourseMaterialToBeta.html',
            'cancelImg': 'js/uploadify/cancel.png',
            'queueID': 'cm_upload', //和存放队列的DIV的id一致
            'fileDataName': 'fileupload', //和以下input的name属性一致
//            'scriptData'     : $("#userInfoForm").serialize(),
            'scriptData': {'course.id': 219},
            'auto': true, //是否自动开始
            'multi': false, //是否支持多文件上传
            'buttonText': 'Select File ', //按钮上的文字
            'simUploadLimit': 1, //一次同步上传的文件数目
            'sizeLimit': 1000000000, //设置单个文件大小限制
            'queueSizeLimit': 1, //队列中同时存在的文件个数限制
            'folder': 'upload/file/tmp',
            onComplete: function (event, queueID, fileObj, response, data) {
                var jsonRep = $.parseJSON(response);
                $("#cm_path").val(jsonRep.genFileName);
                $("#cm_path").val(jsonRep.convertPath);
                alert(jsonRep.totalPages + ":" + jsonRep.convertPath);
                $("#cm_path").val(jsonRep.totalPages);
                $("#cm_size").val(fileObj.size);
                $("#cm_upload").html("<s:text name="course.resource.upload.success"/>");
            },
            onError: function (event, queueID, fileObj) {
                $("#cm_upload").html("<s:text name="course.resource.size.limit"/>");
            },
            onCancel: function (event, queueID, fileObj) {
                $("#cm_upload").html("<s:text name="course.resource.reselect"/>");
            },
            onUploadStart: function (event, queueID, fileObj) {
            }
        });
    });

</script>