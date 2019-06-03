package cn.itcast.ssm.controller;

import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.ssm.po.Tenant;
import cn.itcast.ssm.service.TenantService;
import cn.itcast.ssm.service.UserInfoService;

@Controller
public class RegisterController {

	/**
	 * 	注册
	 * @return
	 */
	@Resource
	TenantService tenantService;
	
	
	
	
	@RequestMapping("/register")
	public @ResponseBody String register(HttpServletRequest request, HttpServletResponse response){
		System.out.println("1111111111");
		String phone= request.getParameter("phone");
		String username= request.getParameter("username");
		String email= request.getParameter("email");
		String password= request.getParameter("password");
		String version= request.getParameter("version");
		//生成盐（部分，需要存入数据库中）
		String random=new SecureRandomNumberGenerator().nextBytes().toHex();
		//将原始密码加盐（上面生成的盐），并且用md5算法加密三次，将最后结果存入数据库中
		String result = new Md5Hash(password,random,3).toString();
		
		Tenant t = new Tenant();
		t.setTenant_id(UUID.randomUUID().toString());
		t.setTphone(phone);
		t.setTname(username);
		t.setTemail(email);
		t.setSalt(random);
		t.setTpwd(result);
		t.setVersion_id(version);
		tenantService.insert(t);
		return "success";
	}
	
}
