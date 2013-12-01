<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<link href="css/about/about.css" rel="stylesheet" type="text/css"/>
<link href="css/about/team.css" rel="stylesheet" type="text/css"/>

<div class="auright">
    <div class="rtHead">
        <h3><s:property value="%{getText('nav.team.info')}"/></h3>
        <div class="cascade">
            <span><s:property value="%{getText('nav.current.pos')}"/>：</span>
            <a href="index.html"><s:property value="%{getText('label.homepage')}"/></a>
            <span> > </span>
            <span><s:property value="%{getText('link.about.us')}"/></span>
            <span> > </span>
            <span><s:property value="%{getText('nav.team.info')}"/></span>
        </div>
    </div>

    <div class="rtCont">
        <div class="founder_box fl">
            <div class="fl img_wrapper">
                <img src="images/about/Zeng_Zeng.jpg" alt="曾锃">
            </div>
            <div class="fl desc_wrapper">
                <h2 class=""><strong>Zeng Zeng</strong></h2>
                <h3 class="orange">Founder and CEO</h3>
                <p class="founder_box_desc">
                    Zeng Zeng received the Ph.D. in electrical and computer engineering from The National University of Singapore, in 2005. He received his BS and MS degrees in automatic control from Huazhong University of Science and Technology, Wuhan, P.R. China, in 1997 and 2000, respectively. His research interests include cloud education and training, cloud computing/storage, distributed/grid computing systems, multimedia storage systems, and controller area networks.
                    <br/>Having worked as an associate professor at Hunan University and now a senior research fellow at The National University of Singapore, Zeng is spearheading the setup of Gogowise’s headquarters in Singapore. Under his leadership, the company was recently awarded the iJAM funding from the Media Development Authority of Singapore.
                </p>
        </div>
        </div>
        <div class="founder_box fl">
            <div class="fl img_wrapper">
                <%--<img src="images/about/Zhan_Lin.jpg" alt="张林">--%>
            </div>
            <div class="fl desc_wrapper">
                <h2 class=""><strong>Jeremy Heng</strong></h2>
                <h3 class="orange">Co-founder and Director</h3>
                <p class="founder_box_desc">
                    Jeremy graduated from National University of Singapore with a B. Eng and did his MBA at Nanyang Technological University. He is currently the deputy director at Advanced Digital Sciences Center and is responsible for the day-to-day operations and commercialization of its technologies. Over the years, he has been involved in a number of start-ups and has worked with them to provide guidance in terms of strategy and fundraising. With Jeremy’s exposure in the regional start-up scene, his role in the Gogowise founding team is irreplaceable. Leading the business team, he seamlessly complements Dr Zeng’s technical expertise.
                </p>
            </div>
        </div>
        <%--<div class="founder_box fl">--%>
            <%--<div class="fl img_wrapper">--%>
                <%--<img src="images/about/Chen_Hailin.jpg" alt="陈海林">--%>
            <%--</div>--%>
            <%--<div class="fl desc_wrapper">--%>
                <%--<h2 class=""><strong>陈海林</strong></h2>--%>
                <%--<h3 class="orange">高级软件开发工程师</h3>--%>
                <%--<p class="founder_box_desc">--%>
                    <%--毕业于湖南大学，获得信息科学与工程学士学位。<br/>--%>
                    <%--2010年至2011年担任达内java培训小组负责人。 <br/>--%>
                    <%--2011年获批国家工信部高级软件工程师认证。先后参与了“长沙313计划”重点项目、网上购物系统EC-Portal等大型项目的开发。 <br/>--%>
                    <%--2011年8月份正式加入知金电子科技有限公司，现任武汉知宝科技有限公司开发部主管，负责系统网站整体开发和管理。<br/>--%>
                <%--</p>--%>
            <%--</div>--%>
        <%--</div>--%>
        <div class="founder_box fl">
            <div class="fl img_wrapper">
                <%--<img src="images/about/Wang_Chengan.jpg" alt="王成安">--%>
            </div>
            <div class="fl desc_wrapper">
                <h2 class=""><strong>Dr. Zeng Lingfang</strong></h2>
                <h3 class="orange">Co-founder and System Architect</h3>
                <p class="founder_box_desc">
                    Zeng Lingfang received his B.S. in applied computer from Huazhong University of Science and Technology (HUST), Wuhan, China in 2000, M.S. in applied computer from China University of Geoscience, China in 2003 and PhD in computer architecture, from HUST in 2006. His research interests include data center technology, cloud computing, in-memory computing and ubiquitous location-aware computing. He is currently with Wuhan National Lab for Optoelectronics, and School of Computer, HUST, as an associate professor.
                </p>
            </div>
        </div>
        <div class="founder_box fl">
            <div class="fl img_wrapper">
                <%--<img src="images/about/Wang_Yanmin.jpg" alt="王艳敏">--%>
            </div>
            <div class="fl desc_wrapper">
                <h2 class=""><strong>Dr. Zhang Wei</strong></h2>
                <h3 class="orange">Co-founder and IE Scientist</h3>
                <p class="founder_box_desc">
                    Zhang Wei obtained the Ph.D in computer science from National University of Singapore in 2013. He received BE from Harbin Institute of Technology in 2008. His research interests include Information Extraction and Web Search. He had published 8 papers in the top international conference. He also was involved in the industry projects funded by Microsoft, Baidu or NUS. His IE system achieves second best performance in the international IE competition organised by NIST, US.
                </p>
            </div>
        </div>
        <div class="founder_box fl">
            <div class="fl img_wrapper">
                <%--<img src="images/about/Yuan_Yongzhi.jpg" alt="苑永志">--%>
            </div>
            <div class="fl desc_wrapper">
                <h2 class=""><strong>Tan Hui (Robyn)</strong></h2>
                <h3 class="orange">Business Development Assistant</h3>
                <p class="founder_box_desc">
                    Robyn graduated from Singapore Management University with a BS degree in Economics in 2012. Her interest in developing ideas has drawn her to the startup scene in 2011. The roles she adopted in the various startup teams previously mainly focused on design, marketing and business development. Keen to further hone her skills, she joined the Gogowise team under the mentorship of Dr Zeng Zeng and Jeremy to manage the business side of matters in the company.
                </p>
          </div>
        </div>
         <%--<div class="founder_box fl">--%>
            <%--<div class="fl img_wrapper">--%>
                <%--<img src="images/about/Zhou_LingMin.jpg" alt="周伶敏">--%>
            <%--</div>--%>
            <%--<div class="fl desc_wrapper">--%>
                <%--<h2 class=""><strong>周伶敏</strong></h2>--%>
                <%--<h3 class="orange">财务主管</h3>--%>
                <%--<p class="founder_box_desc">--%>
                    <%--毕业于湖南大学工商管理学院，会计专业。</br>--%>
                    <%--获得湖南大学工商管理学院会计硕士学位。--%>
                <%--</p>--%>
          <%--</div>--%>
        <%--</div>--%>

    </div>
</div>