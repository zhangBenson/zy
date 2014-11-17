<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link href="css/org/orgMatters.css" rel="stylesheet" type="text/css"/>

<div id="orgmatter_container">
    <div class="orgmatter_innerContainer">
        <div class="orgm_headerWords">
            <p><s:text name="welcome.to.organization.center"/><span
                    class="welcome_org_name">&nbsp;<s:property value="org.schoolName"/></span></p>
        </div>
        <div class="orgm_options">
            <ul>

                <li>
                    <s:a action="initOrgCourseCreation"><h3><img src="images/org/arrow.png"/><span><s:text name="org.create.course"/></span></h3></s:a>
                    <p><s:text name="create.organization.courses"/></p>
                </li>

                <li>
                    <s:a action="maintenanceSearchResult"><h3><img src="images/org/arrow.png"/><span><s:text name="usermenu.item.coursemaintenance"/></span></h3></s:a>
                    <p><s:text name="adjust.your.organization.courses"/></p>
                </li>
                <li>
                    <s:a action="orgInfoUpdate"><h3><img src="images/org/arrow.png"/><span><s:text name="org.information.setting"/></span></h3></s:a>
                    <p><s:text name="org.information.setting.content"/></p>
                </li>
            </ul>
        </div>
    </div>
</div>
<s:if test="1 == orgRoleType">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#iniOrgLink').attr('disabled', true)
        })
    </script>
</s:if>
