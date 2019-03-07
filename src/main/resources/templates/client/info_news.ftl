<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.title!''}-</#if>新闻动态</title>
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
</head>
<body>

  <h1 style="display:none;">南川绿玉春蜜柚</h1>
    <#include "/client/common_header.ftl">
    </article>
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
        <label><#if category??>${category.title!''}</#if></label>
        <p>您当前所在位置：<a href="/">首页</a> -> <a href="/info/news?mid=${mid}&catId=${catId?c}&page=${page?c}" title="<#if category??>${category.title!''}</#if>"><#if category??>${category.title!''}</#if></a></p>
      </div>

      <!-- news-lists -->
      <article class="news-lists">
        <ul>
           <#if news_page??>
           <#list news_page.content as news>
              <li>
                <a class="img" href="/info/content?id=${news.id?c}&mid=${mid}" title="${news.title!''}">
                  <img src="${news.imgUrl!''}" alt="${news.title!''}" />
                </a>
                <div class="article">
                  <a class="p1" href="/info/news" title="${news.title!''}">${news.title!''}</a>
                  <p class="p2">时间：<#if news.updateTime??>${news.updateTime?string('yyyy-MM-dd')}</#if></p>
                  <p class="p3">${news.content!''}</p>
                </div>
              </li>
          </#list>
          </#if>
        </ul>
        <section class="page-nums">
            <#if news_page.number == 0>
                 <a href="javascript:;" title="">&lt;</a>
            <#else>
                <a href="/info/news?mid=${mid}&catId=${catId}&page=${(news_page.number-1)?c}" title="上一页">&lt;</a>
            </#if>
            <#if news_page??>
                <#assign continueEnter=false>
                <#if news_page.totalPages gt 0>
                    <#list 1..news_page.totalPages as page>
                        <#if page <= 3 || (news_page.totalPages-page) < 3 || (news_page.number+1-page)?abs<3 >
                            <#if page == news_page.number+1>
                                <a class="current" href="javascript:;" title="">${page?c}</a>
                            <#else>
                                <a href="/info/news?mid=${mid}&catId=${catId}&page=${(page-1)?c}" title="第${page?c}页">${page?c}</a>
                            </#if>
                            <#assign continueEnter=false>
                        <#else>
                            <#if !continueEnter>
                                <b class="pn-break">&hellip;</b>
                                <#assign continueEnter=true>
                            </#if>
                        </#if>
                    </#list>
                </#if>
            </#if>
            <#if news_page.number+1 == news_page.totalPages || news_page.totalPages==0>
                <a href="javascript:;" title="">&gt;</a>
            <#else>
                <a href="/info/news?mid=${mid}&catId=${catId}&page=${(news_page.number+1)?c}" class="nextPage">&gt;</a>
            </#if>
        </section><!-- page-nums end -->
      </article>
      <!-- news-lists end -->

    </section><!-- right-content end -->
  </article>
  <!-- main-content end -->

  <!-- common-footer -->
  <#include "/client/common_footer.ftl">
  <!-- common-footer end -->

</body>
</html>