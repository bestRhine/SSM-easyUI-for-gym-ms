package cn.itcast.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.itcast.ssm.po.SysPermission;
import cn.itcast.ssm.po.SysRole;
import cn.itcast.ssm.service.SysService;
import cn.itcast.ssm.util.TreeNode;
import cn.itcast.ssm.util.TreeNodeUtil;
@Controller
@RequestMapping("/roleManager")
public class RoleController {
	
	@Autowired 
	SysService sysService;
	@RequestMapping("/getRoles")
	public String getRoles() {
		return "roleList";
	}
	
	
	@RequestMapping("/queryRoles")
	public @ResponseBody List<SysRole> queryRole() throws Exception {
		
		List<SysRole> roleList = sysService.findRoleList();	
		
		return roleList;
	}
	
	@RequestMapping("/queryRolePermission")
	public ModelAndView queryRolePermission(String roleid) throws Exception{
		
		List<SysPermission> permissionList = sysService.findPermissionListByRoleId(roleid);
		List<SysPermission> menuList = sysService.findMenuListByRoleId(roleid);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("menuList", menuList);
		modelAndView.addObject("permissionList", permissionList);
		modelAndView.setViewName("viewPermissionList");
		
		return modelAndView;
	}
	
	//获取所有资源
	@RequestMapping("/getPermissions")
	public @ResponseBody List<TreeNode> queryPermission() throws Exception{
		
		List<SysPermission> permissionList = sysService.findPermissionList();	
		List<TreeNode> nodes = TreeNodeUtil.toListNode(permissionList);
		List<TreeNode> treeNodes = TreeNodeUtil.tree(nodes, 1L);
		
		return treeNodes;
	}
	//增加role
	@RequestMapping("/addRole")
	public @ResponseBody String addRole(SysRole role) throws Exception {
		sysService.addRole(role);
		return "success";
		
	}
}
