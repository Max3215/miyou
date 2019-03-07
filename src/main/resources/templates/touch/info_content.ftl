<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title><#if site??>${site.title!''}-</#if>新闻详情</title>
<!-- css -->
<link rel="shortcut icon" href="/touch/images/index_short_logo.ico" />
<link rel="stylesheet" type="text/css" href="/touch/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/touch/css/main.css"/>
</head>
<body class="bgc-f3">

  <!-- index head -->
  <header class="index-head">新闻详情</header>
  <!-- index head end -->

  <!-- news-details -->
  <article class="news-details">
    <section class="top-title">
      <div class="div1"><#if info??>${info.title!''}</#if></div>
      <div class="div2"><#if info?? && info.updateTime??>${info.updateTime?string('yyyy-MM-dd')}</#if> 作者：<#if info??>${info.source!''}</#if></div>
    </section><!-- top-title end -->
    <section class="content">
      <img class="writings-img" src="${info.imgUrl!''}" alt="${info.title!''}" />
      <div class="writings">${info.content!''}</div>
    </section><!-- content end -->
    <section class="up-down-group">
      <#if prev_info??><a href="/info/content?id=${prev_info.id?c}&mid=${mid}" title="${prev_info.title!''}">上一篇：<strong>${prev_info.title!''}</strong></a></#if>
          <#if next_info??><a href="/info/content?id=${next_info.id?c}&mid=${mid}" title="${next_info.title!''}">下一篇：<strong>${next_info.title!''}</strong></a></#if>
    </section><!-- up-down-group end -->
  </article>
  <!-- news-details end -->

  <div class="clear h50"></div>

  <!-- common footer -->
  <#include "/touch/common_footer.ftl">
  <!-- common footer end -->

</body>
</html>