package com.ynyes.miyou.controller.front;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ynyes.miyou.entity.TdAdType;
import com.ynyes.miyou.entity.TdArticleCategory;
import com.ynyes.miyou.entity.TdDemand;
import com.ynyes.miyou.service.TdAdService;
import com.ynyes.miyou.service.TdAdTypeService;
import com.ynyes.miyou.service.TdArticleCategoryService;
import com.ynyes.miyou.service.TdArticleService;
import com.ynyes.miyou.service.TdCommonService;
import com.ynyes.miyou.service.TdDemandService;
import com.ynyes.miyou.util.ClientConstant;
import com.ynyes.miyou.util.VerifServlet;

/**
 * 前端首页控制
 *
 */
@Controller
@RequestMapping("/")
public class TdIndexController {

    @Autowired
    private TdCommonService tdCommonService;


    @Autowired
    private TdArticleService tdArticleService;

    @Autowired
    private TdArticleCategoryService tdArticleCategoryService;

    @Autowired
    private TdAdTypeService tdAdTypeService;

    @Autowired
    private TdAdService tdAdService;
    
    @Autowired
    private TdDemandService tdDemandService;


    @RequestMapping
    public String index(HttpServletRequest req, Device device, ModelMap map) {
       
    	tdCommonService.setHeader(map, req);
//         触屏
        if (device.isMobile() || device.isTablet()) {
            return "redirect:/touch/";
        }
        
        // 首页大图轮播广告
       TdAdType adType = tdAdTypeService.findByTitle("首页大图广告");

       if (null != adType) {
           map.addAttribute("big_scroll_ad_list", tdAdService
                  .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
       }
       
       adType = tdAdTypeService.findByTitle("最新动态广告");

       if (null != adType) {
           map.addAttribute("new_ad_list", tdAdService
                  .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
       }
       
       adType = tdAdTypeService.findByTitle("首页中部广告");

       if (null != adType) {
           map.addAttribute("center_ad_list", tdAdService
                  .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
       }
       
       map.addAttribute("company", tdArticleService.findBytitle("公司介绍"));
       map.addAttribute("com_video", tdArticleService.findBytitle("视频"));
       
       List<TdArticleCategory> catList = tdArticleCategoryService
             .findByMenuId(13L);

	     if (null != catList && catList.size() > 0) {
	         for (TdArticleCategory tdCat : catList)
	         {
	             if (null != tdCat.getTitle() && tdCat.getTitle().equals("产品中心"))
	             {
	                 map.addAttribute("product_page", tdArticleService
	                         .findByMenuIdAndCategoryIdAndIsEnableOrderByIdDesc(13L,
	                                 tdCat.getId(), 0, ClientConstant.pageSize));
	                 break;
	             }
	         }
	     }
        
	     map.addAttribute("new_page", tdArticleService.findByMenuId(12L, 0, 3));
	     
        return "/client/index";
        

    }
    
    @RequestMapping(value = "/code",method = RequestMethod.GET)
    public void verify(HttpServletResponse response, HttpServletRequest request) {
        response.setContentType("image/jpeg");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        VerifServlet randomValidateCode = new VerifServlet();
        randomValidateCode.getRandcode(request, response);
    }
    
    @RequestMapping(value="/message/add",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> message(String name,String mobile,String type,
    		String mail,String content,String yzm,HttpServletRequest req)
    {
    	String codeBack = (String) req.getSession().getAttribute("RANDOMVALIDATECODEKEY");
    	Map<String,Object> res = new HashMap<String, Object>();
    	
    	if(null == name || "".equals(name.trim()))
    	{
    		res.put("msg", "请输入您的称呼");
    		return res;
    	}
    	if(null == mobile || "".equals(mobile.trim()) || !isMobileNO(mobile))
    	{
    		res.put("msg", "请正确输入您的联系电话");
    		return res;
    	}
    	if(null == content || "".equals(content.trim()))
    	{
    		res.put("msg", "请输入您的留言内容");
    		return res;
    	}
    	
    	if(null != type)
    	{
    		if(null == yzm || !yzm.equalsIgnoreCase(codeBack))
    		{
    			res.put("msg", "验证码输入错误");
    			return res;
    		}
    	}
    	
    	TdDemand demand = new TdDemand();
    	demand.setContent(content);
    	demand.setMail(mail);
    	demand.setMobile(mobile);
    	demand.setName(name);
    	
    	tdDemandService.save(demand);
    	res.put("msg", "留言提交成功，感谢您的支持");
    	return res;
    }
    
    public boolean isMobileNO(String mobiles) {
		Pattern p = Pattern.compile("^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$");
		Matcher m = p.matcher(mobiles);
		return m.matches();
		}
    
}
