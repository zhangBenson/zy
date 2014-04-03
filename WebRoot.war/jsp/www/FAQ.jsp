<script type="text/javascript">
    $(document).ready(function(){
        $("#btnQrganization").click(function(){
            $("#FAQtitle").text("Qrganization FAQ");
            $("#QuestionOrganizations").show();
            $("#QuestionTeachers").hide();
            $("#QuestionStudent").hide();
        });

        $("#btnLecturer").click(function(){
            $("#FAQtitle").text("Lecturer FAQ");
            $("#QuestionOrganizations").hide();
            $("#QuestionTeachers").show();
            $("#QuestionStudent").hide();
        });

        $("#btnStudent").click(function(){
            $("#FAQtitle").text("Student FAQ");
            $("#QuestionOrganizations").hide();
            $("#QuestionTeachers").hide();
            $("#QuestionStudent").show();

        });
        $("#FAQtitle").text("Student FAQ");
        $("#QuestionOrganizations").hide();
        $("#QuestionTeachers").hide();
        $("#QuestionStudent").show();
    })
</script>
<style type="text/css">
    .FAQname
    {
        color:#6ab600;font-size: 14px;font-family: Verdana, Geneva, sans-serif;word-spacing:3pt;line-height:20pt;
    }
    .icon1
    {
        color:#6ab600;margin-right: 10px;
    }
    .icon2
    {
        margin-right: 10px;
    }
    .index
    {
        margin-top: 30px;
        margin-bottom: 30px;
    }
    .FAQname a
    {
        color:#6ab600;
    }
</style>
<body>
<div class="container">
<div class="thinline"></div>
<div class="row">
<div class="col-sm-3">
    <div class="btn-group-vertical btn-block" style="margin-top: 25px;">
        <button type="button" class="btn btn-info btn-block" id="btnQrganization">
            <span class="glyphicon glyphicon-tower icon2"></span>
            Qrganization
        </button>
        <button type="button" class="btn btn-warning btn-block" id="btnLecturer">
            <span class="glyphicon glyphicon-home icon2"></span>
            Lecturer
        </button>
        <button type="button" class="btn btn-danger btn-block" id="btnStudent">
            <span class="glyphicon glyphicon-user icon2"></span>
            Student
        </button>
        <button type="button" class="btn btn-success btn-block" id="btnCourse" onclick="self.location='voaCourseBlog.html?course.id=60'">
            <span class="glyphicon glyphicon-question-sign icon2"></span>
            Help Course
        </button>
    </div>
</div>
<div class="col-sm-9">
<h1 class = "courseSubject" id="FAQtitle">FAQ</h1>
<h4 class="courseBody">
    Our support goal is to provide you great self-service tools that insure your success. Still need help after reading these? Submit a question through our Help Center.
</h4>

<div id="QuestionOrganizations">
<div class="index">
    <div class="FAQname">
        <a href="#title1">
            1.How can I join Gogowise platform and start teaching online?
        </a>
    </div>
    <div class="FAQname">
        <a href="#title2">2.How do I manage my staff and students on Gogowise?</a>
    </div>
    <div class="FAQname">
        <a href="#title3">3.How to create an online course?</a>
    </div>
    <div class="FAQname">
        <a href="#title4">4.Do I have to create courses one by one?</a>
    </div>
    <div class="FAQname">
        <a href="#title5">5.How to modify the courses you have created?</a>
    </div>
    <div class="FAQname">
        <a href="#title6">6.How do I upload my teaching materials for class?</a>
    </div>
    <div class="FAQname">
        <a href="#title7">7.How to use the videos from YouTube/Vimeo?</a>
    </div>
    <div class="FAQname">
        <a href="#title8">
            8.What is the format of the questions that can be used during teaching?
        </a>
    </div>
    <div class="FAQname">
        <a href="#title9">9.How to upload questionnaire files to Gogowise?</a>
    </div>
</div>
<!-- 1 -->
<div class="FAQcontent">
    <div class="FAQItem">
        <span class="glyphicon glyphicon-chevron-right icon1"></span>
        <span class="FAQname" id="title1">How can I join Gogowise platform and start teaching online?</span>
        <h4 class="courseBody">
            Answer: Thank you for your interest to join us. Please drop us an email at support@gogowise.com and our business team will contact you shortly. Once your account has been set up, you will receive your organization account, password, and the customized domain name on Gogowise. For example, if your organization is ABC, then the domain name of your organization on Gogowise will be ABC.GOGOWISE.COM.
        </h4>
    </div>
						<span style="font-size: 14px;color:#6ab600">
							<span class="glyphicon glyphicon-circle-arrow-up" style="font-size: 20px;color:#6ab600;margin-right: 10px;"></span>
							<a href="#FAQtitle" style="color:#6ab600;">Goto Top</a>
						</span>
</div>

<div class="imaginaryline"></div>
<!-- 2 -->
<div class="FAQcontent">
    <div class="FAQItem">
        <span class="glyphicon glyphicon-chevron-right icon1"></span>
        <span class="FAQname" id="title2">How do I manage my staff and students on Gogowise?</span>
        <h4 class="courseBody">
            Answer: Once you have received the organization account, you can log in at http://org.gogowise.com as an organization. Once you have logged in, you can proceed to appoint your staff and students.
            <br/>
            To manage your students, click on the “Student Management” button on the left under Org Matters -> Student Management as shown in the following:
            <br/>
            <img src="images/FAQimg/1.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;">
            <br/>
            To manage your students, click on the “Teacher Management” button on the left under Org Matters -> Teacher Management as shown in the following:
            <br/>
            <img src="images/FAQimg/2.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;width: 792px;height: 546px;"></h4>
    </div>
						<span style="font-size: 14px;color:#6ab600">
							<span class="glyphicon glyphicon-circle-arrow-up" style="font-size: 20px;color:#6ab600;margin-right: 10px;"></span>
							<a href="#FAQtitle" style="color:#6ab600;">Goto Top</a>
						</span>
</div>

<div class="imaginaryline"></div>
<!-- 3 -->
<div class="FAQcontent">
    <div class="FAQItem">
        <span class="glyphicon glyphicon-chevron-right icon1"></span>
        <span class="FAQname" id="title3">How to create an online course?</span>
        <h4 class="courseBody">
            Answer: Before you begin creating your first course, please make sure you have prepared these:
            <p></p>
            a) The logo of the course;
            <p></p>
            b) An abstract and detailed description of the course;
            <p></p>
            c) The lecturer in charge of the course has been appointed as a teacher in the Teacher Management page.



            Now, click the button on the left under Org Matter -> Create Courses as follows:
            <br/>
            <img src="images/FAQimg/3.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;width: 792px;height: 546px;"></h4>
    </div>
						<span style="font-size: 14px;color:#6ab600">
							<span class="glyphicon glyphicon-circle-arrow-up" style="font-size: 20px;color:#6ab600;margin-right: 10px;"></span>
							<a href="#FAQtitle" style="color:#6ab600;">Goto Top</a>
						</span>
</div>

<div class="imaginaryline"></div>
<div class="FAQcontent">
    <div class="FAQItem">
        <span class="glyphicon glyphicon-chevron-right icon1"></span>
        <span class="FAQname" id="title4">Do I have to create courses one by one?</span>
        <h4 class="courseBody">
            Answer: On the control panel on the left, click “My Created Course” under My Courses. Click on “Course info manage” under the course you would like to modify.
            <br/>
            <img src="images/FAQimg/4.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;width: 792px;height: 546px;">
            <br/>
            For example, if a course is held every Tuesday and Friday, 9:30pm to 10:30pm for 5 weeks, you can fill in the field as shown in below.
            <br/>
            <img src="images/FAQimg/5.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;width: 792px;height: 546px;"></h4>
    </div>
						<span style="font-size: 14px;color:#6ab600">
							<span class="glyphicon glyphicon-circle-arrow-up" style="font-size: 20px;color:#6ab600;margin-right: 10px;"></span>
							<a href="#FAQtitle" style="color:#6ab600;">Goto Top</a>
						</span>
</div>

<div class="imaginaryline"></div>
<div class="FAQcontent">
    <div class="FAQItem">
        <span class="glyphicon glyphicon-chevron-right icon1"></span>
        <span class="FAQname" id="title5">How to modify the courses you have created?</span>
        <h4 class="courseBody">
            Answer: On the control panel on the left, click “My Created Course” under My Courses. Click on “Course info manage” under the course you would like to modify.
            <br/>
            <img src="images/FAQimg/6.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;width: 792px;">
            <br/>
            Click on “Modify” to edit your course details, or simply click on the Class Info tab to edit the class schedule.
            <img src="images/FAQimg/7.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;	"></h4>
    </div>
						<span style="font-size: 14px;color:#6ab600">
							<span class="glyphicon glyphicon-circle-arrow-up" style="font-size: 20px;color:#6ab600;margin-right: 10px;"></span>
							<a href="#FAQtitle" style="color:#6ab600;">Goto Top</a>
						</span>
</div>
<div class="imaginaryline"></div>

<div class="FAQcontent">
    <div class="FAQItem">
        <span class="glyphicon glyphicon-chevron-right icon1"></span>
        <span class="FAQname" id="title6">How do I upload my teaching materials for class?</span>
        <h4 class="courseBody">
            Answer: There are two ways you can do so.
            <br/>
            Firstly, go to “My Created Course” and click on “Upload Course Resource”
            <br/>
            <img src="images/FAQimg/8.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;	">
            <br/>
            On this page you can see all the documents you have previously uploaded, and upload new materials if necessary.
            <br/>
            <img src="images/FAQimg/9.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;	">
            <br/>
            The second method to uploading materials will be to do so during class time.
            <br/>
            Once you have started class, you can click on the yellow button on the top to access the media drawer. Click on the file icon to access or upload your materials.
            <br/>
            <img src="images/FAQimg/10.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;"></h4>
    </div>
						<span style="font-size: 14px;color:#6ab600">
							<span class="glyphicon glyphicon-circle-arrow-up" style="font-size: 20px;color:#6ab600;margin-right: 10px;"></span>
							<a href="#FAQtitle" style="color:#6ab600;">Goto Top</a>
						</span>
</div>

<div class="imaginaryline"></div>

<div class="FAQcontent">
    <div class="FAQItem">
        <span class="glyphicon glyphicon-chevron-right icon1"></span>
        <span class="FAQname" id="title7">How to use the videos from YouTube/Vimeo?</span>
        <h4 class="courseBody">
            Answer: Once you are in the Virtual Classroom, click on the video icon, and fill in the link and name of the YouTube/Vimeo video you would like to show in class.
            <br/>
            <img src="images/FAQimg/11.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;">
            <br/>
            <img src="images/FAQimg/12.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;"></h4>
    </div>
						<span style="font-size: 14px;color:#6ab600">
							<span class="glyphicon glyphicon-circle-arrow-up" style="font-size: 20px;color:#6ab600;margin-right: 10px;"></span>
							<a href="#FAQtitle" style="color:#6ab600;">Goto Top</a>
						</span>
</div>

<div class="imaginaryline"></div>

<div class="FAQcontent">
    <div class="FAQItem">
        <span class="glyphicon glyphicon-chevron-right icon1"></span>
							<span class="FAQname" id="title8">
								What is the format of the questions that can be used during teaching?
							</span>
        <h4 class="courseBody">Answer: Click here to download the template.</h4>
    </div>
						<span style="font-size: 14px;color:#6ab600">
							<span class="glyphicon glyphicon-circle-arrow-up" style="font-size: 20px;color:#6ab600;margin-right: 10px;"></span>
							<a href="#FAQtitle" style="color:#6ab600;">Goto Top</a>
						</span>
</div>

<div class="imaginaryline"></div>

<div class="FAQcontent">
    <div class="FAQItem">
        <span class="glyphicon glyphicon-chevron-right icon1"></span>
        <span class="FAQname" id="title9">How to upload questionnaire files to Gogowise?</span>
        <h4 class="courseBody">
            Answer: There are two ways you can do so.
            <br/>
            Firstly, go to “My Created Course” and click on “Upload Course Resource”
            <br/>
            <img src="images/FAQimg/13.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;">
            <br/>
            On this page you can see all the documents you have previously uploaded, and upload new questions if necessary. Simply select “Question” under the Type.
            <br/>
            <img src="images/FAQimg/14.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;">
            The second method to uploading materials will be to do so during class time.
            <br/>
            Once you have started class, you can click on the yellow button on the top to access the media drawer. Click on the Questionnaire Bank icon to access or upload your materials.
            <img src="images/FAQimg/15.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;"></h4>

    </div>
						<span style="font-size: 14px;color:#6ab600">
							<span class="glyphicon glyphicon-circle-arrow-up" style="font-size: 20px;color:#6ab600;margin-right: 10px;"></span>
							<a href="#FAQtitle" style="color:#6ab600;">Goto Top</a>
						</span>
</div>

</div>

<div id="QuestionStudent">
    <div class="index">
        <div class="FAQname">
            <a href="#title_student1">
                1.How can I register for a class?
            </a>
        </div>
        <div class="FAQname">
            <a href="#title_student2">2.How do I attend class?</a>
        </div>
    </div>

    <div class="FAQcontent">
        <div class="FAQItem">
            <span class="glyphicon glyphicon-chevron-right icon1"></span>
            <span class="FAQname" id="title_student1">How can I register for a class?</span>
            <h4 class="courseBody">
                Answer: Simply go to the page of the course you are interested in, and click on “Register”<br/>
                <img src="images/FAQimg/21.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;">
            </h4>

        </div>
						<span style="font-size: 14px;color:#6ab600">
							<span class="glyphicon glyphicon-circle-arrow-up" style="font-size: 20px;color:#6ab600;margin-right: 10px;"></span>
							<a href="#FAQtitle" style="color:#6ab600;">Goto Top</a>
						</span>
    </div>
    <div class="imaginaryline"></div>
    <div class="FAQcontent">
        <div class="FAQItem">
            <span class="glyphicon glyphicon-chevron-right icon1"></span>
            <span class="FAQname" id="title_student2">How do I attend class?</span>
            <h4 class="courseBody">
                Answer: After you have registered for your classes, you can click on Personal Center on the top right hand corner to access all the classes you have signed up for.<br/>
                <img src="images/FAQimg/22.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;"><br/>
                To start a scheduled class, simply click on “Start Class” to begin.<br/>
                <img src="images/FAQimg/23.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;">
            </h4>


        </div>
						<span style="font-size: 14px;color:#6ab600">
							<span class="glyphicon glyphicon-circle-arrow-up" style="font-size: 20px;color:#6ab600;margin-right: 10px;"></span>
							<a href="#FAQtitle" style="color:#6ab600;">Goto Top</a>
						</span>
    </div>
</div>

<div id="QuestionTeachers">
    <div class="index">
        <div class="FAQname">
            <a href="#title_teachers1">
                1.How can I be appointed as a teacher?
            </a>
        </div>
        <div class="FAQname">
            <a href="#title_teachers2">2.How do I start a class?</a>
        </div>
        <div class="FAQname">
            <a href="#title_teachers5">3.I have some videos made by ourselves and I want to share them with my students. What shall I do?</a>
        </div>
        <div class="FAQname">
            <a href="#title_teachers3">4.I have prepared some materials. How can I upload them?</a>
        </div>
        <div class="FAQname">
            <a href="#title_teachers4">5.How do I watch my previous lessons?</a>
        </div>
    </div>

    <div class="FAQcontent">
        <div class="FAQItem">
            <span class="glyphicon glyphicon-chevron-right icon1"></span>
            <span class="FAQname" id="title_teachers1">How can I be appointed as a teacher?</span>
            <h4 class="courseBody">
                Answer: Teachers are appointed by the Organization. The administrator handling the organization’s account has to appoint you as a teacher under the Teacher Management tab.
            </h4>

        </div>
						<span style="font-size: 14px;color:#6ab600">
							<span class="glyphicon glyphicon-circle-arrow-up" style="font-size: 20px;color:#6ab600;margin-right: 10px;"></span>
							<a href="#FAQtitle" style="color:#6ab600;">Goto Top</a>
						</span>
    </div>

    <div class="imaginaryline"></div>

    <div class="FAQcontent">
        <div class="FAQItem">
            <span class="glyphicon glyphicon-chevron-right icon1"></span>
            <span class="FAQname" id="title_teachers2">How do I start a class?</span>
            <h4 class="courseBody">
                Answer: For classes that you have been appointed to teach, it will appear on your Organization Centre. Simply click on “Start Class” and you can begin teaching right away!
                <br/>
                <img src="images/FAQimg/16.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;">
            </h4>


        </div>
						<span style="font-size: 14px;color:#6ab600">
							<span class="glyphicon glyphicon-circle-arrow-up" style="font-size: 20px;color:#6ab600;margin-right: 10px;"></span>
							<a href="#FAQtitle" style="color:#6ab600;">Goto Top</a>
						</span>
    </div>

    <div class="imaginaryline"></div>
    <div class="FAQcontent">
        <div class="FAQItem">
            <span class="glyphicon glyphicon-chevron-right icon1"></span>
            <span class="FAQname" id="title_teachers5">I have some videos made by ourselves and I want to share them with my students. What shall I do?</span>
            <h4 class="courseBody">
                Answer: You can upload the video files to YouTube as “Private” and record the links of the files on YouTube. Private video files on YouTube mean that they are not public and no one can find it through searching engines. Only the persons who have the links can watch them. The students can watch the videos through the virtual classroom but cannot obtain the links.
            </h4>


        </div>
						<span style="font-size: 14px;color:#6ab600">
							<span class="glyphicon glyphicon-circle-arrow-up" style="font-size: 20px;color:#6ab600;margin-right: 10px;"></span>
							<a href="#FAQtitle" style="color:#6ab600;">Goto Top</a>
						</span>
    </div>
    <div class="imaginaryline"></div>

    <div class="FAQcontent">
        <div class="FAQItem">
            <span class="glyphicon glyphicon-chevron-right icon1"></span>
            <span class="FAQname" id="title_teachers3">I have prepared some materials. How can I upload them?</span>
            <h4 class="courseBody">
                Answer: There are two ways you can do so.<br/>

                Firstly, go to “My Created Course” and click on “Upload Course Resource”
                <br/>
                <img src="images/FAQimg/17.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;">
                <br/>
                On this page you can see all the documents you have previously uploaded, and upload new materials if necessary.
                <img src="images/FAQimg/18.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;">
                <br/>
                The second method to uploading materials will be to do so during class time.<br/>

                Once you have started class, you can click on the yellow button on the top to access the media drawer. Click on the file icon to access or upload your materials.
                <br/>
                <img src="images/FAQimg/19.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;">
            </h4>


        </div>
						<span style="font-size: 14px;color:#6ab600">
							<span class="glyphicon glyphicon-circle-arrow-up" style="font-size: 20px;color:#6ab600;margin-right: 10px;"></span>
							<a href="#FAQtitle" style="color:#6ab600;">Goto Top</a>
						</span>
    </div>

    <div class="imaginaryline"></div>

    <div id="FAQcontent">
        <div class="FAQItem">
            <span class="glyphicon glyphicon-chevron-right icon1"></span>
            <span class="FAQname" id="title_teachers4">How do I watch my previous lessons?</span>
            <h4 class="courseBody">
                Answer: All classes that have been conducted will be shown in green under the course’s page. Classes that have not been recorded will be in red. Simply click on the lesson number to view the recording of your class.
                <br/>
                <img src="images/FAQimg/20.jpg" alt="" style="border-radius: 8px;margin-top: 10px;margin-bottom: 10px;">
            </h4>


        </div>
						<span style="font-size: 14px;color:#6ab600">
							<span class="glyphicon glyphicon-circle-arrow-up" style="font-size: 20px;color:#6ab600;margin-right: 10px;"></span>
							<a href="#FAQtitle" style="color:#6ab600;">Goto Top</a>
						</span>
    </div>

</div>
</div>
</div>

</div>