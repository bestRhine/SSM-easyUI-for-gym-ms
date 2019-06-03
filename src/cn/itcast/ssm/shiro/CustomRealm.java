package cn.itcast.ssm.shiro;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
//
import cn.itcast.ssm.po.ActiveUser;
import cn.itcast.ssm.po.SysEmp;
import cn.itcast.ssm.po.SysFunction;
//import cn.itcast.ssm.po.SysFunction;
import cn.itcast.ssm.service.SysService;


/**
 *	 自定义realm
 * @author YAO
 *
 */

public class CustomRealm extends AuthorizingRealm {

	@Autowired
	private SysService sysService;
	
	
	// 设置realm的名称
	@Override
	public void setName(String name) {
		super.setName("customRealm");
	}

	// 用于认证
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {

		// token是用户输入的
		// 第一步从token中取出身份信息
		String userCode = (String) token.getPrincipal();

		// 第二步：根据用户输入的userCode从数据库查询
		SysEmp sysEmp = null;
		try {
			sysEmp =  sysService.findSysEmpByUserCode(userCode);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	

		// 如果查询不到返回null
		if(sysEmp == null)
			return null;
		
		
		// 从数据库查询到密码
		//String password = "111111";
		String password = sysEmp.getPwd();
		//盐
		String salt = sysEmp.getSalt();
		
		
		// 如果查询到返回认证信息AuthenticationInfo,activeUser就是身份信息
		ActiveUser activeUser = new ActiveUser();
		activeUser.setUserid(sysEmp.getEmpId());
		activeUser.setUsercode(sysEmp.getPhone());
		activeUser.setUsername(sysEmp.getName());
		activeUser.setTid(sysEmp.getTid());
		activeUser.setType(sysEmp.getType());
		activeUser.setVid(sysEmp.getVersionId());
		//根据用户id取出菜单
//		List<SysFunction> menus = null;
//		try {
//			menus = sysService.findMenuListByUserId(sysEmp.getId());
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		activeUser.setMenus(menus);
		
		SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(
				activeUser, password,ByteSource.Util.bytes(salt), this.getName());

		return simpleAuthenticationInfo;
	}

	// 用于授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		
		//从 principals获取主身份信息
		//将getPrimaryPrincipal方法返回值转为真实身份类型（在上边的doGetAuthenticationInfo认证通过填充到SimpleAuthenticationInfo中身份类型），
		ActiveUser activeUser =  (ActiveUser) principals.getPrimaryPrincipal();
		
		//根据身份信息获取权限信息
		//连接数据库...
		//模拟从数据库获取到数据
		List<SysFunction> functionList = null;
		try {
			functionList = sysService.findFunctionListByUserId(activeUser);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		List<String> permissions = new ArrayList<String>();
		if(functionList!=null)
		{
			for(SysFunction sysFunction:functionList)
			{
				permissions.add(sysFunction.getPercode());
			}
		}
		
		//查到权限数据，返回授权信息(要包括 上边的permissions)
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		//将上边查询到授权信息填充到simpleAuthorizationInfo对象中
		simpleAuthorizationInfo.addStringPermissions(permissions);

		return simpleAuthorizationInfo;
	}
//
	//清楚缓存
	public void clearCached()
	{
		PrincipalCollection principals = SecurityUtils.getSubject().getPrincipals();
		super.clearCache(principals);
	}
}
