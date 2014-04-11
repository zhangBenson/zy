<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>


<s:fielderror/>
<s:form enctype="multipart/form-data">

    <s:hidden name="competition.id"/>
    <s:hidden name="competition.logoUrl"/>
    <p>
        创建大赛：</p>

    <p>
        大赛名称：<s:textfield name="competition.name"/></p>

    <p>
        上传LOGO： <s:file name="upload" id="updateFile"/></p>

    <p>
    <table>
        <tr>
            <td>
                <table>
                    开始时间: <s:textfield name="competition.startDate"
                                       value="%{getText('global.date',{competition.startDate})}" id="startDate"
                                       readonly="true" cssClass="date"/>
                </table>
            </td>
            <td>
                结束时间：<s:textfield name="competition.endDate" value="%{getText('global.date',{competition.endDate})}"
                                  id="endDate" readonly="true" cssClass="date"/>
            </td>
        </tr>
    </table>

    </p>

    <p>
    <table>
        <tr>
            <td>
                <table>
                    报名开始时间: <s:textfield name="competition.singUpStartDate"
                                         value="%{getText('global.date',{competition.singUpStartDate})}"
                                         id="singUpStartDate" readonly="true" cssClass="date"/>
                </table>
            </td>
            <td>
                报名结束时间：<s:textfield name="competition.singUpEndDate"
                                    value="%{getText('global.date',{competition.singUpEndDate})}" id="singUpEndDate"
                                    readonly="true" cssClass="date"/>
            </td>
        </tr>
    </table>

    </p>
    <p>
        简介：<s:textarea name="competition.brief" cols="20" rows="3"/> </textarea></p>

    <p>

    <p>
        描述：<s:textarea name="competition.description" cols="20" rows="5"/> </textarea></p>

    <p>
    </p>
    <s:submit name="singUp" action="saveCompetition" value="提交"></s:submit></p>
    <s:a href=""/>

</s:form>