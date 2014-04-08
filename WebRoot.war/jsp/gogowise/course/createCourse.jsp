<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<style type="text/css">
    #now {
        background: url(images/navigation-menu2.gif) bottom repeat-x;
        color: #fff;
    }

    #tabtitle {
        float: left;
        overflow: hidden;
        list-style: none;
        margin: 0;
        padding: 0;
        margin-left: 5px;
    }

    #tabtitle li {
        width: 120px;
        height: 25px;
        line-height: 24px;
        float: left;
        text-align: center;
        margin-right: 2px;
        list-style: none;
        font-size: 14px;
        font-weight: bold;
    }

    #tabtitle li a:link, #tabtitle li a:visited {
        text-decoration: none;
        background: url(images/navigation-menu4.gif) repeat-x bottom;
        display: block;
        width: 120px;
        height: 25px;
        color: #fff;
    }

    #tabtitle li a:hover, #tabtitle li a:active {
        background: url(images/navigation-menu5.gif) bottom repeat-x;
        color: #fff;
    }

    #html_1 {
        width: 800px;
        word-wrap: break-word;
        padding: 3px;
        float: left;
    }

    #rightcontent {
        border: 0px;
        width: 810px;
    }

    .mycompetition td {
        height: 30px;
    }
</style>

<link type="text/css" href="css/view.css" rel="stylesheet"/>
<script type="text/javascript" src="js/view.js"></script>
<div id="rightcontent">

    <div id="html_1">
        <div id="sinupfirst">
            <img id="top" src="images/form/top.png" alt="">

            <div id="form_container">
                <h1><a>&nbsp;Gogowise</a></h1>

                <div class="appnitro">

                    <s:form action="initCourse" method="POST" id="form_278125">
                        <div class="form_description">
                            <h2><s:property value="%{getText('label.class.oline')}"/></h2>

                            <p><s:property value="%{getText('text.easy.study')}"/></p>
                        </div>
                        <ul>
                            <li id="li_1">
                                <label class="description"><s:property
                                        value="%{getText('label.chose.identity')}"/></label>
		      <span>
			       <input id="element_1_1" name="identity" class="element radio" type="radio" value="1"/>
                   <label class="choice" for="element_1_1"><s:property
                           value="%{getText('label.org.principal')}"/></label>
                   <input id="element_1_2" name="identity" class="element radio" type="radio" value="2"
                          checked="checked"/>
                   <label class="choice" for="element_1_2"><s:property value="%{getText('label.org.teacher')}"/></label>
                   <input id="element_1_3" name="identity" class="element radio" type="radio" value="3"/>
                   <label class="choice" for="element_1_3"><s:property value="%{getText('label.cameraman')}"/></label>
                   <input id="element_1_4" name="identity" class="element radio" type="radio" value="4"/>
                   <label class="choice" for="element_1_4"><s:property value="%{getText('label.org.tutor')}"/></label>
		      </span>
                            </li>
                            <li class="buttons">
                                <s:submit name="submit" id="saveForm" value="%{getText('button.next')}"
                                          class="button_text"/>
                            </li>
                        </ul>
                    </s:form>
                </div>
                <div id="footer">
                    <s:property value="%{getText('text.backto')}"/> <a href="http://www.gogowise.com"><s:property
                        value="%{getText('menu.item.index')}"/></a>
                </div>
            </div>
            <img id="bottom" src="images/form/bottom.png" alt="">
        </div>
    </div>
</div>

