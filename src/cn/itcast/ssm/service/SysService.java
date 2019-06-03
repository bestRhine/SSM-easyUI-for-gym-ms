package cn.itcast.ssm.service;

import java.util.List;

import cn.itcast.ssm.po.ActiveUser;
import cn.itcast.ssm.po.FmsVersion;
import cn.itcast.ssm.po.SysEmp;
//import cn.itcast.ssm.po.SysPermission;
//import cn.itcast.ssm.po.SysRole;
import cn.itcast.ssm.po.SysFunction;
import cn.itcast.ssm.po.SysRole;

/**
 * 
 * Description: 认证授权服务接口
 */
public interface SysService {
	
	//根据用户的身份和密码 进行认证，如果认证通过，返回用户身份信息
//	public ActiveUser authenticat(String userCode,String password) throws Exception;
	
	//根据用户账号查询用户信息
	public SysEmp findSysEmpByUserCode(String userCode)throws Exception;
//	
//	//根据用户id查询权限范围的菜单
//	public List<SysPermission> findMenuListByUserId(String userid) throws Exception;
//	

	
//	//根据角色id查询权限范围的菜单
//	public List<SysPermission> findMenuListByRoleId(String roleid) throws Exception;
//	
//	//根据角色id查询权限范围的url
//	public List<SysPermission> findPermissionListByRoleId(String roleid) throws Exception;
//	
//	

//	//获取全部资源permission
//	public List<SysPermission> findPermissionList() throws Exception;
//	
//	
//	//插入角色
//	public void addRole(SysRole role)throws Exception;
	
	
	//查询用户功能。需要根据用户类型判断如何查询功能，所以传入ActiveUser
	public List<SysFunction> findFunctionListByUserId(ActiveUser activeUser) throws Exception;
	//获取当前租户全部角色
	public List<SysRole> findRoleList(String tid) throws Exception;
	//查询当前租户所有员工
	public List<SysEmp> findEmpList(String tid)throws Exception;
	//查询当前所有租户（后台管理员功能）
	public List<SysEmp> findTenantList();
	
	
	
	//获取本管理系统开发版本信息
	public FmsVersion getCurrentVersion() throws Exception;
	
	public void updateByPrimaryKeySelective(SysRole record);
	
	public void deleteByPrimaryKey(String roleId);
	public void addRole(SysRole role);
	
}
