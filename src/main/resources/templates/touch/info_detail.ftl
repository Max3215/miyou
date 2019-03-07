<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title><#if site??>${site.title!''}-</#if>${info.title!''}</title>
<!-- css -->
<link rel="shortcut icon" href="/touch/images/index_short_logo.ico" />
<link rel="stylesheet" type="text/css" href="/touch/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/touch/css/main.css"/>
</head>
<body class="bgc-f3">

  <!-- index head -->
  <header class="index-head">${info.title!''}</header>
  <!-- index head end -->
  <div class="clear"></div>
<!-- Chang URLs to wherever Video.js files will be hosted -->
  <link href="/client/css/video-js.css" rel="stylesheet" type="text/css">
  <!-- video.js must be in the <head> for older IEs to work. -->
  <script src="/client/js/video.js"></script>

  <!-- Unless using the CDN hosted version, update the URL to the Flash SWF -->
  <script>
    videojs.options.flash.swf = "/client/js/video-js.swf";
  </script>
  <!-- news-details -->
  <#if info.videoUrl?? && info.videoUrl !="">
  <article class="company-profile">
    <section class="videos">
      <video width="100%" controls="controls">
        <source src="${info.videoUrl!''}" type="video/mp4">
        <track kind="captions" src="/client/js/demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
        <track kind="subtitles" src="/client/js/demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
      </video>
    </section><!-- videos end -->
    <div class="writings">${info.content!''}</div>
  </article>
  <#else>
  <article class="news-details">
    <section class="top-title">
    <#--
      <div class="div1"><#if info??>${info.title!''}</#if></div>
      <div class="div2"><#if info?? && info.updateTime??>${info.updateTime?string('yyyy-MM-dd')}</#if> 作者：<#if info??>${info.source!''}</#if></div>
     -->
    </section><!-- top-title end -->
    <section class="content">
      <img class="writings-img" src="${info.imgUrl!''}" alt="${info.title!''}" />
      <div class="writings">${info.content!''}</div>
    </section><!-- content end -->
  </article>
  </#if>
  <!-- news-details end -->

  <div class="clear h50"></div>

  <!-- common footer -->
  <#include "/touch/common_footer.ftl">
  <!-- common footer end -->

</body>
</html>