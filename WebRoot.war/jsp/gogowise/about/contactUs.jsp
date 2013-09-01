<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<link href="css/about/about.css" rel="stylesheet" type="text/css"/>

<div class="auright">
    <div class="rtHead">
        <h3><s:property value="%{getText('nav.contact.us')}"/></h3>
        <div class="cascade">
            <span><s:property value="%{getText('nav.current.pos')}"/>：</span>
            <a href="index.html"><s:property value="%{getText('label.homepage')}"/></a>
            <span> > </span>
            <span><s:property value="%{getText('link.about.us')}"/></span>
            <span> > </span>
            <span><s:property value="%{getText('nav.contact.us')}"/></span>
        </div>
    </div>
    <div class="rtCont">
        <p>
            <s:property value="%{getText('contact.us.1')}"/><br/>
            <s:property value="%{getText('contact.us.2')}"/><br/>
            <s:property value="%{getText('contact.us.3')}"/><br/>
        </p>


        <p>
            <s:property value="%{getText('contact.us.4')}"/><br/>
            <s:property value="%{getText('contact.us.5')}"/> <br/>
            <s:property value="%{getText('contact.us.6')}"/> <br/>
            <s:property value="%{getText('contact.us.7')}"/> <br/>
            <s:property value="%{getText('contact.us.8')}"/>
        </p>

        <p>
            <s:property value="%{getText('contact.us.9')}"/> <br/>
            <s:property value="%{getText('contact.us.10')}"/><br/>
            <s:property value="%{getText('contact.us.11')}"/><br/>
        </p>
    </div>
</div>