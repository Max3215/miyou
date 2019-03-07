<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>新闻动态</title>
<!-- css -->
<link rel="shortcut icon" href="/touch/images/index_short_logo.ico" />
<link rel="stylesheet" type="text/css" href="/touch/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/touch/css/main.css"/>
<!-- js -->
<script type="text/javascript" src="/touch/js/jquery-2.2.2.min.js"></script>
<script type="text/javascript" src="/touch/js/jquery-common.js"></script>
</head>
<body class="bgc-f3">

  <!-- index head -->
  <header class="index-head">新闻动态</header>
  <!-- index head end -->

  <!-- news-lists -->
  <article class="news-lists">
    <ul id="tab-ul-1">
       <#if catList??>
       <#list catList as  cat>
            <#if cat_index==0>
            <li class="active"><a href="javascript:;" title="">${cat.title!''}</a></li>
            <#else>
            <li><a href="javascript:;" title="">${cat.title!''}</a></li>
            </#if>
       </#list>
       </#if>
    </ul>
    <ol id="tab-ol-1">
      <!-- 新闻列表 -->
      <#if catList??>
      <#list catList as  cat>
            <li>
            <#if ('news_'+cat_index+'_list')?eval??>
            <#list ('news_'+cat_index+'_list')?eval as news>
                <a href="/touch/info/content?id=${news.id?c}&mid=${mid}" title="${news.title!''}">
                  <div class="img">
                    <img src="${news.imgUrl!''}" alt="${news.title!''}">
                  </div>
                  <div class="content">
                    <p class="p1">${news.title!''}</p>
                    <p class="p2">${news.content!''}</p>
                  </div>
                </a>
            </#list>
            </#if>
            </li>
      </#list>
      </#if>
    </ol>
  </article>
  <!-- news-lists end -->

  <div class="clear h50"></div>

  <!-- common footer -->
  <#include "/touch/common_footer.ftl">
  <!-- common footer end -->

</body>
</html>