<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>



<script type="text/javascript">

    $(document).ready(function() {
        new iScroll('stundioWrapper');
        new iScroll('chatWrapper');
        $("#btnaddUser").click(function() {
            addUser();
        });
    });


    document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
    document.addEventListener('DOMContentLoaded', function () { setTimeout(loaded, 200); }, false);

    /*function addUser()
    {

        var domObject = $("#stundioWrapper ul li li");
        $("#testDiv").html(domObject);
        alert(domObject);
    }*/

</script>

<style type="text/css" media="all">

    #stundioWrapper {
        position:  relative;
        left:0;
        width:100%;
        overflow:auto;
    }

    #stundioWrapper ul
    {
        list-style:none;
        padding:0;
        margin:0;
        width:100%;
    }

    #chatWrapper {
        position:  relative;
        left:0;
        width:100%;
        overflow:auto;
    }

    #chatWrapper ul
    {
        list-style:none;
        padding:0;
        margin:0;
        width:100%;
    }
    #sortable { list-style-type: none; margin: 0; padding: 0; width: 385px; }
    #sortable li { margin: 3px 3px 3px 0; padding: 1px; float: left; width: 88px; height: 90px; font-size: 4em; text-align: center; background-color: transparent;border-width: 0px;}



</style>

<%--<title>VirtualClassroom</title>

</head>
<body>
<input type="button" id="btnaddUser"  value="test">
<div id="testDiv"></div>
<div style="height: 100px;">
    <div class="btn-group" data-toggle="buttons">
        <label class="btn btn-primary">
            <input type="checkbox">进入用户</label>
        <label class="btn btn-primary">
            <input type="checkbox">退出用户</label>
        <label class="btn btn-primary">
            <input type="checkbox">发布聊天</label>
    </div>
</div>

<div id="top"></div>--%>
<div class="container">
    <div class="thinline"></div>
    <div class="pull-left">
        <div class="classVedioPanel" id="videodiv" style="dislay:block;border-color: #999;border-width: 1px;border-style:  solid;border-spacing: 15px;border-radius: 6px;">
            <script type="text/javascript">
                swfobject.embedSWF("../../images/course/Teacher_1.swf", "videodiv", "720", "540", "9.0.0");
            </script>
            <%--<img src="../../images/course/vediotemp.jpg" alt="" style="border-color: #999;border-width: 1px;border-style:  solid;border-spacing: 15px;border-radius: 6px;">--%>
        </div>
    </div>
    <div class="pull-right">
        <div class="classBasePanel">
            <div id="studiowindow">
                <div class="classPanleHead">
                    <div class="classPanleTitle">Studio List</div>
                </div>
                <div class="classPanleBody" >
                    <p></p>
                    <div id="stundioWrapper" style="width: 100%; height: 220px; overflow: auto;">
                        <ul>
                            <li>
                                <ul id="sortable">
                                    <li class="ui-state-default">
                                        <div class="studioPortraitPanel">
                                            <img src="../../images/course/portrait1.jpg" alt="">
                                            <p>Name</p>
                                        </div>
                                    </li>
                                    <li class="ui-state-default">
                                        <div class="studioPortraitPanel">
                                            <img src="../../images/course/portrait2.jpg" alt="">
                                            <p>Name</p>
                                        </div>
                                    </li>
                                    <li class="ui-state-default">
                                        <div class="studioPortraitPanel">
                                            <img src="../../images/course/portrait3.jpg" alt="">
                                            <p>Name</p>
                                        </div>
                                    </li>
                                    <li class="ui-state-default">
                                        <div class="studioPortraitPanel">
                                            <img src="../../images/course/portrait4.jpg" alt="">
                                            <p>Name</p>
                                        </div>
                                    </li>
                                    <li class="ui-state-default">5</li>
                                    <li class="ui-state-default">6</li>
                                    <li class="ui-state-default">7</li>
                                    <li class="ui-state-default">8</li>
                                    <li class="ui-state-default">9</li>
                                    <li class="ui-state-default">10</li>
                                </ul>
                                <div class="clearfix"></div>
                            </li>

                        </ul>
                    </div>

                </div>
            </div>
            <br/>
            <div id="chatWindow">

                <div class="classPanleHead">
                    <div class="classPanleTitle">Chat</div>
                </div>

                <div class="classPanleBody">
                    <div id="chatWrapper" style="width: 100%; height: 235px; overflow: auto;">
                        <ul>
                            <li>
                                <!--left message-->
                                <div  class="chatMessage">
                                    <div class="pull-left" style="width:70px;">
                                        <img class="chatPortraitImg" src="../../images/course/portrait4.jpg"  />
                                        <div class="chatPortraitTitle">Name</div>
                                    </div>
                                    <div style="width: 290px;" class="pull-left">
                                        <div class="chatContent">
                                            I liked it becaug. hahaI liked it becaug. hahaI likedI liked it becaug. hahaI liked it becaug. hahaI liked it becaug. I liked it becaug. hahaI liked it becaug. hahaI liked it becaug.
                                        </div>
                                    </div>

                                </div>

                                <div class="clearfix"></div>
                                <!--right message-->
                                <div  class="chatMessage">
                                    <div class="pull-right" style="width:70px;">
                                        <img class="chatPortraitImg" src="../../images/course/portrait4.jpg"  />
                                        <div class="chatPortraitTitle">Name</div>
                                    </div>
                                    <div style="width: 290px;" class="pull-right">
                                        <div class="chatContent">
                                            I liked it becaug. hahaI liked it becaug. hahaI liked it becaug.
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <!--left message-->
                                <div  class="chatMessage">
                                    <div class="pull-left" style="width:70px;">
                                        <img class="chatPortraitImg" src="../../images/course/portrait4.jpg"  />
                                        <div class="chatPortraitTitle">Name</div>
                                    </div>
                                    <div style="width: 290px;" class="pull-left">
                                        <div class="chatContent">
                                            I liked it becaug. hahaI liked it becaug. hahaI liked it becaug. hahaI liked it becaug. hahaI liked it becaug. hahaI liked it becaug. hahaI liked it becaug. haha
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </li>
                        </ul>
                    </div>

                    <div class="splitLineGray"></div>

                    <div class="input-group" style="padding: 7px;">
                        <input type="text" class="form-control">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">Send</button>
							</span>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<%--
<div id="detailfooters"></div>--%>
