<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<link type="text/css" href="css/onlive/liveChannelBlog.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery.rate.js"></script>
<script type="text/javascript" src="js/jquery.blockUI.js"></script>

<div class="ltb_cont">

    <div class="lcb_left fl">
        <s:hidden value="%{#session.userID}" id="hidSessionId"/>
        <div class="term_info fl">
            <div class="img_wrap fl">
                <img id="share_pic" src="<s:property value="liveChannel.logoUrl"/>"/>
            </div>
            <div class="title fl"><h2 id="share_title"><s:property value="liveChannel.name"/></h2></div>
            <div class="basic">
                <p><span><s:date name="liveChannel.createTime" format="%{getText('dateformat.forclass')}" /></span><span>已开办<s:property value="liveChannel.totalTermsNum"/>期&nbsp;|&nbsp;<s:property value="liveChannel.fansNum"/>人关注</span></p>
                <p><s:property value="%{getText('onlive.host.name')}" />&nbsp;<span class="orWord_large">2.5</span>选手&nbsp;<span class="orWord_large">4.7</span>嘉宾&nbsp;<span class="orWord_large">3.7</span></p>
                <p>
                    <s:if test="!focused">
                             <a href="javascript:;" onclick="setUser2LiveFollower(this);" class="focus">关注</a>
                    </s:if>
                    <s:else>
                            <a href="javascript:;" onclick="setUser2LiveFollower(this);" class="focus">已关注</a>
                    </s:else>
                </p>
            </div>
            <div style="display:none;" id="share_desc"><s:property value="liveChannel.description"/></div>
            <div class="operate">
                <a href="javascript:;" class="act_btn host_btn"><s:property value="%{getText('live.term.blog.be.host')}" /></a>
                <a href="javascript:;" class="act_btn player_btn"><s:property value="%{getText('live.term.blog.be.contestant')}" /></a>
                <a href="javascript:;" class="act_btn guest_btn"><s:property value="%{getText('live.term.blog.be.guest')}" /></a>
            </div>
            <div class="list_share fl">
                <div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare" data="">
                    <%--<span style="float:left;line-height: 30px;margin-left: 10px;"><s:property value="%{getText('label.shared.with')}"/>：</span>--%>
                    <a class="bds_qzone"></a>
                    <a class="bds_tsina"></a>
                    <a class="bds_tqq"></a>
                    <a class="bds_renren"></a>
                    <a class="bds_fbook"></a>
                    <a class="bds_twi"></a>
                    <span class="bds_more"><s:property value="%{getText('others.more')}"/></span>
                </div>
                <script type="text/javascript" id="bdshare_js" data="type=tools" ></script>
                <script type="text/javascript" id="bdshell_js"></script>
                <script type="text/javascript">
                var share_title = document.getElementById("share_title").innerText+"@GoGoWise"+"  <s:text name="onlive.default.recommend.sentence"/>";
                var share_pic =  document.getElementById("share_pic").src;
                var share_comment = "<s:text name="onlive.default.recommend.sentence"/>";
                var share_desc = document.getElementById("share_desc").innerText;

                var _data = "{'text':'"+share_title + "',"+
                        "'comment':'"+share_comment + "',"+
                        "'url':'"+window.location.href+"'}";

                document.getElementById("bdshare").setAttribute("data",_data);


                var bds_config = {'bdText':share_title,
                    'bdDesc':share_desc, //qq，开心
                    'bdComment':share_comment,
                    'bdPopTitle':'GoGoWise Share',
                    'bdPic':share_pic
                };
                document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + new Date().getHours();
            </script>
            </div>
        </div>
        <div class="term_desc">
            <h3>栏目详情</h3>
            <p>
               <s:property value="liveChannel.description"/>
            </p>
        </div>
        <div class="other_terms fl">
            <h3><s:property value="%{getText('live.term.blog.other.terms')}" /></h3>
            <div class="term_scroll">
                    <div class="scroll_left">
                        <a href="#" id="left_scroll_btn"></a>
                    </div>
                    <div class="scroll_center">
                        <ul id="scroll_list_ul">
                           <s:iterator value="liveChannel.channelTermses">
                               <li>
                                    <a href="liveTermBlog.html?channelTerms.id=<s:property value="id"/>" title="<s:property value="subTitle"/>"><img src="<s:property value="logoUrl"/>" alt="<s:property value="subTitle"/> "></a>
                                    <p><a href="liveTermBlog.html?channelTerms.id=<s:property value="id"/>" title="<s:property value="subTitle"/>"><s:property value="subTitle"/> </a></p>
                                    <p><span class="cnum"><s:date name="startTime" format="%{getText('dateformat.forclass')}" /></span></p>
                                </li>
                           </s:iterator>
                        </ul>
                    </div>
                    <div class="scroll_right">
                        <a href="javascript:;" id="right_scroll_btn"></a>
                    </div>
            </div>
        </div>
        <div class="message_box">
            <h3><s:property value="%{getText('blog.message.board')}"/></h3>
            <div class="cont_out">
                <textarea id="message_textarea"></textarea>
                <a href="javascript:;" class="submit_btn" onclick="submitComment(<s:property value="liveChannel.id"/>);"><s:property value="%{getText('button.submit')}"/></a>
                <div id="message_list_ul">
                    <s:iterator value="liveChannelComments">
                        <p>
                            <img src="<s:property value="commenter.pic"/>"/>
                            <a href="javascript:;" class="nick_name"><s:property value="commenter.nickName"/></a>
                            <span class="span_out">
                                <span class="span1"><s:property value="content"/></span>
                                <s:if test="liveChannel.creator.id == #session.userID && commenter.id != #session.userID">
                                    <a class="span2" href="javascript:;" onclick="replyToComment('<s:property value="commenter.nickName"/>',<s:property value="commenter.id"/>);"><s:property value="%{getText('blog.comments.reply')}"/></a>
                                    <a class="span2" href="javascript:;" onclick="deleteThisComment(this,<s:property value="id"/>);"><s:property value="%{getText('blog.comments.delete')}"/></a>
                                </s:if>
                                <s:elseif test="liveChannel.creator.id != #session.userID && commenter.id != #session.userID">
                                    <a class="span2" href="javascript:;" onclick="replyToComment('<s:property value="commenter.nickName"/>',<s:property value="commenter.id"/>);"><s:property value="%{getText('blog.comments.reply')}"/></a>
                                </s:elseif>
                                <s:else>
                                    <a class="span2" href="javascript:;" onclick="deleteThisComment(this,<s:property value="id"/>)"><s:property value="%{getText('blog.comments.delete')}"/></a>
                                </s:else>
                                <span class="span3"><s:date name="commentTime" format="%{getText('global.display.datetime')}"/></span>
                            </span>
                        </p>
                    </s:iterator>

                     <s:if test="commentsNum != 0">
                            <s:if test="!commentsNumOverflow">
                                <a href="javascript:;" class="more_or_close" onclick="getMoreComments();"><s:property value="%{getText('blog.comments.more.result')}"/>&gt;&gt;</a>
                            </s:if>
                            <s:elseif test="commentsNumOverflow && commentsNum>=10">
                                <a href="javascript:;" class="more_or_close" onclick="rollBack();">&lt;&lt;<s:property value="%{getText('blog.comments.rollBack')}"/></a>
                            </s:elseif>
                     </s:if>
                    <script type="text/javascript">
                            function getMoreComments(){
                                $.post("moreLiveChannelComments.html",{'liveChannel.id':<s:property value="liveChannel.id"/>,'commentsNum':<s:property value="commentsNum"/>},function(data){
                                    $("#message_list_ul").html(data);
                                });
                            }

                            function rollBack(){
                                $.post("moreLiveChannelComments.html",{'liveChannel.id':<s:property value="liveChannel.id"/>,'commentsNum':0},function(data){
                                    $("#message_list_ul").html(data);
                                });
                            }
                    </script>
                </div>
            </div>
        </div>
    </div>



    <div class="lcb_right fr">
        <div class="fans lcb_round persons">
            <h4><s:property value="liveChannel.fansNum"/>人已关注</h4>
            <ul>
                <s:iterator value="onliveFollowers">
                        <li class="imgLi"><a href="userBlog.html?user.id=<s:property value="channelTerms.host.id"/>"  title='<s:property value="channelTerms.host.nickName"/>'><img src="images/tmp/p1.jpg"/></a></li>
                </s:iterator>
                <s:if test="liveChannel.fansNum>8">
                    <li class="li_more"><a href="javascript:;">更多&nbsp;↓</a></li>
                </s:if>
            </ul>
        </div>
        <div class="fans lcb_round persons">
            <h4>参与主持</h4>
            <ul>
                <s:iterator value="liveChannel.allHosts">
                   <li class="imgLi"><a href="userBlog.html?user.id=<s:property value="id"/>"  title='<s:property value="nickName"/>'><img src="<s:property value="pic"/>"/></a></li>
                </s:iterator>
                <s:if test="liveChannel.allHostsNum > 8">
                   <li class="li_more"><a href="javascript:;">更多&nbsp;↓</a></li>
                </s:if>
            </ul>
        </div>
        <div class="fans lcb_round persons">
            <h4>参与嘉宾</h4>
            <ul>
              <s:iterator value="liveChannel.allContestants">
                   <li class="imgLi"><a href="userBlog.html?user.id=<s:property value="id"/>"  title='<s:property value="nickName"/>'><img src="<s:property value="pic"/>"/></a></li>
                </s:iterator>
                <s:if test="liveChannel.allContestantsNum > 8">
                   <li class="li_more"><a href="javascript:;">更多&nbsp;↓</a></li>
                </s:if>
            </ul>
        </div>
        <div class="fans lcb_round persons">
            <h4>参与选手</h4>
            <ul>
              <s:iterator value="liveChannel.allGuests">
                   <li class="imgLi"><a href="userBlog.html?user.id=<s:property value="id"/>"  title='<s:property value="nickName"/>'><img src="<s:property value="pic"/>"/></a></li>
              </s:iterator>
              <s:if test="liveChannel.allGuestsNum > 8">
                   <li class="li_more"><a href="javascript:;">更多&nbsp;↓</a></li>
                </s:if>
            </ul>
        </div>
        <div class="news lcb_round">
            <h4>直播新鲜事</h4>
            <ul class="list03 fblue">
                <s:iterator value="liveChannelNewEvents">
                    <li><a href="liveChannelEventRead.html?liveChannelNewEvent.id=<s:property value="id"/>"><s:property value="title"/></a></li>
                </s:iterator>
            </ul>
        </div>
        <div class="hot_terms lcb_round">
            <h4>热门栏目</h4>
            <ul>
                <s:iterator value="liveChannels">
                    <li class="imgLi">
                        <a class="up" href="liveChannelBlog.html?liveChannel.id=<s:property value="id"/>"><img src="<s:property value="logoUrl"/>"/></a>
                        <a class="down" href="liveChannelBlog.html?liveChannel.id=<s:property value="id"/>"><s:property value="name"/></a>
                    </li>
                </s:iterator>
                <li class="li_more"><a href="javascript:;">更多&nbsp;↓</a></li>
            </ul>
        </div>
        <div class="ads"></div>
        <div class="ads"></div>
        <div class="ads"></div>
    </div>


</div>

<script type="text/javascript">

    $(function(){
        var ff = new SellerScroll({
            lButton: "left_scroll_btn",
            rButton: "right_scroll_btn",
            oList: "scroll_list_ul",
            showSum: 4    //一次滚动多少个items
        });
    });


    function  setUser2LiveFollower(obj){
        if(validateLogo()) {
            $.post("addUser2LiveFollower.html",{'liveChannel.id':<s:property value="liveChannel.id"/>});
            $.fancybox({
                overlayShow:true,
                showCloseButton:true,
                content:"<div style='height: 40px;width: 300px;'><p align='center' style='line-height: 40px;'>成功添加关注！ &nbsp;&nbsp; <a href='javascript:;' onclick='$.fancybox.close();'></a></p></div>",
                onComplete: function(){ setTimeout("$.fancybox.close();","2000")}
            });
           $(obj).html("已关注");
        }
    }

    function submitComment(liveChannelID){
        if(validateLogo()){
            var messageText = $("#message_textarea").val();
            if(messageText == ""){
                $("#message_area_tip").html("<s:text name='blog.left.message.empty'/>");
                return;
            }
            $.post("saveLiveChannelComment.html",{'liveChannel.id':liveChannelID,'liveChannelComment.content':messageText,'commentsNum':<s:property value="commentsNum"/>},function(data){
                $("#message_list_ul").html(data);
            });
            $("#message_textarea").attr('value',"");
            $("#message_area_tip").html("");

        }
    }

     function replyToComment(nickName,userID){
        var prefixStr = "<s:text name='blog.message.reply'/>";
        $("#message_textarea").val(prefixStr+nickName+": ");
        $("#message_textarea").focus();
        $.post("putUserIDtoSession.html",{'user.id':userID},function(data){});
     }
     function deleteThisComment(obj,commentId){
        $(obj).parents("li.li_out").remove();
        $.post("deleteLiveChannelComment.html",{'liveChannelComment.id':commentId},function(data){});
     }

    var SellerScroll = function(options) {
        this.SetOptions(options);
        this.lButton = this.options.lButton;
        this.rButton = this.options.rButton;
        this.oList = this.options.oList;
        this.showSum = this.options.showSum;

        this.iList = $("#" + this.options.oList + " > li");
        this.iListSum = this.iList.length;
        this.iListWidth = this.iList.outerWidth(true);
        this.moveWidth = this.iListWidth * this.showSum;

        this.dividers = Math.ceil(this.iListSum / this.showSum);	//共分为多少块
        this.moveMaxOffset = (this.dividers - 1) * this.moveWidth;
        this.LeftScroll();
        this.RightScroll();
    };
    SellerScroll.prototype = {
        SetOptions: function(options) {
            this.options = options;
            $.extend(this.options, options || {});
        },
        ReturnLeft: function() {
            return isNaN(parseInt($("#" + this.oList).css("left"))) ? 0 : parseInt($("#" + this.oList).css("left"));
        },
        LeftScroll: function() {
            if (this.dividers == 1) return;
            var _this = this, currentOffset;
            $("#" + this.lButton).click(function() {
                currentOffset = _this.ReturnLeft();
                if (currentOffset == 0) {
                    for (var i = 1; i <= _this.showSum; i++) {
                        $(_this.iList[_this.iListSum - i]).prependTo($("#" + _this.oList));
                    }
                    $("#" + _this.oList).css({ left: -_this.moveWidth });
                    $("#" + _this.oList + ":not(:animated)").animate({ left: "+=" + _this.moveWidth }, { duration: "slow", complete: function() {
                        for (var j = _this.showSum + 1; j <= _this.iListSum; j++) {
                            $(_this.iList[_this.iListSum - j]).prependTo($("#" + _this.oList));
                        }
                        $("#" + _this.oList).css({ left: -_this.moveWidth * (_this.dividers - 1) });
                    } });
                } else {
                    $("#" + _this.oList + ":not(:animated)").animate({ left: "+=" + _this.moveWidth }, "slow");
                }
            });
        },
        RightScroll: function() {
            if (this.dividers == 1) return;
            var _this = this, currentOffset;
            $("#" + this.rButton).click(function() {
                currentOffset = _this.ReturnLeft();
                if (Math.abs(currentOffset) >= _this.moveMaxOffset) {
                    for (var i = 0; i < _this.showSum; i++) {
                        $(_this.iList[i]).appendTo($("#" + _this.oList));
                    }
                    $("#" + _this.oList).css({ left: -_this.moveWidth * (_this.dividers - 2) });

                    $("#" + _this.oList + ":not(:animated)").animate({ left: "-=" + _this.moveWidth }, { duration: "slow", complete: function() {
                        for (var j = _this.showSum; j < _this.iListSum; j++) {
                            $(_this.iList[j]).appendTo($("#" + _this.oList));
                        }
                        $("#" + _this.oList).css({ left: 0 });
                    } });
                } else {
                    $("#" + _this.oList + ":not(:animated)").animate({ left: "-=" + _this.moveWidth }, "slow");
                }
            });
        }
    };
</script>