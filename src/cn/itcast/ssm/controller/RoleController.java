package cn.itcast.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.itcast.ssm.po.ActiveUser;
import cn.itcast.ssm.po.SysEmp;
import cn.itcast.ssm.po.SysRole;
//
//import cn.itcast.ssm.po.SysPermission;
//import cn.itcast.ssm.po.SysRole;
import cn.itcast.ssm.service.SysService;
import cn.itcast.ssm.util.TreeNode;
//import cn.itcast.ssm.util.TreeNodeUtil;

/**
 * 	角色管理
 * @author YAO
 *
 */

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
		ActiveUser activeUser = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
		List<SysRole> roleList = sysService.findRoleList(activeUser.getTid());	
		
		return roleList;
	}
	
//	@RequestMapping("/queryRolePermission")
//	public ModelAndView queryRolePermission(String roleid) throws Exception{
//		
//		List<SysPermission> permissionList = sysService.findPermissionListByRoleId(roleid);
//		List<SysPermission> menuList = sysService.findMenuListByRoleId(roleid);
//		
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.addObject("menuList", menuList);
//		modelAndView.addObject("permissionList", permissionList);
//		modelAndView.setViewName("viewPermissionList");
//		
//		return modelAndView;
//	}
//	
//	//获取所有资源
//	@RequestMapping("/getPermissions")
//	public @ResponseBody List<TreeNode> queryPermission() throws Exception{
//		
//		List<SysPermission> permissionList = sysService.findPermissionList();	
//		List<TreeNode> nodes = TreeNodeUtil.toListNode(permissionList);
//		List<TreeNode> treeNodes = TreeNodeUtil.tree(nodes, 1L);
//		
//		return treeNodes;
//	}
	//增加role
	@RequestMapping("/addRole")
	public @ResponseBody String addRole(HttpServletRequest request, HttpServletResponse response) {
		SysRole ur=new SysRole();
	     String roleId= request.getParameter("roleId");
	     String roleName = request.getParameter("roleName");
	     String available = request.getParameter("available");
 
	     ur.setRoleId(roleId);
	     ur.setRoleName(roleName);
	     ur.setAvailable(available);
	     
	     Subject subject = SecurityUtils.getSubject();
			//取身份信息
			ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
			ur.setTid(activeUser.getTid());	
			
		sysService.addRole(ur);
		return "success";
		
	}
	
	@RequestMapping("/editRole")
	public @ResponseBody String editRole(HttpServletRequest request, HttpServletResponse response)  {
		SysRole ur=new SysRole();
	     String id= request.getParameter("id");
	     String roleName = request.getParameter("roleName");
	     String available = request.getParameter("available");

	     ur.setRoleId(id);
	     ur.setRoleName(roleName);
	     ur.setAvailable(available);
	     
	     Subject subject = SecurityUtils.getSubject();
			//取身份信息
			ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
			ur.setTid(activeUser.getTid());	
			
		sysService.updateByPrimaryKeySelective(ur);
		return "success";
		
	}
	
	//////删除
	@RequestMapping("/delete")  
	public @ResponseBody String delete(HttpServletRequest request, HttpServletResponse response){   
		String id= request.getParameter("id");
		sysService.deleteByPrimaryKey(id);;		
		return "success";
	} 
}
