<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib prefix="sjr" uri="/struts-jquery-richtext-tags" %>


<style type="text/css" media="screen,print">


    .striped {
        background-color: #CCE8CF;
    }
</style>


<s:form>

    <div class="tabwidth">
    <table width="100%" height="30">
        <TR>
            <TD align="center">
                <s:textfield name="searchValue"/> <br/>
                <s:submit name="method" value="index" type="button">查找</s:submit>
                    <%-- MyBlog Page (进入我的博客页面) --%>
                <s:a action="blog">blog url(我的博客)
                    <s:param name="singUpInfo.id" value="1"/>
                </s:a> <br/>
                    <%-- signUp(报名页面） --%>
                <s:a action="initSingUp"> signup url(报名页面)
                    <s:param name="competition.id" value="1"/>
                    <s:param name="type" value="1"/>
                    <s:param name="singUpInfo.id" value="1"/>
                </s:a> <br/>
                    <%-- List All Competition Phases (列出所有的比赛场次) --%>
                <s:a action="listCompetitionPhase">list competiton(列出所有的比赛场次)</s:a> <br/>
                    <%-- Init Competitions information (初始化大赛信息) --%>
                <s:a action="initCompetition">initCompetition.html(设置大赛信息) <s:param name="competition.id" value="1"/>
                </s:a> <br/>
                    <%-- Init Competition Phases (初始化比赛阶段) --%>
                <s:a action="initCompetitionPhase">initCompetitionPhase.html(设置比赛阶段)<s:param name="competitionPhase.id"
                                                                                             value="1"/> </s:a> <br/>

                    <%-- Creat Competition Subject (创建大赛主题) --%>
                <s:a action="initSubject">initSubject.html(创建大赛主题)
                    <s:param name="subject.id" value="1"/></s:a> <br/>

                    <%-- Enter Vadio Page (进入视频界面) --%>
                <s:a action="openSession"> openSession url(进入视频界面)
                    <s:param name="competitionSession.id" value="1"/>
                </s:a> <br/>

                    <%-- Enter easyLogon Page(快速登录） --%>
                <s:a action="initlogon">initlogon.html(快速登录) </s:a> <br/>

                <s:a action="deployBeta">deployBeta.html(部署) </s:a> <br/>

                <s:a action="viewLog">viewLog.html(查看部署LOG) </s:a> <br/>

                <s:a action="initOrganization">initOrganization.html(组织机构注册) </s:a> <br/>
                <s:a action="initRecomendResponser">initRecomendResponser.html(推荐组织机构) </s:a> <br/>
                <s:a action="initChangeResponser">initChangeResponser.html(变更注册组织的负责人) </s:a> <br/>

            </TD>
                <%--<td>--%>
                <%--<sjr:tinymce--%>
                <%--id="richtextTinymceAdvancedEditor"--%>
                <%--name="echo"--%>
                <%--rows="10"--%>
                <%--cols="80"--%>
                <%--width="800"--%>
                <%--href="%{remoteurl}"--%>
                <%--editorLocal="de"--%>
                <%--editorTheme="advanced"--%>
                <%--editorSkin="o2k7"--%>
                <%--toolbarAlign="left"--%>
                <%--toolbarLocation="bottom"--%>
                <%--plugins="safari,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template"--%>
                <%--toolbarButtonsRow1="save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect"--%>
                <%--toolbarButtonsRow2="cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor"--%>
                <%--toolbarButtonsRow3="tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen"--%>
                <%--toolbarButtonsRow4="insertlayer,moveforward,movebackward,absolute,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,blockquote,pagebreak,|,insertfile,insertimage"--%>
                <%--onSaveTopics="submitRichtextForm"--%>
                <%--/>--%>

                <%--</td>--%>
        </TR>
    </table>

    <table>
        <tr>
            <td>
                <s:property value="logInfo" escape="false"/>
            </td>
        </tr>
    </table>
    <%--<table width="100%">--%>
    <%--<tr style="background-color:#8fbc8f;font-weight:bold">--%>
    <%--<td width="25%">组名111111111111</td>--%>
    <%--<td width="5%">类别</td>--%>
    <%--<td width="45%">描述</td>--%>
    <%--<td width="25%">操作</td>--%>
    <%--</tr>--%>
    <%--</table>--%>
    <%--<table width="100%" height="100%" id="tabList">--%>
    <%--<tr height="0px" style="margin:0px;border-style:none">--%>
    <%--<td width="25%"></td>--%>
    <%--<td width="5%"></td>--%>
    <%--<td width="45%"></td>--%>
    <%--<td width="25%"></td>--%>
    <%--</tr>--%>
    <%--<%=request.getSession().getAttribute("TestSession") %>--%>
    <%--555555--%>
    <%--<s:property value="userName"/>--%>

    <%--<s:iterator value="taobaoGroups" id="taobao" var="taobao">--%>

    <%--&lt;%&ndash;44444444444441111111111111&ndash;%&gt;--%>
    <%--&lt;%&ndash;<tiles:insertTemplate template="list.jsp">&ndash;%&gt;--%>
    <%--&lt;%&ndash;3333333333333&ndash;%&gt;--%>
    <%--&lt;%&ndash;<tiles:putAttribute name="groupInfo" value="${taobao}"/>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</tiles:insertTemplate>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</s:iterator>&ndash;%&gt;--%>
    <%--&lt;%&ndash;777777777777&ndash;%&gt;--%>


    <%--<table>--%>
    <%--<tr>--%>
    <%--<td>--%>
    <%--<s:if test="pagination.hasPre">--%>
    <%--<s:url id="url_pre" value="search.html">--%>
    <%--<s:param name="pagination.pageNow" value="pagination.pageNow-1"></s:param>--%>
    <%--<s:param name="searchValue" value="searchValue"></s:param>--%>
    <%--</s:url>--%>
    <%--<s:a href="%{url_pre}">上一页</s:a>--%>
    <%--</s:if>--%>
    <%--<s:if test="pagination.hasNext">--%>
    <%--<s:url id="url_next" value="search.html">--%>
    <%--<s:param name="pagination.pageNow" value="pagination.pageNow+1"></s:param>--%>
    <%--<s:param name="searchValue" value="searchValue"></s:param>--%>
    <%--</s:url>--%>
    <%--<s:a href="%{url_next}">下一页</s:a>--%>
    <%--</s:if>--%>
    <%--</td>--%>
    <%--</tr>--%>
    <%--</table>--%>

    <%--</div>--%>

    <script type="text/javascript">
        $("table#tabList tr:nth-child(even)").addClass("striped")
    </script>
</s:form> 
