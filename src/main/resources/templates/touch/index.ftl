<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title><#if site??>${site.title!''}-</#if>首页</title>
<!-- css -->
<link rel="shortcut icon" href="/touch/images/index_short_logo.ico" />
<link rel="stylesheet" type="text/css" href="/touch/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/touch/css/main.css"/>
<link rel="stylesheet" type="text/css" href="/touch/css/swiper.min.css">
<!-- js -->
<script type="text/javascript" src="/touch/js/swipe.js"></script>
</head>
<body class="bgc-f3">

  <!-- index head -->
  <header class="index-head"><#if site??>${site.title!''}</#if></header>
  <!-- index head end -->

  <!-- index -->
  <article class="index-main">
    <!-- banner -->
    <div class="addWrap">
      <div class="swipe" id="mySwipe">
        <div class="swipe-wrap">
           <#if touch_middle_ad_list??>
           <#list touch_middle_ad_list as ad>
                  <div>
                        <a href="${ad.linkUri!''}" title="${ad.title!''}"><img class="img-responsive" src="${ad.fileUri!''}"/></a>
                  </div>
           </#list>
           </#if>
        </div>
      </div>
      <ul id="position">
        <li class="cur"></li>
        <li class=""></li>
        <li class=""></li>
      </ul>
    </div>    
    <script type="text/javascript">
      var bullets = document.getElementById('position').getElementsByTagName('li');
      var banner = Swipe(document.getElementById('mySwipe'), {
        auto: 2000,
        continuous: true,
        disableScroll:false,
        callback: function(pos) {
          var i = bullets.length;
          while (i--) {
            bullets[i].className = ' ';
          }
          bullets[pos].className = 'cur';
        }
      });
    </script>
    <!-- bannner end -->

    <div class="clear"></div>

    <!-- index-bulletin -->
    <#if news_list??>
    <section class="index-bulletin">
      <div class="img">
        <img src="/touch/images/icon_index_speaker.png" alt="">
      </div>
      <a class="a1" href="/touch/info/content?id=${news_list[0].id?c}&mid=12" title="">${news_list[0].title!''}</a>
      <a class="a2" href="/touch/info/news" title="">[更多]</a>
    </section>
    </#if>
    <!-- index-bulletin end -->

    <!-- index-pc -->
    <section class="index-pc">
      <div class="index-section-title">
        <div class="border"></div>
        <div class="div1">产品中心</div>
        <div class="div2">PRODUCT CENTER</div>
      </div>
      <ul>
        <#if product_list??>
        <#list product_list as pro>
        <li>
          <a href="/touch/info/detail?id=${pro.id?c}&mid=13" title="">
            <div class="img">
              <img src="${pro.imgUrl!''}" alt="${pro.title!''}">
            </div>
            <div class="right">
              <p class="p1">${pro.title!''}</p>
              <p class="p2">${pro.content!''}</p>
            </div>
          </a>
        </li>
        </#list>
        </#if>
      </ul>
    </section>
    <!-- index-pc end -->

    <!-- index-enter-lvc -->
    <section class="index-enter-lvc">
      <div class="index-section-title">
        <div class="border"></div>
        <div class="div1">走进绿玉春</div>
        <div class="div2">ENTER LVYUCHUN</div>
      </div>
      <ul>
        <#if showus_list??>
        <#list showus_list as info>
        <li>
          <a href="/touch/info/detail?id=${info.id?c}&mid=10" title="">
            <div class="img">
              <img src="${info.imgUrl!''}" alt="${info.title!''}">
            </div>
            <div class="title">${info.title!''}</div>
          </a>
        </li>
        </#list>
        </#if>
      </ul>
    </section>
    <!-- index-enter-lvc end -->

  </article>
  <!-- index-main end -->

  <div class="clear h50"></div>

  <!-- common footer -->
  <#include "/touch/common_footer.ftl">
  <!-- common footer end -->

</body>
</html>