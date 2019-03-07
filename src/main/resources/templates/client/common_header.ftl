<header class="index-header">
    <article class="index-nav">
      <a class="index-logo" href="/" title="">
        <img src="<#if site??>${site.logoUri!''}</#if>" alt="" />
      </a>
      <ul>
        <#if navi_bar_list??>
        <#list navi_bar_list as item>
            <#if !item.parentId??>
                <li>
                    <a href="${item.linkUri!''}" class="a1">
                        <div>${item.title!''}</div>
                        <p>${item.engTitle!''}</p>
                    </a>
                    <#if navi_bar_list[item_index+1]?? && navi_bar_list[item_index+1].parentId??>
                        <nav>
                            <#list 1..navi_bar_list?size as idx>
                                <a href="${navi_bar_list[item_index+idx].linkUri!''}">${navi_bar_list[item_index+idx].title!''}</a>
                                <#if !navi_bar_list[item_index+idx+1]?? || !navi_bar_list[item_index+idx+1].parentId??>
                                    <#break>
                                </#if>
                            </#list>
                        </nav>
                    </#if>
                </li>
                </#if>
            </#list>
        </#if>
        
      </ul>
    </article>