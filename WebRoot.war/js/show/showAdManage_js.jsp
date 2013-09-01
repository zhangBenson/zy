<script type="text/javascript">
    $(document).ready(function(){
        $("li.li_4 input").click(function(){
            $(this).parent().parent().siblings("ul.sub_u2").slideToggle("fast");
        });
    });
    function linkToNewPage(linkAddress){
        window.open( linkAddress, "newwindow ", "toolbar=no,menubar=no,scrollbars=no,resizable=no, location=no,status=no ");
    }

</script>