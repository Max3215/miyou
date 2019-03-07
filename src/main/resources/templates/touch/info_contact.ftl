<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="format-detection" content="telephone=no"/>
<title><#if site??>${site.title!''}-</#if>联系方式</title>
<!-- css -->
<link rel="shortcut icon" href="/touch/images/index_short_logo.ico" />
<link rel="stylesheet" type="text/css" href="/touch/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/touch/css/main.css"/>
<!-- js -->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Gfkq7ZYDhc54kyRRLp634PVO6xqLvFo5"></script>
<script type="text/javascript" src="/touch/js/jquery-2.2.2.min.js"></script>
<script type="text/javascript" src="/touch/js/Validform_v5.3.2_min.js"></script>
</head>
<body class="bgc-f3">

  <!-- index head -->
  <header class="index-head">联系方式</header>
  <!-- index head end -->

  <!-- contact-us -->
  <article class="contact-us">
    <section class="maps">
      <div id="allmap"></div>
    </section><!-- maps end -->
    <script type="text/javascript">
      // 百度地图API功能
      var map = new BMap.Map("allmap");
      var point = new BMap.Point(${site.longitude!''},${site.latitude!''});
      map.centerAndZoom(point,11);

      var geolocation = new BMap.Geolocation();
      geolocation.getCurrentPosition(function(r){
        if(this.getStatus() == BMAP_STATUS_SUCCESS){
          var mk = new BMap.Marker(r.point);
          map.addOverlay(mk);
          map.panTo(r.point);
          var mk2 = new BMap.Marker(point);
          map.addOverlay(mk2);
          map.panTo(point);
          //alert('您的位置：'+r.point.lng+','+r.point.lat);
        }
        else {
          //alert('failed'+this.getStatus());
        }        
      },{enableHighAccuracy: true})
    </script>

    <!-- message-form -->
    <section class="message-form">
        <ul>
          <li>
            <div class="div1">联系电话：</div>
            <div class="div2"><#if site??>${site.telephone!''}</#if></div>
            <a href="tel:<#if site??>${site.telephone!''}</#if>" title="">拨号</a>
          </li>
          <li class="address">
            <div class="div1">公司地址：</div>
            <div class="div2"><#if site??>${site.address!''}</#if></div>
          </li>
        </ul>
      <form action="/touch/message/add" id="form1" method="post">
        <div class="leave-message">
          <div class="title">在线留言：</div>
          <input type="text" placeholder="您的称呼" name="name">
          <input type="text" placeholder="您的电话" name="mobile">
          <textarea placeholder="留言内容" name="content"></textarea>
          <input type="submit" value="提交留言">
        </div><!-- leave-message end -->
      </form>
    </section>
    <!-- message-form end -->
<script>
 $(document).ready(function(){
    //初始化表单验证
    $("#form1").Validform({
        tiptype:4, 
        btnReset: ".reset",
        ajaxPost:true,
        callback:function(data){
            alert(data.msg);
        }
    });
})
</script>
  </article>
  <!-- contact-us end -->

  <div class="clear h50"></div>

  <!-- common footer -->
  <#include "/touch/common_footer.ftl">
  <!-- common footer end -->

</body>
</html>