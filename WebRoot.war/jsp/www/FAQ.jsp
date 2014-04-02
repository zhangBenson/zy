
<script type="text/javascript">
    $(document).ready(function(){
        $("#btnQrganization").click(function(){
            $("#FAQtitle").text("Qrganization FAQ");
        });

        $("#btnLecturer").click(function(){
            $("#FAQtitle").text("Lecturer FAQ");
        });

        $("#btnStudent").click(function(){
            $("#FAQtitle").text("Student FAQ");
        });
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
                <button type="button" class="btn btn-success btn-block" id="btnCourse" onclick="self.location='voaCourseBlog.html?course.id=54'">
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


            <div class="index">
                <div class="FAQname">
                    <a href="#title1">1.Who can take an edX course? How do I sign up?</a>
                </div>
                <div class="FAQname">
                    <a href="#title2">2.What if I have technical trouble with registration, login, or course access?</a>
                </div>
                <div class="FAQname">
                    <a href="#title3">3.What does it cost to take a course? (It’s free!)</a>
                </div>
                <div class="FAQname">
                    <a href="#title4">4.Are courses accessible to students with disabilities?</a>
                </div>
                <div class="FAQname">
                    <a href="#title5">5.Are courses only offered in English?</a>
                </div>
                <div class="FAQname">
                    <a href="#title6">6.I live somewhere that YouTube is not available. How can I watch the videos?</a>
                </div>
                <div class="FAQname">
                    <a href="#title7">7.Can I access edX courses on my smart phone or tablet computer?</a>
                </div>
            </div>

            <div id="FAQcontent">

                <div class="FAQItem">
                    <span class="glyphicon glyphicon-chevron-right icon1"></span>
                    <span class="FAQname" id="title1">Who can take an edX course? How do I sign up?</span>
                    <h4 class="courseBody">
                        EdX courses are open to everyone. All you need is access to a computer with a current browser, an Internet connection, and, of course, a desire to learn.
                        To sign up, create an edX account and then register for the course of your choice. Choose Register Now to get started. Unless you choose an ID verified certificate, registration is free!
                    </h4>
                </div>

                <div class="imaginaryline"></div>

                    <div class="FAQItem">
                        <span class="glyphicon glyphicon-chevron-right icon1"></span>
								<span class="FAQname" id="title2">
									What if I have technical trouble with registration, login, or course access?
								</span>
                        <h4 class="courseBody">
                            Many problems with registration, login, or access to edX courses are caused by browser issues. Here are some things to try:
                            <br/>
                            - Switch to a current version of Chrome or Firefox
                            <br/>
                            - Check you browser settings to ensure both JavaScript and cookies are enabled
                            <br/>
                            - Clear your browser's cache
                        </h4>
                    </div>
                <div class="imaginaryline"></div>
            </div>
        </div>
    </div>

</div>