package cn.itcast.ssm.po;

import java.util.Iterator;
import java.util.List;

import com.sun.org.apache.bcel.internal.generic.NEW;

/**
 *	 用户身份信息，存入session 由于tomcat将session会序列化在本地硬盘上，所以使用Serializable接口
 * 
 * @author YAO
 * 
 */
public class ActiveUser implements java.io.Serializable {
	private String userid;//用户id（主键）
	private String usercode;// 用户账号
	private String username;// 用户名称
	private String tid;//用户所属租户
	private String type;//用户的类型   admin（租户超管）   emp（普通员工）
	private String vid;//如果是admin，则会有购买的版本id

//	private List<SysPermission> menus;// 菜单
//	private List<SysPermission> permissions;// 权限

	public String getVid() {
		return vid;
	}

	public void setVid(String vid) {
		this.vid = vid;
	}

	public String getTid() {
		return tid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "ActiveUser [userid=" + userid + ", usercode=" + usercode + ", username=" + username + ", tid=" + tid
				+ ", type=" + type + ", vid=" + vid + "]";
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}


	public String getUsercode() {
		return usercode;
	}

	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

//	public List<SysPermission> getMenus() {
//		return menus;
//	}
//
//	public void setMenus(List<SysPermission> menus) {
//		this.menus = menus;
//	}
//
//	public List<SysPermission> getPermissions() {
//		return permissions;
//	}
//
//	public void setPermissions(List<SysPermission> permissions) {
//		this.permissions = permissions;
//	}

	
}
