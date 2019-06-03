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
import cn.itcast.ssm.po.Course;
import cn.itcast.ssm.po.FmsVersion;
import cn.itcast.ssm.po.UserInfo;
import cn.itcast.ssm.service.UserInfoService;;
@Controller
public class UserInfoController extends BaseController{ 
	
	@Resource
	UserInfoService userInfoService;
	
	@RequestMapping("/userInfo/getUser")  
	 public String getUser(Model model)throws Exception {
		//从shiro的session中取activeUser
				Subject subject = SecurityUtils.getSubject();
				//取身份信息
				ActiveUser activeUser = (ActiveUser) subject.getPrincipal();

				//通过model传到页面
				model.addAttribute("activeUser", activeUser);

	    	return "userInfoHome";
	    }
	
	//跳转至列表页面
	@RequestMapping("/userInfo/list")  
   public  @ResponseBody List<UserInfo>   list(){ 
		
		int total=userInfoService.getTotal();
		List<UserInfo> userInfoList = userInfoService.list(0, total);

		return userInfoList;//转向首页
	}
	
	
	//////列表查询
	@RequestMapping("/userInfo/listBy")  
    public @ResponseBody List<UserInfo>  listBy(String username){ 
		
		if(username== null || username=="") {
			int total=userInfoService.getTotal();
			List<UserInfo> userInfoList = userInfoService.list(0, total);
			return userInfoList;
		}else {
			Map<String,Object> map = new HashMap<String,Object>();
		map.put("username","%"+username+"%");
		List<UserInfo> userInfoList = userInfoService.find(map);
		return userInfoList;
		}
		
	}
	
	//////编辑
	@RequestMapping("/userInfo/edit")  
    public @ResponseBody String edit(HttpServletRequest request, HttpServletResponse response){   
		 UserInfo us=new UserInfo();
		 String userNumber= request.getParameter("userNumber");
	     String weixin= request.getParameter("weixin");
	     String username = request.getParameter("username");
	     String phone = request.getParameter("phone");
	     us.setUserNumber(userNumber);
	     us.setUsername(username);
	     us.setPhone(phone);
	     us.setWeixin(weixin);
	     userInfoService.update(us);
	     return "success";	
    }  
	 
	////// 删除
	@RequestMapping("/userInfo/delete")  
    public @ResponseBody String delete(HttpServletRequest request, HttpServletResponse response){   
		String userNumber= request.getParameter("userNumber");
		userInfoService.deleteById(userNumber);		
		return "success";
    } 
	
	//////添加
	@RequestMapping("/userInfo/add")  
    public @ResponseBody String add(HttpServletRequest request, HttpServletResponse response){   
		UserInfo us=new UserInfo();
		String userNumber=request.getParameter("userNumber");
  	     String userNumber1=UUID.randomUUID().toString();
	     String weixin= request.getParameter("weixin");
	     String username = request.getParameter("username");
	     String phone = request.getParameter("phone");
	     String sex = request.getParameter("sex");
	     String emergencyContactNumber = request.getParameter("emergencyContactNumber");
	     us.setUserNumber(userNumber1);
	     us.setUsername(username);
	     us.setPhone(phone);
	     us.setWeixin(weixin);
	     us.setSex(sex);
	     us.setEmergencyContactNumber(emergencyContactNumber);
	     us.setRegisterDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
	     userInfoService.insert(us);
	     return "success";
    } 
	
	private Map<String,Object> userInfoToMap(UserInfo userInfo){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("tid",checkStringIsEmpty(userInfo.getPhone()));
		
		return map;
	}
    private String checkStringIsEmpty(String param){
    	return param==null?null:(param.equals("")?null:"%"+param+"%");
    }
}
