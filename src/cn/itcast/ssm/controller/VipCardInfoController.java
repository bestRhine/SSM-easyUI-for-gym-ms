package cn.itcast.ssm.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import cn.itcast.ssm.po.ActiveUser;
import cn.itcast.ssm.po.VipCardInfo;
import cn.itcast.ssm.po.VipCardInfo;
import cn.itcast.ssm.service.VipCardInfoService;
import cn.itcast.ssm.service.VipCardInfoService;;
@Controller
public class VipCardInfoController extends BaseController{ 
	
	@Resource
	VipCardInfoService vipCardInfoService;
	
	@RequestMapping("/vipCardInfo/getCard")  
	 public String getCard(Model model)throws Exception {
		//从shiro的session中取activeUser
				Subject subject = SecurityUtils.getSubject();
				//取身份信息
				ActiveUser activeUser = (ActiveUser) subject.getPrincipal();

				//通过model传到页面
				model.addAttribute("activeUser", activeUser);

	    	return "vipCardInfoHome";
	    }
	
	//跳转至列表页面
	@RequestMapping("/vipCardInfo/list")  
   public  @ResponseBody List<VipCardInfo>   list(){ 
		
		int total=vipCardInfoService.getTotal();
		List<VipCardInfo> vipCardInfoList = vipCardInfoService.list(0, total);

		return vipCardInfoList;//转向首页
	}
	
	
	//////列表查询
	@RequestMapping("/vipCardInfo/listBy")  
    public @ResponseBody List<VipCardInfo>  listBy(String chargeMethod){ 
		
		System.out.println(chargeMethod);
		
		if(chargeMethod== null || chargeMethod=="") {
			int total=vipCardInfoService.getTotal();
			List<VipCardInfo> vipCardInfoList = vipCardInfoService.list(0, total);
			return vipCardInfoList;
		}else {
			Map<String,Object> map = new HashMap<String,Object>();
		map.put("chargeMethod","%"+chargeMethod+"%");
		List<VipCardInfo> vipCardInfoList = vipCardInfoService.find(map);
		return vipCardInfoList;
		}
		
	}
	
	//////编辑
	@RequestMapping("/vipCardInfo/edit")  
    public @ResponseBody String edit(HttpServletRequest request, HttpServletResponse response){   
		 VipCardInfo us=new VipCardInfo();
		 String cardTypeSerial= request.getParameter("cardTypeSerial");
	     String vipCardType= request.getParameter("vipCardType");
	     String chargeMethod = request.getParameter("chargeMethod");
	     String price = request.getParameter("price");
	     String effectiveMonth = request.getParameter("effectiveMonth");
	     String effectiveTimes = request.getParameter("effectiveTimes");
	     String giveTime = request.getParameter("giveTime");
	     String giveTimes = request.getParameter("giveTimes");     
	     us.setCardTypeSerial(Integer.parseInt(cardTypeSerial));
	     us.setChargeMethod(chargeMethod);
	     us.setPrice(Integer.parseInt(price));
	     us.setVipCardType(vipCardType);
	     if(effectiveMonth!=null) us.setEffectiveMonth(Integer.parseInt(effectiveMonth));
	     if(effectiveTimes!=null) us.setEffectiveTimes(Integer.parseInt(effectiveTimes));
	     if(giveTime!=null) us.setGiveTime(Integer.parseInt(giveTime));
	     if(giveTimes!=null) us.setGiveTimes(Integer.parseInt(giveTimes));
	     vipCardInfoService.update(us);
	     return "success";	
    }  
	 
	////// 删除
	@RequestMapping("/vipCardInfo/delete")  
    public @ResponseBody String delete(HttpServletRequest request, HttpServletResponse response){   
		String cardTypeSerial= request.getParameter("cardTypeSerial");
		vipCardInfoService.deleteById(Integer.parseInt(cardTypeSerial));		
		return "success";
    } 
	
	//////添加
	@RequestMapping("/vipCardInfo/add")  
    public @ResponseBody String add(HttpServletRequest request, HttpServletResponse response){   
		VipCardInfo us=new VipCardInfo();
	     String vipCardType= request.getParameter("vipCardType");
	     String chargeMethod = request.getParameter("chargeMethod");
	     String price = request.getParameter("price");
	     String effectiveMonth = request.getParameter("effectiveMonth");
	     String effectiveTimes = request.getParameter("effectiveTimes");
	     String giveTime = request.getParameter("giveTime");
	     String giveTimes = request.getParameter("giveTimes");     
	     us.setChargeMethod(chargeMethod);
	     us.setPrice(Integer.parseInt(price));
	     us.setVipCardType(vipCardType);
	     if(effectiveMonth!=null) us.setEffectiveMonth(Integer.parseInt(effectiveMonth));
	     if(effectiveTimes!=null) us.setEffectiveTimes(Integer.parseInt(effectiveTimes));
	     if(giveTime!=null) us.setGiveTime(Integer.parseInt(giveTime));
	     if(giveTimes!=null) us.setGiveTimes(Integer.parseInt(giveTimes));
	     vipCardInfoService.insert(us);
	     return "success";
    } 
	
	private Map<String,Object> vipCardInfoToMap(VipCardInfo vipCardInfo){
		Map<String,Object> map = new HashMap<String,Object>();
		return map;
	}
    private String checkStringIsEmpty(String param){
    	return param==null?null:(param.equals("")?null:"%"+param+"%");
    }
}
