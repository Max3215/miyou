package com.ynyes.miyou.touch;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
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

import com.tencent.common.Configure;
import com.ynyes.miyou.entity.TdAdType;
import com.ynyes.miyou.entity.TdArticle;
import com.ynyes.miyou.entity.TdArticleCategory;
import com.ynyes.miyou.entity.TdDemand;
import com.ynyes.miyou.service.TdAdService;
import com.ynyes.miyou.service.TdAdTypeService;
import com.ynyes.miyou.service.TdArticleCategoryService;
import com.ynyes.miyou.service.TdArticleService;
import com.ynyes.miyou.service.TdCommonService;
import com.ynyes.miyou.service.TdDemandService;

import net.sf.json.JSONObject;

/**
 * 前端首页控制
 *
 */
@Controller
@RequestMapping("/touch")
public class TdTouchIndexController {

    @Autowired
    private TdCommonService tdCommonService;

    @Autowired
    private TdAdTypeService tdAdTypeService;

    @Autowired
    private TdAdService tdAdService;
    
    @Autowired
    private TdArticleCategoryService tdArticleCategoryService;
    
    @Autowired 
	private TdArticleService tdArticleService;

    @Autowired
    private TdDemandService tdDemandService;

    @RequestMapping(value="/")
    public String index(HttpServletRequest req, Device device, ModelMap map) throws UnsupportedEncodingException {

        tdCommonService.setHeader(map, req);

        // 触屏页中部广告
        TdAdType adType = tdAdTypeService.findByTitle("触屏首页大图广告");

        if (null != adType) {
            map.addAttribute("touch_middle_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
        }
        
        List<TdArticleCategory> list = tdArticleCategoryService.findByMenuId(10L);
		
		if(null != list && list.size() >0)
		{
			for (TdArticleCategory cat : list) {
				if(null != cat.getTitle() && cat.getTitle().equals("走进绿玉春")){
					List<TdArticle> artList = tdArticleService.findByCategoryId(cat.getId());
					map.addAttribute("showus_list", artList);
				}
			}
		}
		
		List<TdArticleCategory> prolist = tdArticleCategoryService.findByMenuId(13L);
		
		if(null != prolist && prolist.size() >0)
		{
			for (TdArticleCategory cat : prolist) {
				if(null != cat.getTitle() && cat.getTitle().equals("产品中心")){
					map.addAttribute("product_list", tdArticleService.findByCategoryId(cat.getId()));
				}
			}
		}
		
		map.addAttribute("news_list", tdArticleService.findByMenuId(12L));

        return "/touch/index";
    }
    
    @RequestMapping(value="/message/add",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> message(String name,String mobile,String type,
    		String mail,String content,String yzm,HttpServletRequest req)
    {
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
    
    @RequestMapping(value="/index")
    public String getAccessToken(String code,HttpServletRequest req,HttpServletResponse resp)
    {
    	System.err.println("Max---index----code------"+code);
    	String tokenUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + Configure.getAppid() +
    			"&secret="+ Configure.getSecret() +"&code="+code+"&grant_type=authorization_code";
    	
    	String openId =null;
    	
    	try {
			URL url = new URL(tokenUrl);
			
			HttpURLConnection http = (HttpURLConnection) url.openConnection();

			http.setRequestMethod("GET");
			http.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
			http.setDoOutput(true);
			http.setDoInput(true);
			http.connect(); 
			
			InputStream stream = http.getInputStream();
			int size = stream.available();
			
			byte[] json = new byte[size];
			
			stream.read(json);
			
			String message = new String(json,"UTF-8");
			
			System.err.println("Max---index---message-----"+message);
			
			JSONObject jsonObject = JSONObject.fromObject(message);
			
			openId = jsonObject.getString("openid");
			
			System.err.println("Max----index---openId--------"+openId);
			
			req.getSession().setAttribute("OPENID", openId);
			
			stream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return "redirect:/touch/";
    }
}
