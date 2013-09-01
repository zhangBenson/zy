<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>


<div>


        <div>
            <div  style="width:280px">
                <div style="float: left">
                    <a href="javascript:playPre()"
                       style="background-image:url(images/sh.jpg);background-repeat:repeat;display:block;height:50px;width:140px;line-height:50px;font-size: 30;">
                        <span style="padding-left: 30px;font-weight:bold">上一个</span>
                    </a>
                </div>
                <div style="float: left">
                    <a href="javascript:playNext()"
                       style="background-image:url(images/sh.jpg);background-repeat:repeat;display:block;height:50px;width:140px;line-height:50px;font-size: 30;">
                        <span style="padding-left: 30px;font-weight:bold">下一个</span>
                    </a>
                </div>
                <div style="float: left">


                </div>
            </div>
        </div>

        <div>
            <div id="youkuplayer"></div>

            <script type="text/javascript">

                var vidArrays = [ <s:property value="idStrings"/>  ];
                var vidCur = vidArrays[0];
                var vidIndex = 0;
                var isready = false;
                var timerName;
                var isEnd = false;
                function onYoukuPlayerReady() {

                    isready = true;
                    player.playVideoById(vidCur)
                    delayCall();
                }
                //        // call js api(pause video)
                //        function pauseVideo() {
                ////            alert(player.currentTime());
                //            if (!isready) return false;
                //            player.pauseVideo();
                //        }
                function delayCall() {

//            alert( player.totalTime()+ "e========"+((player.totalTime()-1) == player.currentTime())+"=========nd" + player.currentTime());
                    if ((player.currentTime() >= player.totalTime() - 1)) {
                        playNext();
                    }
                    timerName = setTimeout(delayCall, 1000);
                }

                function playNext() {
                    if (vidIndex == (vidArrays.length - 1)) {

                        if (!isEnd) {
                            alert("end");
                            isEnd = true;
                        }
                        clearTimeout(timerName);
                    } else {
                        vidIndex++;
                        vidCur = vidArrays[vidIndex];
                        player.playVideoById(vidCur)
                    }
                }
                function playPre() {
                    if (vidIndex == 0) {
                        alert("fist");
                    } else {
                        vidIndex--;
                        vidCur = vidArrays[vidIndex];
                        player.playVideoById(vidCur)
                    }
                }


            </script>

            <script type="text/javascript" src="http://player.youku.com/jsapi">


                player = new YKU.Player('youkuplayer', {
                            client_id: 'YOUR YOUKUOPENAPI APPID',
                            vid: vidCur,
                            autoplay: true,
                            events: {
                                'onPlayerReady': onYoukuPlayerReady
                            }
                        }
                );


            </script>
        </div>



</div>
