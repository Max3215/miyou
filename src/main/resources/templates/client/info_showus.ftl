<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.title!''}-</#if>走进绿玉春</title>
<!--网页左上角小图标-->
<link rel="shortcut icon" href="/client/images/index_short_logo.ico" />
<!-- css -->
<link rel="stylesheet" type="text/css" href="/client/css/common.css">
<link rel="stylesheet" type="text/css" href="/client/css/main.css">
<!-- js -->
<!--[if IE]>
  <script src="/client/js/html5.js"></script>
<![endif]-->
<script type="text/javascript" src="/client/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/client/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/client/js/jquery-common.js"></script>
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
      <div class="title">走进绿玉春</div>
      <menu>
        <#if cat_list??>
        <#list cat_list as info>
            <a class="<#if id?? && id==info.id>current</#if>" href="/info/showus?id=${info.id?c}&mid=${mid}" title="">${info.title!''}</a>
        </#list>
        </#if>
      </menu>
      <div class="hotline"><#if site??>${site.telephone!''}</#if></div>
    </section><!-- left-menu end -->
    <section class="right-content">
      <div class="crumb-box">
        <label>${info.title!''}</label>
        <p>您当前所在位置：<a href="/">首页</a> -> <a href="/info/showus?mid=10" title="走进绿玉春">走进绿玉春</a> -> ${info.title!''}</p>
      </div>

      <!-- product-center -->
      <article class="product-center">
        <section class="right-banner">
          <div class="left-big-img" id="left-big-img">
            <img src="${info.imgUrl!''}" alt="${info.title!''}" />
          </div><!-- left-big-img end -->
          <article class="right-little-img">
            <a id="btn-up" href="javascript:;" title=""></a>
            <a id="btn-down" href="javascript:;" title=""></a>
            <section id="smallBox">
              <ul id="small_ul" style="position:absolute">
                <#if info.showPictures??>
                <#list info.showPictures?split(",") as uri>
                    <#if ""!=uri>
                        <li>
                          <img src="${uri!''}" alt="" />
                          <div></div>
                        </li>
                    </#if>
                </#list>
                </#if>
              </ul>
            </section>
          </article><!-- right-little-img end -->
        </section><!-- right-banner end -->

        <!-- userself-edit -->
        <section class="userself-edit">
          <p style="height:auto;line-height:36px;color:#666;">${info.content!''}</p>
        </section>
        <!-- userself-edit end -->

      </article>
      <!-- product-center end -->

    </section><!-- right-content end -->
  </article>
  <!-- main-content end -->

  <!-- common-footer -->
  <#include "/client/common_footer.ftl">
  <!-- common-footer end -->

</body>
</html>