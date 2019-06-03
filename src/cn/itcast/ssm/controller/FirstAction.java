package cn.itcast.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.ssm.po.ActiveUser;
import cn.itcast.ssm.po.FmsVersion;
import cn.itcast.ssm.service.SysService;


@Controller
public class FirstAction {
	
	@Autowired
	private SysService sysService;
	
	
	//系统首页
	@RequestMapping("/first")
	public String first(Model model)throws Exception{
		//从shiro的session中取activeUser
		Subject subject = SecurityUtils.getSubject();
		//取身份信息
		ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
		//获取版本信息
		FmsVersion fmsVersion = sysService.getCurrentVersion();
		//通过model传到页面
		model.addAttribute("activeUser", activeUser);
		model.addAttribute("fmsVersion",fmsVersion);
		
		return "/first";
	}
	
	//欢迎页面
	@RequestMapping("/welcome")
	public String welcome(Model model)throws Exception{
		
		return "/welcome";
		
	}
}	
