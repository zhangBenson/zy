<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<html>
<head>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <link rel="stylesheet" href="css/user/userPortraitCrop.css" type="text/css"/>
    <link rel="stylesheet" href="css/course/courseLogoProcess.css" type="text/css"/>
    <script src="js/jcrop/js/jquery.Jcrop.js"></script>
    <link rel="stylesheet" href="js/jcrop/css/jquery.Jcrop.css" type="text/css"/>
    <script type='text/javascript' src='js/uploadify/jquery.uploadify.v2.1.4.js'></script>
    <script type='text/javascript' src='js/uploadify/swfobject.js'></script>
    <script type="text/javascript">
        var errorDiv = "<div class='tip_error'></div>";
        var warnDiv = "<div class='tip_warn'></div>";
        var rightDiv = "<div class='tip_right'></div>";

        var fileType = errorDiv + "<s:text name='validate.message.filetype'/>";
        var mustBeJpg = errorDiv + "<s:text name='validate.message.filetype.must.be'/>";
        var fileSize = errorDiv + "<s:text name='validate.message.filesize'/>";

        var tipDivHTML = "<div class=\"large_image_tip_words\"><span class=\"words_1\">选择您要上传的图片</span><br/><br/><span class=\"words_2\">支持jpg、png、bmp、gif格式图片，且文件小于1M</span></div>";
        var largeImgDivHTML = "<div class=\"large_image_inner\" ><img id=\"target\" src=\"\"/></div>";
        var dynamicImgHTML = "<div class=\"dynamic_image_inner\"><img id=\"preview\" src=\"\"/></div>";
        var real_path;
        var courseLogoName;

        /* 头像图片上传预览，剪裁Div的js */
        //头像的上传
        $(document).ready(function () {
            var jcrop_api;
            var imgX, imgY, imgWidth, imgHeight;
            var boundx, boundy;
            var originalWidth;
            var originalHeight;
            var imageLong;
            var OriginalImage = new Image();

            //图片预加载代码
            jQuery.fn.loadthumb = function (options) {
                options = $.extend({
                    src: ""
                }, options);
                var _self = this;
                _self.hide();
                $(OriginalImage).load(
                        function () {
                            _self.attr("src", options.src);
                            _self.fadeIn("slow");
                        }).attr("src", options.src);  //.attr("src",options.src)要放在load后面，
                originalWidth = OriginalImage.width;
                originalHeight = OriginalImage.height;
                return _self;
            }

            //点击图片选择按钮
            $("#userPortrait_fileField").uploadify({
                /*注意前面需要书写path的代码*/
                'uploader': 'js/uploadify/uploadify.swf',
                'script': 'utils/uploadFile.html',
                'cancelImg': 'js/uploadify/cancel.png',
                'queueID': 'fileQueue', //和存放队列的DIV的id一致
                'fileDataName': 'fileupload', //和以下input的name属性一致
                'auto': true, //是否自动开始
                'multi': false, //是否支持多文件上传
                'buttonText': 'Select File ', //按钮上的文字
                'simUploadLimit': 1, //一次同步上传的文件数目
                'sizeLimit': 2000000, //设置单个文件大小限制
                'queueSizeLimit': 1, //队列中同时存在的文件个数限制
                //'scriptData'     : $("#userInfoForm").serialize(),
                //            'fileDataName' : 'uploads',
                'folder': 'upload/tmp',
                'fileDesc': 'jpg/gif/jpeg/png/bmp.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的
                'fileExt': '*.jpg;*.gif;*.jpeg;*.png;*.bmp;*.png', //允许的格式
                onComplete: function (event, queueID, fileObj, response, data) {
                    $(".large_image").html(largeImgDivHTML);
                    $(".dynamic_image").html(dynamicImgHTML);
                    $(".large_image_inner").show();
                    $(".dynamic_image_inner").show();
                    var jsonRep = $.parseJSON(response);
                    real_path = fileObj.filePath.replace(fileObj.name, jsonRep.genFileName);
                    courseLogoName = jsonRep.genFileName;
                    //隐藏提示语句，显示图像Div
                    $('#target').loadthumb({src: real_path});
                    $('#preview').loadthumb({src: real_path});
                    //如何显示图片
                    $("#target").load(function () {//图片加载成功后执行
                        originalWidth = OriginalImage.width;
                        originalHeight = OriginalImage.height;
                        var ratio = originalWidth / originalHeight;
                        if (ratio >= 200 / 110) {
                            $("#target").attr("width", "400px");
                            imageLong = true;
                        } else {
                            $("#target").attr("height", "220px");
                            imageLong = false;
                        }

                        //使用剪裁功能
                        img_crop();
                    });
                },
                onError: function (event, queueID, fileObj) {
                    //                alert("error");
                    //            $("#secondStepFileWarn").html("file:" + fileObj.name + "upload failed");
                },
                onCancel: function (event, queueID, fileObj) {
                    //                alert("cancel");
                    //            $("#secondStepFileWarn").html("cancel " + fileObj.name);
                },
                onUploadStart: function (event, queueID, fileObj) {
                    //            uploading = true;
                    //            $("#secondStepFileWarn").html(warnDiv+uploading__msg);
                }
            });

            //头像的剪裁
            function img_crop() {
                // Create variables (in this scope) to hold the API and image size
                $('#target').Jcrop({
                    onChange: updatePreview,
                    onSelect: updatePreview,
                    setSelect: [0, 0, 200, 110],
                    aspectRatio: 200 / 110
                }, function () {
                    // Use the API to get the real image size
                    var bounds = this.getBounds();
                    boundx = bounds[0];
                    boundy = bounds[1];
                    if (imageLong) this.setSelect([0, 0, boundy * 200 / 110, boundy]);
                    else this.setSelect([0, 0, boundx, boundy * 110 / 200]);
                    // Store the API in the jcrop_api variable
                    jcrop_api = this;
                });

                function updatePreview(c) {
                    if (parseInt(c.w) > 0) {
                        var ratioX = originalWidth / boundx;
                        var ratioY = originalHeight / boundy;

                        imgX = Math.round(ratioX * c.x);
                        imgY = Math.round(ratioY * c.y);

                        imgWidth = Math.round(ratioX * c.w);
                        imgHeight = Math.round(ratioY * c.h);

                        var rx = 180 / c.w;
                        var ry = 135 / c.h;

                        $('#preview').css({
                            width: Math.round(rx * boundx) + 'px',
                            height: Math.round(ry * boundy) + 'px',
                            marginLeft: '-' + Math.round(rx * c.x) + 'px',
                            marginTop: '-' + Math.round(ry * c.y) + 'px'
                        });
                    }
                }
            }

            //点击保存按钮
            $(".submit_btn").click(function () {
                if (OriginalImage.src = "") {
                    return;
                }
                //获取剪裁后图片的数据,X坐标，Y坐标，长宽，以及，已上传图片在服务器的路径
                //将这些数据用Ajax方式送到后台，并对已上传的图片进行处理后保存，传回图片的路径
                var postStr = {"imgX": imgX, "imgY": imgY, "imgWidth": imgWidth, "imgHeight": imgHeight, "courseLogoName": courseLogoName};
                $.post("cropCourseLogo.html", postStr, function () {
                    //取得图片在服务器上的路径
                    //关闭窗口，并将图片显示在头像Div中
                    if (!real_path) {
                        $(".upload_warn").html("请先上传图片");
                        return;
                    }
                    window.parent.window.document.getElementById("show_log_preview").src = real_path;
                    window.parent.window.document.getElementById("course_logo").value = courseLogoName;
//                               window.parent.window.document.getElementById("obv_course_logo").src = real_path;
                    parent.$.fancybox.close();
                }, "text");
            });

            //点击取消按钮
            $(".cancel_btn").click(function () {
                //隐藏提示语句，显示图像Div
                $(".large_image").html(tipDivHTML);
                $(".dynamic_image").html("");
                parent.$.fancybox.close();
            });
        });
    </script>
</head>
<body>

<div class="image_manipulate_container" id="image_manipulate_container">
    <div class="image_manipulate_inner_div">
        <div class="tittle">Logo设置</div>
        <div class="fileload">
            <input type="file" name="fileupload" id="userPortrait_fileField"/>&nbsp;&nbsp;&nbsp;&nbsp;<span
                class="upload_warn"></span>
        </div>

        <%-- 大图片裁切 --%>
        <div class="large_image">
            <div class="large_image_tip_words">
                <span class="words_1"><s:text name="message.select.pic"/></span><br/><br/>
                <span class="words_2"><s:text name="message.pic.rule"/></span>
            </div>
            <div class="large_image_inner"><img id="target" src=""/></div>
        </div>

        <div class="image_split"></div>

        <%-- 小图片预览 --%>
        <div class="dynamic_image_tittle">Logo预览</div>
        <div class="dynamic_image">
            <div class="dynamic_image_inner"><img id="preview" src=""/></div>
        </div>


        <%-- 提交及取消 --%>
        <div class="portrait_submit">
            <input class="submit_btn" type="submit" value="<s:text name="button.submit"/>"/>
            <input class="cancel_btn" type="button" value="<s:text name="button.cancel"/>"/>
        </div>
    </div>
</div>

</body>
</html>



