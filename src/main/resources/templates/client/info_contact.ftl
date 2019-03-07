<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<title><#if site??>${site.title!''}-</#if>联系我们</title>
<!--网页左上角小图标-->
<link rel="shortcut icon" href="/client/images/index_short_logo.ico" />
<!-- css -->
<link rel="stylesheet" type="text/css" href="/client/css/common.css">
<link rel="stylesheet" type="text/css" href="/client/css/main.css">
<!-- js -->
<!--[if IE]>
  <script src="js/html5.js"></script>
<![endif]-->
<script type="text/javascript" src="/client/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/client/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Gfkq7ZYDhc54kyRRLp634PVO6xqLvFo5"></script>
</head>
<body>

  <h1 style="display:none;">南川绿玉春蜜柚</h1>

  <#include "/client/common_header.ftl">
    <!-- banner -->
    <div id="slidebox" class="index_banner">
      <div class="hd">
        <ul><li></li><li></li><li></li><li></li></ul>
      </div>
      
      <div class="bd">
        <ul><!-- banner图片 1920*600 -->
          <#if big_scroll_ad_list??>
            <#list big_scroll_ad_list as ad>
            <#if ad_index==0>
              <li style="display: none;">
                <a href="${ad.linkUri!''}" title="${ad.title!''}">
                  <img src="${ad.fileUri!''}">
                </a>
              </li>
            <#else>
            <li style="display: list-item;">
                <a href="${ad.linkUri!''}" title="${ad.title!''}">
                  <img src="${ad.fileUri!''}">
                </a>
              </li>
            </#if>
        </#list>
        </#if>
        </ul>
      </div>
         
    </div>
    <script type="text/javascript">
      jQuery("#slidebox").slide({mainCell:".bd ul",autoPlay:true});
    </script>
    <!-- banner end -->
  </header>

  <div class="clear"></div>

  <!-- main-content -->
  <article class="main-content">
    <section class="left-menu">
      <div class="title">联系我们</div>
      <menu>
        <a class="current" href="javascript:;" title="">联系方式</a>
      </menu>
      <div class="hotline"><#if site??>${site.telephone!''}</#if></div>
    </section><!-- left-menu end -->
    <section class="right-content">
      <div class="crumb-box">
        <label>联系方式</label>
        <p>您当前所在位置：首页 -> <a href="javascript:;" title="">联系我们</a> -> 联系方式</p>
      </div>
<script type="text/javascript" src="/client/js/Validform_v5.3.2_min.js"></script>
 <script>
 $(document).ready(function(){

    //初始化表单验证
    $("#form1").Validform({
        tiptype:4, 
        btnReset: ".reset",
        ajaxPost:true,
        callback:function(data){
            alert(data.msg);
            location.reload();
        }
    });
})

 </script>
      <!-- contact-us -->
      <article class="contact-us">
        <section class="left-writing">
          <div class="writings">
            <p><#if site??>${site.copyright!''}</#if></p>
            <p>电话：<#if site??>${site.fax!''}</#if></p>
            <p>qq：<#if site??>${site.qq1!''}</#if></p>
            <p>地址：<#if site??>${site.address!''}</#if></p>
          </div>
          <div class="l-message">
            <form action="/message/add" id="form1" method="post">
              <div class="title">在线留言：</div>
              <input class="ipn" type="text" placeholder="您的称呼" name="name"/>
              <textarea placeholder="留言内容" name="content"></textarea>
              <div class="phone-num">
                <input type="text" placeholder="您的联系方式" name="mobile"/>
                <input type="submit" value="提交留言" />
              </div>
            </form>
          </div><!-- l-message end -->
        </section><!-- left-writing end -->
        <section class="right-maps">
          <div id="allmap"></div>
        </section><!-- right-maps end -->
        <script type="text/javascript">
       $(document).ready(function(){
            loadMap(${site.longitude!''},${site.latitude!''},1);
       });
          
       function loadMap(x, y, z)
        {
            // 百度地图API功能
            var map = new BMap.Map("allmap");
            var point = new BMap.Point(x, y);
            map.centerAndZoom(point, 12);
            map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
            map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
            var marker = new BMap.Marker(new BMap.Point(x, y)); // 创建点
            map.addOverlay(marker);
            if(z == 1){
                marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
            }
        }
        </script>
      </article>
      <!-- contact-us end -->

    </section><!-- right-content end -->
  </article>
  <!-- main-content end -->

  <!-- common-footer -->
  <#include "/client/common_footer.ftl">
  <!-- common-footer end -->

</body>
</html>