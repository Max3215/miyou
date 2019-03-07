<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.title!''}-</#if>新闻详情</title>
<!--网页左上角小图标-->
<link rel="shortcut icon" href="/client/images/index_short_logo.ico" />
<!-- css -->
<link rel="stylesheet" type="text/css" href="/client/css/common.css">
<link rel="stylesheet" type="text/css" href="/client/css/main.css">
<!-- js -->
<!--[if IE]>
  <script src="/client/js/html5.js"></script>
<![endif]-->
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
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
      <div class="title">新闻动态</div>
      <menu>
        <#if catList??>
        <#list catList as cat>
            <a class="<#if catId?? && catId==cat.id>current</#if>" href="/info/news?mid=${mid}&catId=${cat.id?c}" title="${cat.title!''}">${cat.title!''}</a>
        </#list>
        </#if>
      </menu>
      <div class="hotline"><#if site??>${site.telephone!''}</#if></div>
    </section><!-- left-menu end -->
    <section class="right-content">
      <div class="crumb-box">
        <label class="news-details-title">
          <div class="p1"><#if info??>${info.title!''}</#if></div>
          <div class="p2">作者：<#if info??>${info.source!''}</#if>  时间：<#if info?? && info.updateTime??>${info.updateTime?string('yyyy-MM-dd HH:mm')}</#if> </div>
        </label>
        <p>您当前所在位置：<a href="/">首页</a> -><a href="/info/news">新闻动态</a> -> <a href="/info/news?mid=${mid}<#if category??>&catId=${category.id?c}</#if>" title="<#if category??>${category.title!''}</#if>"><#if category??>${category.title!''}</#if></a></p>
      </div>

      <!-- news-details -->
      <article class="news-details">
        <section class="img">
          <img src="${info.imgUrl!''}" alt="${info.title!''}" />
        </section>
        <!-- userself-edit -->
        <section class="userself-edit">
          <p style="height:auto;line-height:36px;color:#999;">${info.content!''}</p>
        </section>
        <!-- userself-edit end -->
        <section class="the-next">
          <#if prev_info??><a href="/info/content?id=${prev_info.id?c}&mid=${mid}" title="${prev_info.title!''}">上一篇：<strong>${prev_info.title!''}</strong></a></#if>
          <#if next_info??><a href="/info/content?id=${next_info.id?c}&mid=${mid}" title="${next_info.title!''}">下一篇：<strong>${next_info.title!''}</strong></a></#if>
        </section>
      </article>
      <!-- news-details end -->

    </section><!-- right-content end -->
  </article>
  <!-- main-content end -->

  <!-- common-footer -->
  <#include "/client/common_footer.ftl">
  <!-- common-footer end -->

</body>
</html>