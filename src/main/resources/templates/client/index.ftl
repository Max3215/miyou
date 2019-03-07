<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<title><#if site??>${site.title!''}-</#if>首页</title>
<!--网页左上角小图标-->
<link rel="shortcut icon" href="/client/images/index_short_logo.ico" />
<!-- css -->
<link rel="stylesheet" type="text/css" href="/client/css/common.css">
<link rel="stylesheet" type="text/css" href="/client/css/index.css">
<link href="http://vjs.zencdn.net/5.8.8/video-js.css" rel="stylesheet">
<!-- js -->
<!--[if IE]>
  <script src="/client/js/html5.js"></script>
<![endif]-->
<script type="text/javascript" src="/client/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/client/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/client/js/jquery-common.js"></script>
<!-- If you'd like to support IE8 -->
<script src="http://vjs.zencdn.net/ie8/1.1.2/videojs-ie8.min.js"></script>
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
<!-- Chang URLs to wherever Video.js files will be hosted -->
  <link href="/client/css/video-js.css" rel="stylesheet" type="text/css">
  <!-- video.js must be in the <head> for older IEs to work. -->
  <script src="/client/js/video.js"></script>

  <!-- Unless using the CDN hosted version, update the URL to the Flash SWF -->
  <script>
    videojs.options.flash.swf = "/client/js/video-js.swf";
  </script>
  <!-- index-videos -->
  <#if com_video??>
  <article class="index-videos">
    <section>
      <div>绿玉春视频</div>
     <#-- <a href="javascript:;" title="">关闭</a> -->
    </section>
    <video id="my-video" class="video-js vjs-default-skin vjs-big-play-centered" controls preload="auto" width="316" height="212" poster="auto" data-setup="{}">
        <source src="${com_video.videoUrl!''}" type='video/mp4'>
        <track kind="captions" src="/client/js/demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
        <track kind="subtitles" src="/client/js/demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
        <p class="vjs-no-js">
            To view this video please enable JavaScript, and consider upgrading to a web browser that
            <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
         </p>
    </video>
  </article>
  </#if>
  <!-- index-videos end -->

  <!-- index-about-lyc -->
  <article class="index-about-lyc">
    <section>
      <div class="title-1">关于<strong>绿玉春</strong></div>
      <article>
        <div class="title-2">公司简介</div>
        <p>${company.content!''}</p>
      </article>
      <div class="btn-more">
        <a href="/info/about?mid=8" title="">查看更多</a>
      </div><!-- btn-more end -->
    </section>
    <#if center_ad_list??>
    <img src="${center_ad_list[0].fileUri!''}" alt="" />
    </#if>
  </article>
  <!-- index-about-lyc end -->

  <!-- index-product -->
  <article class="index-product">
    <section class="w1200">
      <div class="top">
        <div class="left">
          <div class="div1">PRODUCT丨产品中心</div>
          <div class="div2">
            <p class="p1">PRODUCT CENTER</p>
            <p class="p2">质量第一 顾客满意 持续改进</p>
          </div>
        </div><!-- left end -->
        <div class="right">
          <a id="btn-prev" href="javascript:;" title="">&lt;</a>
          <a id="btn-next" href="javascript:;" title="">&gt;</a>
          <a class="btn-look-more" href="/info/product?mid=13" title="">查看全部</a>
        </div><!-- right end -->
      </div><!-- top end -->
      <div id="pc-bottom" class="bottom">
        <ul>
          <#if product_page??>
          <#list product_page.content as pro>
                <li>
                    <a href="/info/product?id=${pro.id?c}&mid=13" title="${pro.title!''}"  target="_blank">
                      <img src="${pro.imgUrl!''}" alt="" />
                      <div>
                        <label>${pro.title!''}</label>
                        <span>&nbsp;</span>
                      </div>
                    </a>
                </li>
          </#list>
          </#if>
          
        </ul>
      </div><!-- bottom end -->
    </section>
  </article>
  <!-- index-product end -->

  <!-- index-latest-news -->
  <article class="index-latest-news">
    <section class="top">
      <div class="left">
        <div class="div1">NEWS丨最新动态</div>
        <div class="div2">
          <p class="p1">NEWS CENTER</p>
          <p class="p2">质量第一 顾客满意 持续改进</p>
        </div>
      </div><!-- left end -->
      <a class="btn-look-more" href="/info/news" title="查看全部"  target="_blank">查看全部</a>
    </section><!-- top end -->
    <section class="bottom">
      <#if new_ad_list??>
      <#list new_ad_list as ad>
          <#if ad_index==0>
          <a class="left" href="${ad.linkUrl!''}" title="${ad.title!''}">
            <img src="${ad.fileUri!''}" alt="${ad.title}" />
            <div>${ad.title!''}</div>
          </a>
          </#if>
          </#list>
      </#if><!-- left end -->
      <ul>
        <#if new_page??>
        <#list new_page.content as news>
        <li>
          <a href="/info/content?id=${news.id?c}&mid=12" title="${news.title!''}"  target="_blank">
            <div class="img">
              <img src="${news.imgUrl!''}" alt="${news.title!''}" />
            </div>
            <div class="content">
              <div class="title-info">
                <label>${news.title!''}</label>
                <span><#if news.updateTime??>${news.updateTime?string('yyyy-MM-dd')}</#if></span>
              </div>
              <p>${news.content!''}</p>
            </div>
          </a>
        </li>
        </#list>
        </#if>
      </ul>
    </section><!-- bottom end -->
  </article>
  <!-- index-latest-news end -->

  <!-- index-footer -->
  <footer class="index-footer">
    <div class="w1200">
      <article class="top-info">
        <section class="contact-ways">
          <div class="title">联系方式：</div>
          <div class="qr-info">
            <div class="welcome"><#if site??>${site.company!''}</#if>欢迎您！！</div>
            <div class="qr-code">
              <img src="<#if site??>${site.wxQrCode!''}</#if>" alt="" />
              <ul>
                <li class="li1"><#if site??>${site.address!''}</#if></li>
                <li class="li2"><#if site??>${site.telephone!''}</#if></li>
                <li class="li3"><#if site??>${site.qq1!''}</#if></li>
              </ul>
            </div>
          </div>
        </section><!-- contact-ways end -->
<script type="text/javascript" src="/client/js/Validform_v5.3.2_min.js"></script>
 <script>
 $(document).ready(function(){
    changeYzm(); 

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

<!--  验证码   -->
function changeYzm(){
    var image = document.getElementById("yzm_image");
    image.src = "/code?date="+Math.random()
}
 </script>
        <section class="feedback">
          <form action="/message/add" id="form1" method="post">
            <input type="hidden" name="type" value="index">
            <div class="title">在线留言：</div>
            <div class="inp-box">
              <input type="text" placeholder="您的称呼" name="name"/>
              <input type="text" placeholder="您的电话" name="mobile"/>
              <input type="text" placeholder="您的邮箱" name="mail"/>
            </div>
            <article>
              <textarea placeholder="留言内容" name="content"></textarea>
              <section>
                <div class="top">
                  <input type="text" placeholder="验证码" name="yzm"/>
                  <a href="javascript:changeYzm()" title="看不清楚，换一张">
                    <img id="yzm_image" src="" alt="看不清楚，换一张" />
                  </a>
                </div>
                <input class="btn-submit-feedback" type="submit" value="提交留言" />
              </section>
            </article>
          </form>
        </section><!-- feedback end -->
      </article><!-- top-info end -->
      <article class="bottom-info">
        <section class="sec1">友情链接：
            <#if site_link_list??>
            <#list site_link_list as item>
                <a href="${item.linkUri!''}" title="${item.title!''}">${item.title!''}</a>
            </#list>
            </#if>
        </section>
        <section class="sec2"><#if site??>${site.copyright!''}</#if></section>
        <section class="sec3">技术支持：<a href="www.cqtiandu.com" style="color:#f2f2f2;">重庆天度网络</a></section>
      </article><!-- bottom-info end -->
    </div>
  </footer>
  <!-- index-footer end -->

</body>
</html>