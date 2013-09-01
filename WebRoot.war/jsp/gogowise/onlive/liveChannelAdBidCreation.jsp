<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ include file="/js/show/showAdBid_js.jsp" %>
<link href="css/onlive/live_channel_ad_bid_cre.css" rel="stylesheet" type="text/css" />


<div class="mf_1">
    <p id="sub_nav">
        <a href="initMyOnlive.html"><s:property value="%{getText('my.onlive')}" /></a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;
        <a href="rangeLiveChannel.html"><s:property value="%{getText('onlive.channel.range.board')}" /></a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;
        <span id="nav_title"><s:property value="%{getText('onlive.ad.bidding')}" /></span></p>
</div>

<div class="course_create_container">
      <p class="create_content_title">
           <s:property value="%{getText('show.ad.bid')}" />
      </p>
  <s:form action="saveAdvertiseForLive" method="POST" enctype="multipart/form-data">
      <s:hidden name="liveChannel.id"/>
      <div class="create_content">
          <ul class="content_courseInfo">
              <li>
                  <div class="option_tittle"><s:property value="%{getText('show.brand.name')}" /></div>
                  <div class="bid_brand_input_msg input_msg"></div>
                  <div class="option_content">
                      <s:if test="existAds">
                          <s:select name="advertisementForLive.fromAdvertisement.id"  list="ads" listKey="key"  id="advertisement_name" cssClass="long_text_field" listValue="value"/>
                      </s:if>
                      <s:else>
                          <s:textfield cssClass="long_text_field" id="bid_brand" name="advertisementForLive.productName"/>
                      </s:else>
                  </div>
              </li>
              <li>
                  <div class="option_tittle"><s:property value="%{getText('show.brand.link')}" /></div>
                  <div class="bid_link_input_msg input_msg"></div>
                  <div class="option_content"><s:textfield cssClass="long_text_field" id="bid_link" name="advertisementForLive.linkAddress"/>
                  </div>
              </li>
              <li>
                  <div class="option_tittle"><s:property value="%{getText('show.brand.intro')}" /></div>
                  <div class="bid_description_input_msg input_msg"></div>
                  <div class="option_content">
                      <s:textarea cssClass="long_text_area" id="bid_description" name="advertisementForLive.description"/>
                  </div>
              </li>
              <li class="long_select_li">
                  <div class="option_tittle"><s:property value="%{getText('show.bidding.price')}" /></div>
                  <div class="bid_price_input_msg input_msg"></div>
                  <div class="option_content"><s:textfield cssClass="short_text_field" id="bid_price" name="advertisementForLive.bidPrice"/></div>
              </li>
              <li>
                  <div class="option_tittle"><s:property value="%{getText('show.bidding.ad.logo')}" /></div>
                  <div class="bid_adImg_input_msg input_msg"></div>
                  <div class="option_content">
                    <img src="images/defaultImgs/ad.jpg" id="bid_adImg_preview" /><br/>
                    <input type="file" name="upload" id="bid_adImg_upload"/>
                  </div>
                  <s:hidden id="bid_adImg" name="advertisementForLive.adLogoUrl"/>
              </li>
          </ul>
      </div>
      <div class="create_back_forth">
          <s:submit cssClass="submit_btn" onclick="return checkBidInfoForm();" value="%{getText('show.bidding.confirm')}"/>
      </div>
  </s:form>
</div>
<script type="text/javascript">

    $(document).ready(function(){
       if($("#advertisement_name").val() != undefined){
           $.post("findAdvertiseForLive.html",{'advertisementForLive.id':$("#advertisement_name").val()},function(data){
                   $("#bid_link").attr('value',data.brandLink);
                   $("#bid_description").attr('value',data.brandDescription);
                   $("#bid_price").attr('value',data.brandPrice);
                   $("#bid_adImg_preview").attr("src", data.brandLogoUrl);
            });
       }
    });


     $("#advertisement_name").change(function(){
        $.post("findAdvertiseForLive.html",{'advertisementForLive.id':$(this).val()},function(data){
               $("#bid_link").attr('value',data.brandLink);
               $("#bid_description").attr('value',data.brandDescription);
               $("#bid_price").attr('value',data.brandPrice);
               $("#bid_adImg_preview").attr("src", data.brandLogoUrl);
               if($("#advertisement_name").val() == -1){
                    $("<input type='text' class='long_text_field' id='bid_brand' name='advertisementForLive.productName'/>").replaceAll($("#advertisement_name"));
                    $("#bid_adImg_preview").attr("src", "images/defaultImgs/ad.jpg");
               }
        });

    });
</script>