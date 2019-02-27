package cn.itcast.ssm.controller;
/**
 * 	手动清除缓存
 * @author YAO
 *
 */

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.ssm.shiro.CustomRealm;

@Controller
public class ClearShiroCache {

	@Autowired
	CustomRealm customRealm;
	
	@RequestMapping("/clearShiroCache")
	public String clearShiroCache()
	{
		//将来正常开发要在service中 修改权限后 调用clearCached，
		customRealm.clearCached();
		return "success";
	}
	
}
