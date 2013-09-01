<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<script type="text/javascript" src="js/uploadify/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="js/uploadify/swfobject.js"></script>
<script type="text/javascript">
    var warn_div = "<div class='tip_warn'></div>";
    var error_div = "<div class='tip_error'></div>";
    var right_div = "<div class='tip_right'></div>";
    var bidBrandEmpty = "品牌名称不能为空";
    var bidDescriptionEmpty = "商品说明不能为空";
    var bidLinkEmpty = "商品链接不能为空";
    var bidLinkWrong = "请输入有效的商品链接";
    var bidPriceEmpty = "投标价格不能为空";
    var bidPriceWrong = "请输入大于0的有效价格";
    var bidAdImgEmpty = "请上传个人秀广告位图片";
    var bidAdImgUploadSuccess = "个人秀广告位图片上传成功";
    var words_on_uploadButton = "Browse";

    $(document).ready(function() {

        $("#bid_brand").blur(checkBidBrand);
        $("#bid_brand").focus(function(){
            $(".bid_brand_input_msg").html("");
        });
        $("#bid_brand").keyup(function(){
            changeWordNumber(this, $(".bid_brand_input_msg"), 50);
        });

        $("#bid_description").blur(checkBidDescription);
        $("#bid_description").focus(function(){
            $(".bid_description_input_msg").html("");
        });
        $("#bid_description").keyup(function(){
            changeWordNumber(this, $(".bid_description_input_msg"), 200)
        });

        $("#bid_price").blur(checkBidPrice);

        $("#bid_link").blur(checkBidLink);
        $("#bid_link").focus(function(){
            $(".bid_link_input_msg").html("");
        });

        $("#bid_adImg_upload").uploadify({
            /*注意前面需要书写path的代码*/
            'uploader':'js/uploadify/uploadify.swf',
            'script':'utils/uploadFile.html',
            'cancelImg':'js/uploadify/cancel.png',
            'queueID':'fileQueue1', //和存放队列的DIV的id一致
            'fileDataName':'fileupload', //和以下input的name属性一致
            'auto':true, //是否自动开始
            'multi':false, //是否支持多文件上传
            'buttonText':words_on_uploadButton, //按钮上的文字
            'simUploadLimit':1, //一次同步上传的文件数目
            'sizeLimit':2000000, //设置单个文件大小限制
            'queueSizeLimit':1, //队列中同时存在的文件个数限制
            //'scriptData'     : $("#userInfoForm").serialize(),
//            'fileDataName' : 'uploads',
            'folder':'upload/file/tmp',
            'fileDesc':'jpg/gif/jpeg/png/bmp.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的
            'fileExt':'*.jpg;*.gif;*.jpeg;*.png;*.bmp;*.png', //允许的格式
            onComplete:function (event, queueID, fileObj, response, data) {
                var jsonRep = $.parseJSON(response);
                var real_path = fileObj.filePath.replace(fileObj.name, jsonRep.genFileName);
                document.getElementById('bid_adImg').value = jsonRep.genFileName;
                $("#bid_adImg_preview").attr("src", real_path);
                $(".bid_adImg_input_msg").html(right_div + adImgUploadSuccess);
            },
            onError:function (event, queueID, fileObj) {
                $(".bid_adImg_input_msg").html("file:" + fileObj.name + "upload failed");
            },
            onCancel:function (event, queueID, fileObj) {
                $(".bid_adImg_input_msg").html("cancel " + fileObj.name);
            },
            onUploadStart:function (event, queueID, fileObj) {
                $(".bid_adImg_input_msg").html(warn_div + "开始上传");
            }
        });

    });

    function checkBidBrand(){
        var brand = $("#bid_brand").val().replace(/(^\s*)|(\s*$)/g, "");
        if(brand.length==0){
           $(".bid_brand_input_msg").html(error_div+bidBrandEmpty);
           return false;
        }else{
           $(".bid_brand_input_msg").html(right_div);
           return true;
        }
    }
    function checkBidLink(){
        var link = $("#bid_link").val().replace(/(^\s*)|(\s*$)/g, "");
      var linkExp=/[(http|https|ftp):\/\/]{0,1}([a-zA-Z0-9\.\-]+(:[a-zA-Z0-9\.&amp;%\$\-]+)*@)*((25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])|localhost|([a-zA-Z0-9\-]+\.)*[a-zA-Z0-9\-]+\.(com|edu|gov|int|mil|net|org|biz|arpa|info|name|pro|aero|coop|museum|[a-zA-Z]{2}))(\:[0-9]+)*(\/($|[a-zA-Z0-9\.\,\?\'\\\+&amp;%\$#\=~_\-]+))*$/;
        if(link.length==0){
           $(".bid_link_input_msg").html(error_div+bidLinkEmpty);
           return false;
        }else if(!linkExp.test(link)){
            $(".bid_link_input_msg").html(error_div+bidLinkWrong);
            return false;
        }else{
           $(".bid_link_input_msg").html(right_div);
           return true;
        }
    }
    function checkBidDescription(){
        var description = $("#bid_description").val().replace(/(^\s*)|(\s*$)/g, "");
        if(description.length==0){
           $(".bid_description_input_msg").html(error_div+bidDescriptionEmpty);
           return false;
        }else{
           $(".bid_description_input_msg").html(right_div);
           return true;
        }
    }
    function checkBidPrice(){
        var price = $("#bid_price").val().replace(/(^\s*)|(\s*$)/g, "");
        var priceExp = /^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;
        if(price.length==0){
           $(".bid_price_input_msg").html(error_div+bidPriceEmpty);
           return false;
        }else if(!priceExp.test(price)){
            $(".bid_price_input_msg").html(error_div+bidPriceWrong);
            return false;
        }else{
            $(".bid_price_input_msg").html(right_div);
           return true;
        }
    }
    function checkAdImg(){
        var adImg = $("#bid_adImg").val().replace(/(^\s*)|(\s*$)/g, "");
        if(adImg.length==0){
           $(".bid_adImg_input_msg").html(error_div+bidAdImgEmpty);
           return false;
        }else{
            $(".bid_adImg_input_msg").html(right_div + bidAdImgUploadSuccess);
            return true;
        }
    }

    function checkBidInfoForm(){
        var b1 = checkBidBrand();
        var b2 = checkBidLink();
        var b3 = checkBidDescription();
        var b4 = checkBidPrice();
        var b5 = checkAdImg();
        return b1&&b2&&b3&&b4&&b5;
    }


    function dateComparator(Obj) {     //the current time  bigger than startTime which without H:m:s  return true
        var startTime = new Date($(Obj).val().replace(/-/g, "/"));
        var currTime = new Date();
        if (startTime.getYear() < currTime.getYear() || startTime.getYear() == currTime.getYear() && startTime.getMonth() < currTime.getMonth() ||
                startTime.getYear() == currTime.getYear() && startTime.getMonth() == currTime.getMonth() && startTime.getDate() < currTime.getDate()) {
            return false;
        }
        return true
    }



</script>