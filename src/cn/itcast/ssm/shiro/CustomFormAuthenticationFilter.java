package cn.itcast.ssm.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
/**
 * 	自定义表单认证过滤器
 * @author YAO
 *
 */
public class CustomFormAuthenticationFilter extends FormAuthenticationFilter{

	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		//在return之前进行验证码校验
		//得到session
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpSession session = httpServletRequest.getSession();
		//从session获取正确的验证码
		String validateCode = (String) session.getAttribute("validateCode");
		//从request获取用户输入的验证码
		String randomCode = httpServletRequest.getParameter("randomcode");
		//对比两个验证码
		if(randomCode != null&&validateCode!=null&&!randomCode.equals(validateCode))
		{
			//验证失败，将失败信息设置到shiroLoginFailure中
			httpServletRequest.setAttribute("shiroLoginFailure","randomCodeError");
			//验证失败则阻止继续认证
			return true;
		}
		
		return super.onAccessDenied(request, response);
	}

}
