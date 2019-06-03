package cn.itcast.ssm.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import cn.itcast.ssm.po.SysEmp;
import cn.itcast.ssm.service.SysService;

/**
 * 
 *
 * Title:TenantController
 * Description:租户管理
 * Company:cn.itcast.ssm.controller
 * @author YAO
 * @date 2019年4月11日 下午9:17:01
 */
@Controller
@RequestMapping("/tenantManager")
public class TenantController {
	@Autowired 
	SysService sysService;
	
	@RequestMapping("/getTenants")
	//@RequiresPermissions("tenantmgt:view")
	
	public String getRoles() {
		return "tenantList";
	}
	//获取所有租户超级管理员
	@RequestMapping("/queryTenants.action")
	@RequiresPermissions("tenantmgt:view")
	public @ResponseBody List<SysEmp> queryTenant() throws Exception{
	
		List<SysEmp> tenantList = sysService.findTenantList();
		return tenantList;
	}
}
