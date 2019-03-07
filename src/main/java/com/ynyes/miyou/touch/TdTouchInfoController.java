package com.ynyes.miyou.touch;

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

/**
 * 
 * 资讯
 *
 */
@Controller
@RequestMapping("/touch")
public class TdTouchInfoController {
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
	
	@RequestMapping(value="/info/news")
	public String news(Long mid,Long catId,HttpServletRequest req,ModelMap map,Integer page)
	{
		tdCommonService.setHeader(map, req);
		
		if(null == mid)
		{
			mid=12L;
		}
		List<TdArticleCategory> list = tdArticleCategoryService.findByMenuId(mid);
		
		if(null != list && list.size() > 0)
		{
			for (int i=0; i<list.size(); i++) {
				map.addAttribute("news_"+i+"_list", tdArticleService.findByCategoryId(list.get(i).getId()));
			}
		}
		
	   map.addAttribute("catList", list);
	   map.addAttribute("page", page);
	   map.addAttribute("mid", mid);
	   map.addAttribute("catId", catId);
	   
		return "/touch/info_new";
	}

	@RequestMapping(value="/info/content")
	public String content(Long id,Long mid,HttpServletRequest req,ModelMap map)
	{
		
		tdCommonService.setHeader(map, req);
		map.addAttribute("mid",mid);
		
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
		return "/touch/info_content";
	}
	
	@RequestMapping(value="/info/about")
	public String aboutU(Long id,Long mid,HttpServletRequest req,ModelMap map){
		tdCommonService.setHeader(map, req);
		
		
		 // 首页大图轮播广告
       TdAdType adType = tdAdTypeService.findByTitle("触屏关于我们广告图");

       if (null != adType) {
           map.addAttribute("aboutus_ad_list", tdAdService
                  .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
       }
       map.addAttribute("about_list", tdArticleService.findByMenuId(mid));
       
       map.addAttribute("id", id);
       map.addAttribute("mid", mid);
       
		return "/touch/info_company";
	}
	
	@RequestMapping(value="/info/detail")
	public String detail(Long id,Long mid,HttpServletRequest req,ModelMap map)
	{
		tdCommonService.setHeader(map, req);
		map.addAttribute("mid",mid);
		
		TdArticle tdArticle = tdArticleService.findOne(id);
    	if(null != tdArticle){
    		map.addAttribute("info",tdArticle);
    	}
		
		return "/touch/info_detail";
	}
	
	
	@RequestMapping(value="/info/contact")
	public String contact(HttpServletRequest req,ModelMap map)
	{
		tdCommonService.setHeader(map, req);
		
		return "/touch/info_contact";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
