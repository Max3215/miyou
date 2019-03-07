<footer class="common-footer">
    <div class="w1200">
      <article class="left">
        <img src="<#if site??>${site.bottomLogoUri1!''}</#if>" alt="" />
        <div>
          <p><#if site??>${site.copyright!''}</#if></p>
          <p>咨询热线：<#if site??>${site.telephone!''}</#if> 地址：<#if site??>${site.address!''}</#if></p>
        </div>
      </article><!-- left end -->
      <article class="right">
        <img src="<#if site??>${site.wxQrCode!''}</#if>" alt="" />
        <div>
          <p>微信扫一扫</p>
          <p>获取更多资讯和服务</p>
        </div>
      </article><!-- right end -->
      <div class="clear"></div>
    </div>
  </footer>