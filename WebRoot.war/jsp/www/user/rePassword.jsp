<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:head/>

<style type="text/css">
    .errorinfo {
        color: #F00;
        font-size: 10px;
        float: left;
    }

    .errorMessage {
        color: #F00;
        font-size: 10px;
        float: left;
    }
</style>

<div class="container">
    <div class="thinline"></div>
    <br/>

    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6" style="">
            <div class="basePanelTextLeft">
                <h1 class="courseSubject">Forget Password</h1>

                <h1 class="courseSynopsis"><s:property value="%{getText('label.get.back.password')}"/></h1>

                <%--<form class="form-horizontal" role="form" method="post" id="repassword_form">--%>
                <s:form cssClass="form-horizontal" action="findEmailUser" theme="css_xhtml" validate="true"
                        method="post" id="form">
                    <div class="form-group">

                        <label for="inputEmail3" class="col-sm-2 control-label">Email</label>

                        <div class="col-sm-10">
                                <%--<input type="email" name="user.email" class="form-control" id="inputEmail3" placeholder="Please Input Your Email" check="mail"></div>--%>
                            <s:textfield name="user.email" id="inputEmail3" cssClass="form-control"/>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">Validation Code：</label>

                        <div class="col-sm-10">
                                <%--<input name="yzmCode" class="form-control" id="inputPassword3" placeholder="Please Input Validation Code"></div>--%>
                            <s:textfield name="yzmCode" id="inputPassword3" cssClass="form-control"/>
                        </div>
                    </div>

                    <div class="form-group" style="text-align: center">
                        <a href="#" onclick="changeImg();"><img id="imgObj"
                                                                src="textCode.html?time=<%=System.currentTimeMillis()%>"
                                                                width="120px" height="44px"/></a>
                    </div>


                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success  btn-lg btn-block">Submit</button>
                        </div>
                    </div>

                </s:form>

            </div>
        </div>
        <div class="col-sm-3"></div>
    </div>
</div>

<script type="text/javascript">

    function changeImg() {
        var src1 = document.getElementById("imgObj").src;
        document.getElementById("imgObj").src = chgUrl(src1);
    }

    //时间戳
    //为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
    function chgUrl(url) {
        var timestamp = (new Date()).valueOf();
        url = url.substring(0, url.indexOf('?'));
        if ((url.indexOf("&") >= 0)) {
            url = url + "×tamp=" + timestamp;
        } else {
            url = url + "?timestamp=" + timestamp;
        }
        return url;
    }

</script>