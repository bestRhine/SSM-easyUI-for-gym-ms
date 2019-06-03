package cn.itcast.ssm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.ssm.mapper.SysEmp2Mapper;
import cn.itcast.ssm.po.ActiveUser;
import cn.itcast.ssm.po.SysEmp;
import cn.itcast.ssm.po.SysEmp;
import cn.itcast.ssm.service.SysEmpService;
import cn.itcast.ssm.service.SysService;

/**
 *
 * Title:EmpController
 * Description: 员工的控制类
 * Company:cn.itcast.ssm.controller
 * @author YAO
 * @date 2019年4月11日 下午7:45:23
 */
@Controller
public class EmpController {
	
	@Autowired 
	SysService sysService;
	
	@Autowired 
	SysEmpService sysEmpService;
	
	@RequestMapping("/empManager/getEmps")
	public String getRoles() {
		return "empList";
	}
	//获取所有员工
	@RequestMapping("/empManager/queryEmps.action")
	public @ResponseBody List<SysEmp> queryEmp() throws Exception{
		ActiveUser activeUser = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
		System.out.println("activeUser:"+activeUser);
		List<SysEmp> empList = sysService.findEmpList(activeUser.getTid());
		return empList;
	}
	
	
//////列表查询
	@RequestMapping("/emp/listBy")  
  public @ResponseBody List<SysEmp>  listBy(String chargeMethod){ 
		
		System.out.println(chargeMethod);
		
		if(chargeMethod== null || chargeMethod=="") {
			int total=sysEmpService.getTotal();
			List<SysEmp> SysEmpList = sysEmpService.list(0, total);
			return SysEmpList;
		}else {
			Map<String,Object> map = new HashMap<String,Object>();
		map.put("chargeMethod","%"+chargeMethod+"%");
		List<SysEmp> SysEmpList = sysEmpService.find(map);
		return SysEmpList;
		}
		
	}
	
	//////编辑
	@RequestMapping("/emp/edit")  
  public @ResponseBody String edit(HttpServletRequest request, HttpServletResponse response){   
		 SysEmp us=new SysEmp();
		 String id= request.getParameter("id");
	     String name = request.getParameter("name");
	     String phone = request.getParameter("phone");
	     String email = request.getParameter("email");
	     String gender = request.getParameter("gender");     
	     us.setEmpId(id);
	     us.setName(name);
	     us.setPhone(phone);
	     us.setEmail(email);
	     us.setGender(gender); 
	     sysEmpService.update(us);
	     return "success";	
  }  
	 
	////// 删除
	@RequestMapping("/emp/delete")  
  public @ResponseBody String delete(HttpServletRequest request, HttpServletResponse response){   
		String id= request.getParameter("id");
		sysEmpService.deleteById(id);		
		return "success";
  } 
	
	//////添加
	@RequestMapping("/emp/add")  
	public @ResponseBody String add(HttpServletRequest request, HttpServletResponse response){   
			SysEmp us=new SysEmp();
	     String id= request.getParameter("empId");
	     String name = request.getParameter("name");
	     String phone = request.getParameter("phone");
	     String pwd = request.getParameter("pwd");
	     String email = request.getParameter("email");
	     String type = "emp";
	     String gender = request.getParameter("gender");     
	     us.setEmpId(id);
	     us.setName(name);
	     us.setPhone(phone);
	     us.setEmail(email);
	     us.setType(type);
	     us.setGender(gender);  
	     Subject subject = SecurityUtils.getSubject();
			//取身份信息
			ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
			us.setTid(activeUser.getTid());	
			
			String random=new SecureRandomNumberGenerator().nextBytes().toHex();
			//将原始密码加盐（上面生成的盐），并且用md5算法加密三次，将最后结果存入数据库中
			String result = new Md5Hash(pwd,random,3).toString();
		us.setSalt(random);
		us.setPwd(result);
	     sysEmpService.insert(us);
	     return "success";
  } 
	
	
	
}
