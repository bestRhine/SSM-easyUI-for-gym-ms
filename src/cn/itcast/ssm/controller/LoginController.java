package cn.itcast.ssm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.ssm.exception.CustomException;
import cn.itcast.ssm.po.ActiveUser;
import cn.itcast.ssm.service.SysService;

/**
 *	登陆和退出
 * @author YAO
 *
 */
@Controller
public class LoginController {
	
	@Autowired
	private SysService sysService;
	
	/**
	 * 整合shiro后的认证方式
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login")
	public String login(HttpServletRequest request)throws Exception
	{
		//如果登陆失败，过滤器会将失败信息（异常类的全限定名）放到request域中的一个参数中————shiroLoginFailure，
		//所以这个参数的值是shiro异常类的全限定名，
		String exceptionClassName = (String) request.getAttribute("shiroLoginFailure");
		if(exceptionClassName != null)
		{
			if(UnknownAccountException.class.getName().equals(exceptionClassName))
			{
				throw new CustomException("账号不存在");
			} 
			else if(IncorrectCredentialsException.class.getName().equals(exceptionClassName))
			{
				throw new CustomException("用户名/密码错误");
			} 
			else if("randomCodeError".equals(exceptionClassName))
			{
				throw new CustomException("验证码错误");
			}
			else
			{
				throw new Exception();//最终在异常处理其生成未知错误
			}
		}
		//此方法不处理登陆成功（认证成功），shiro认证成功会自动跳转到上一个请求路径，
		//也可以配置认证成功统一跳转路径<property name="successUrl">
		
		//登陆失败还到login
		return "login";
	}

}
