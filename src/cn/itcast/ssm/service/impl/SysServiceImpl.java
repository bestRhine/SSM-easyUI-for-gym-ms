package cn.itcast.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.itcast.ssm.exception.CustomException;
import cn.itcast.ssm.mapper.FmsVersionMapper;
import cn.itcast.ssm.mapper.SysEmpMapper;
import cn.itcast.ssm.mapper.SysFunctionMapperCustom;
import cn.itcast.ssm.mapper.SysRoleMapper;
//import cn.itcast.ssm.mapper.SysPermissionMapper;
//import cn.itcast.ssm.mapper.SysPermissionMapperCustom;
//import cn.itcast.ssm.mapper.SysRoleMapper;
//import cn.itcast.ssm.mapper.SysEmpMapper;
import cn.itcast.ssm.po.ActiveUser;
import cn.itcast.ssm.po.FmsVersion;
import cn.itcast.ssm.po.FmsVersionExample;
import cn.itcast.ssm.po.SysEmp;
import cn.itcast.ssm.po.SysEmpExample;
import cn.itcast.ssm.po.SysFunction;
//import cn.itcast.ssm.po.SysPermission;
//import cn.itcast.ssm.po.SysPermissionExample;
//import cn.itcast.ssm.po.SysPermissionExample.Criteria;
import cn.itcast.ssm.po.SysRole;
import cn.itcast.ssm.po.SysRoleExample;
//import cn.itcast.ssm.po.SysEmp;
//import cn.itcast.ssm.po.SysEmpExample;
import cn.itcast.ssm.service.SysService;
import cn.itcast.ssm.util.MD5;

/**
 * 
 * <p>Title: SysServiceImpl</p>
 * <p>Description:认证和授权的服务接口 </p>
 * @date	2019-4-10上午11:13:30
 * @version 1.0
 */
public class SysServiceImpl implements SysService {
	
	@Autowired
	private SysEmpMapper sysEmpMapper;
	
	@Autowired
	private SysRoleMapper sysRoleMapper;
	
	@Autowired
	private SysFunctionMapperCustom sysFunctionMapperCustom;
	
	@Autowired
	private FmsVersionMapper fmsVersionMapper;

//	@Override
//	public ActiveUser authenticat(String userCode, String password)
//			throws Exception {
//		/**
//	认证过程：
//	根据用户身份（账号）查询数据库，如果查询不到用户不存在
//	对输入的密码 和数据库密码 进行比对，如果一致，认证通过
//		 */
//		//根据用户账号查询数据库
//		SysEmp sysEmp = this.findSysEmpByUserCode(userCode);
//		
//		if(sysEmp == null){
//			//抛出异常
//			throw new CustomException("用户账号不存在");
//		}
//		
//		//数据库密码 (md5密码 )
//		String password_db = sysEmp.getPassword();
//		
//		//对输入的密码 和数据库密码 进行比对，如果一致，认证通过
//		//对页面输入的密码 进行md5加密 
//		String password_input_md5 = new MD5().getMD5ofStr(password);
//		if(!password_input_md5.equalsIgnoreCase(password_db)){
//			//抛出异常
//			throw new CustomException("用户名或密码 错误");
//		}
//		//得到用户id
//		String userid = sysEmp.getId();
//		//根据用户id查询菜单 
//		List<SysPermission> menus =this.findMenuListByUserId(userid);
//		
//		//根据用户id查询权限url
//		List<SysPermission> permissions = this.findPermissionListByUserId(userid);
//		
//		//认证通过，返回用户身份信息
//		ActiveUser activeUser = new ActiveUser();
//		activeUser.setUserid(sysEmp.getId());
//		activeUser.setUsercode(userCode);
//		activeUser.setUsername(sysEmp.getUsername());//用户名称
//		
//		//放入权限范围的菜单和url
//		activeUser.setMenus(menus);
//		activeUser.setPermissions(permissions);
//		
//		return activeUser;
//	}
//	
//	//根据角色id查询所有menu
//	@Override
//	public List<SysPermission> findMenuListByRoleId(String roleid) throws Exception {
//		
//		return sysPermissionMapperCustom.findMenuListByRoleId(roleid);
//	}
//	//根据角色id查询所有permission
//	@Override
//	public List<SysPermission> findPermissionListByRoleId(String roleid) throws Exception {
//		
//		return sysPermissionMapperCustom.findPermissionListByRoleId(roleid);
//	}
//	//查询所有permissioin
//	@Override
//	public List<SysPermission> findPermissionList() throws Exception {
//		SysPermissionExample sysPermissionExample = new SysPermissionExample();
//		SysPermissionExample.Criteria criteria = sysPermissionExample.createCriteria();
//		criteria.andIdNotEqualTo(1L);
//		return sysPermissionMapper.selectByExample(sysPermissionExample);
//	}
//	
//	//新增角色
//	@Override
//	public void addRole(SysRole role) throws Exception {
//		sysRoleMapper.insert(role);
//	}
//	
//	
	//根据登入用户输入账号（phopne）查询登入用户个人信息
	public SysEmp findSysEmpByUserCode(String userCode)throws Exception{
		SysEmpExample sysEmpExample = new SysEmpExample();
		SysEmpExample.Criteria criteria = sysEmpExample.createCriteria();
		criteria.andPhoneEqualTo(userCode);
		
		List<SysEmp> list = sysEmpMapper.selectByExample(sysEmpExample);
		
		if(list!=null && list.size()==1){
			return list.get(0);
		}	
		
		return null;
	}

	//获取登入用户的可用功能。
	@Override
	public List<SysFunction> findFunctionListByUserId(ActiveUser activeUser)
			throws Exception {
		String type = activeUser.getType();
		if(type.equals("admin")) {
			return sysFunctionMapperCustom.findAdminFunctionListByUserId(activeUser.getUsercode());
		} else {
			return sysFunctionMapperCustom.findEmpFunctionListByUserId(activeUser.getUserid());
		}
	}
	
	//查询当前租户所有员工
	@Override
	public List<SysEmp> findEmpList(String tid) throws Exception {
		
		SysEmpExample sysEmpExample = new SysEmpExample();
		SysEmpExample.Criteria criteria = sysEmpExample.createCriteria();
		criteria.andTidEqualTo(tid);
		
		List<SysEmp> empList = sysEmpMapper.selectByExample(sysEmpExample);
		
		return empList;
	}
	
	//查询当前租户所有角色
	@Override
	public List<SysRole> findRoleList(String id){
		SysRoleExample sysRoleExample = new SysRoleExample();
		SysRoleExample.Criteria criteria = sysRoleExample.createCriteria();
		criteria.andTidEqualTo(id);
		List<SysRole> roleList = sysRoleMapper.selectByExample(sysRoleExample);
		return roleList;
	}

	//获取所有租户超级管理员
	@Override
	public List<SysEmp> findTenantList() {
		SysEmpExample sysEmpExample = new SysEmpExample();
		SysEmpExample.Criteria criteria = sysEmpExample.createCriteria();
		criteria.andTypeEqualTo("admin");
		List<SysEmp> tenantList = sysEmpMapper.selectByExample(sysEmpExample);
		return tenantList;
	}
	//查询当前系统的版本信息
	@Override
	public FmsVersion getCurrentVersion() throws Exception {
		return fmsVersionMapper.getCurrentVersionInfo();
	}

	@Override
	public void addRole(SysRole role) {
		sysRoleMapper.insert(role);
		
	}

	@Override
	public void updateByPrimaryKeySelective(SysRole record) {
		sysRoleMapper.updateByPrimaryKey(record);
		
	}

	@Override
	public void deleteByPrimaryKey(String roleId) {
		// TODO Auto-generated method stub
		sysRoleMapper.deleteByPrimaryKey(roleId);
	}

}
