package cn.itcast.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.itcast.ssm.po.SysRole;
import cn.itcast.ssm.service.SysService;
@Controller
@RequestMapping("/empManager")
public class RoleController {
	
	@Autowired SysService sysService;
	
	@RequestMapping("/queryRoles")
	public ModelAndView queryRole() throws Exception {
		
		List<SysRole> roleList = sysService.findRoleList();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("roleList", roleList);
		modelAndView.setViewName("roleList");
		
		
		return modelAndView;
	}
	
}
