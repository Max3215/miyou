package com.ynyes.miyou.controller.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.miyou.entity.TdAdType;
import com.ynyes.miyou.entity.TdArticle;
import com.ynyes.miyou.entity.TdArticleCategory;
import com.ynyes.miyou.service.TdAdService;
import com.ynyes.miyou.service.TdAdTypeService;
import com.ynyes.miyou.service.TdArticleCategoryService;
import com.ynyes.miyou.service.TdArticleService;
import com.ynyes.miyou.service.TdCommonService;
import com.ynyes.miyou.service.TdNavigationMenuService;

/**
 * 
 * 资讯
 *
 */
@Controller
@RequestMapping("/info")
public class TdInfoController {
	@Autowired 
	private TdArticleService tdArticleService;
	
	@Autowired 
    private TdArticleCategoryService tdArticleCategoryService;
	
	@Autowired
    private TdCommonService tdCommonService;
		
	@Autowired
    private TdAdTypeService tdAdTypeService;
	
	@Autowired
    private TdAdService tdAdService;
	
	/**
	 * 关于我们
	 * 
	 */
	@RequestMapping(value="/about")
	public String aboutU(Long id,Long mid,HttpServletRequest req,ModelMap map){
		tdCommonService.setHeader(map, req);
		
		List<TdArticleCategory> list = tdArticleCategoryService.findByMenuId(mid);
		
		if(null != list && list.size() >0)
		{
			for (TdArticleCategory cat : list) {
				if(null != cat.getTitle() && cat.getTitle().equals("关于我们")){
					map.addAttribute("cat_list", tdArticleService.findByCategoryId(cat.getId()));
					List<TdArticle> artList = tdArticleService.findByCategoryId(cat.getId());
					map.addAttribute("cat_list", artList);
					if(null == id)
					{
						id=artList.get(0).getId();
					}
				}
			}
		}
		
		map.addAttribute("info", tdArticleService.findOne(id));
		
		
		
		 // 首页大图轮播广告
       TdAdType adType = tdAdTypeService.findByTitle("首页大图广告");

       if (null != adType) {
           map.addAttribute("big_scroll_ad_list", tdAdService
                  .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
       }
       
       map.addAttribute("id", id);
       map.addAttribute("mid", mid);
       
		return "/client/info_company";
	}
	
	/**
	 * 产品中心
	 * 
	 */
	@RequestMapping(value="/product")
	public String product(Long id,Long mid,HttpServletRequest req,
			ModelMap map)
	{
		
		tdCommonService.setHeader(map, req);
		
		List<TdArticleCategory> list = tdArticleCategoryService.findByMenuId(mid);
		
		if(null != list && list.size() >0)
		{
			for (TdArticleCategory cat : list) {
				if(null != cat.getTitle() && cat.getTitle().equals("产品中心")){
					List<TdArticle> artList = tdArticleService.findByCategoryId(cat.getId());
					map.addAttribute("cat_list", artList);
					if(null == id)
					{
						id=artList.get(0).getId();
					}
				}
			}
		}
		
		map.addAttribute("info", tdArticleService.findOne(id));
		
		
		 // 首页大图轮播广告
       TdAdType adType = tdAdTypeService.findByTitle("首页大图广告");

       if (null != adType) {
           map.addAttribute("big_scroll_ad_list", tdAdService
                  .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
       }
       
       map.addAttribute("id", id);
       map.addAttribute("mid", mid);
		
		return "/client/info_product";
	}
	
	/**
	 * 新闻动态
	 * 
	 */
	@RequestMapping(value="/news")
	public String news(Long mid,Long catId,HttpServletRequest req,ModelMap map,Integer page)
	{
		tdCommonService.setHeader(map, req);
		if(null == page)
		{
			page = 0;
		}
		if(null == mid)
		{
			mid=12L;
		}
		List<TdArticleCategory> list = tdArticleCategoryService.findByMenuId(mid);
		
		
		
		if(null == catId)
		{
			if(null != list && list.size() > 0)
			{
				catId = list.get(0).getId();
			}
		}
		map.addAttribute("category", tdArticleCategoryService.findOne(catId));
		map.addAttribute("news_page",
				tdArticleService.findByMenuIdAndCategoryId(mid, catId, page,10));
		
		 // 首页大图轮播广告
       TdAdType adType = tdAdTypeService.findByTitle("首页大图广告");

       if (null != adType) {
           map.addAttribute("big_scroll_ad_list", tdAdService
                  .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
       }
        
	   map.addAttribute("catList", list);
	   map.addAttribute("page", page);
	   map.addAttribute("mid", mid);
	   map.addAttribute("catId", catId);
	   
		return "/client/info_news";
	}
	
	/**
	 * 文章详情
	 * 
	 */
	@RequestMapping(value="/content")
	public String content(Long id,Long mid,HttpServletRequest req,ModelMap map)
	{
		
		tdCommonService.setHeader(map, req);
		map.addAttribute("mid",mid);
		
		// 首页大图轮播广告
       TdAdType adType = tdAdTypeService.findByTitle("首页大图广告");

       if (null != adType) {
           map.addAttribute("big_scroll_ad_list", tdAdService
                  .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
       }
		
       map.addAttribute("catList", tdArticleCategoryService.findByMenuId(mid));
       
    	TdArticle tdArticle = tdArticleService.findOne(id);
    	if(null != tdArticle){
    		map.addAttribute("info",tdArticle);
    	}
    	TdArticleCategory category = tdArticleCategoryService.findOne(tdArticle.getCategoryId());
    	if(null != category)
    	{
    		map.addAttribute("category", category);
    		map.addAttribute("catId", category.getId());
    	}
    	
    	// 上一篇
    	TdArticle article = tdArticleService.findPrevOne(id, tdArticle.getCategoryId(), mid);
    	if(null != article){
    		map.addAttribute("prev_info",article);
    	}
    	// 下一篇
    	TdArticle tdarticle =tdArticleService.findNextOne(id, tdArticle.getCategoryId(), mid);
    	if(null != tdarticle){
    		map.addAttribute("next_info",tdarticle);
    	}
		return "/client/info_content";
	}
	
	/**
	 * 走进绿玉
	 * 
	 */
	@RequestMapping(value="/showus")
	public String showUs(Long mid,Long id,HttpServletRequest req,ModelMap map)
	{
		tdCommonService.setHeader(map, req);
		
		List<TdArticleCategory> list = tdArticleCategoryService.findByMenuId(mid);
		
		if(null != list && list.size() >0)
		{
			for (TdArticleCategory cat : list) {
				if(null != cat.getTitle() && cat.getTitle().equals("走进绿玉春")){
					List<TdArticle> artList = tdArticleService.findByCategoryId(cat.getId());
					map.addAttribute("cat_list", artList);
					if(null == id)
					{
						id=artList.get(0).getId();
					}
				}
			}
		}
		
		map.addAttribute("info", tdArticleService.findOne(id));
		
		
		 // 首页大图轮播广告
       TdAdType adType = tdAdTypeService.findByTitle("首页大图广告");

       if (null != adType) {
           map.addAttribute("big_scroll_ad_list", tdAdService
                  .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
       }
       
       map.addAttribute("id", id);
       map.addAttribute("mid", mid);
		
		return "/client/info_showus";
	}
   
	@RequestMapping(value="/contact")
	public String contact(HttpServletRequest req,ModelMap map)
	{
		tdCommonService.setHeader(map, req);
		
		 // 首页大图轮播广告
	       TdAdType adType = tdAdTypeService.findByTitle("首页大图广告");

	       if (null != adType) {
	           map.addAttribute("big_scroll_ad_list", tdAdService
	                  .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
	       }
		return "/client/info_contact";
	}

}
