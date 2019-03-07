<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title><#if site??>${site.title!''}-</#if>关于我们</title>
<!-- css -->
<link rel="shortcut icon" href="/touch/images/index_short_logo.ico" />
<link rel="stylesheet" type="text/css" href="/touch/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/touch/css/main.css"/>
</head>
<body class="bgc-f3">

  <!-- index head -->
  <header class="index-head">关于我们</header>
  <!-- index head end -->

  <!-- about-us -->
  <article class="about-us">
    <#if aboutus_ad_list ??>
    <img width="100%" height="auto" src="${aboutus_ad_list[0].fileUri!''}" alt="">
    </#if>
    <menu>
       <#if about_list??>
       <#list about_list as item>
            <a href="/touch/info/detail?id=${item.id?c}&mid=${mid}" title="">${item.title!''}</a>
       </#list>
       </#if>
    </menu>
  </article>
  <!-- about-us end -->

  <div class="clear h50"></div>

  <!-- common footer -->
  <#include "/touch/common_footer.ftl">
  <!-- common footer end -->

</body>
</html>