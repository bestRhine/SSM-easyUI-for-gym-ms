package cn.itcast.ssm.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.mysql.jdbc.StringUtils;

import cn.itcast.ssm.po.ActiveUser;
import cn.itcast.ssm.po.Contract;
import cn.itcast.ssm.po.ContractCourse;
import cn.itcast.ssm.po.ContractUserInfo;
import cn.itcast.ssm.po.Course;
import cn.itcast.ssm.po.CtMoreInfo;
import cn.itcast.ssm.po.SysEmp;
import cn.itcast.ssm.po.UserInfo;
import cn.itcast.ssm.po.UserInfo;
import cn.itcast.ssm.service.ContractService;
import cn.itcast.ssm.service.CourseService;
import cn.itcast.ssm.service.EmpRoleService;
import cn.itcast.ssm.service.UserInfoService;
import cn.itcast.ssm.service.UserInfoService;

@Controller
public class ContractController{
	@Autowired
	private ContractService contractService;
	
	@Resource
	CourseService courseService;
	
	@Resource
	UserInfoService userInfoService;
	
	@Resource
	EmpRoleService empRoleService;
	

	@RequestMapping("/listCtTable")
	public String listCtTable() {
		return "listCtTable1";
	}
	
	 //按照不同条件组合查询合同，执行合同操作使用
	@RequestMapping("/ctOperate")
	@RequiresPermissions("teachmgt:teachcontract:view")
	public String ctOperate(Model model, Contract contract,String mname,String cname,String ctbegin,String ctend) {
	
		Map<String,Object> map=this.ContracttoMap(contract);              //将contract实体接收的参数，放置到map数据集中
		if(cname!=null&&!cname.equals(""))
		     {map.put("cname","%"+cname+"%");  }
		if(mname!=null&&!mname.equals(""))
	     {map.put("mname","%"+mname+"%");  }
		if(ctbegin!=null&&!ctbegin.equals("")) 
			 {map.put("ctbegin", ctbegin);}
		if(ctend!=null&&!ctend.equals("")) 
			 {map.put("ctend", ctend);}
		if(!(map.get("ctteacher")!=null||map.get("ctid")!=null||map.get("ctcoursetype")!=null||map.containsKey("cname")||
				map.containsKey("mname")||map.containsKey("ctbegin")||map.containsKey("ctend"))) {
			map.put("index", 50);
		}
		List<Contract> contractList=contractService.findBy(map);
		
		model.addAttribute("contract",contract);
		model.addAttribute("ctbegin", ctbegin);
		model.addAttribute("ctend", ctend);
		model.addAttribute("cname",cname);
		model.addAttribute("username", mname);
		if(contractList.size()<1) {
			model.addAttribute("resultMessage","搜索结果为空！请更换条件重试！！");
		}else {
			model.addAttribute("contractList", contractList);
		    Map<String,Object> map1 =new HashMap<String,Object>();
		if(map.get("ctteacher")!=null&&(map.containsKey("ctbegin")||map.containsKey("ctend"))) {		//判断查询条件，是否为报表查询
			map1.put("ctteacher",contract.getCtteacher());
			map.put("ctbegin",ctbegin);
			map.put("ctend",ctend);
			model.addAttribute("resultMessage","教练【"+contract.getCtteacher()+ "】在该时间段上课总计【"+contractService.getRecordByConditon(map1)+"】个课时");
			return "listCtTable1";
		}
		else if(map.containsKey("cname")&&(map.containsKey("ctbegin")||map.containsKey("ctend"))) {       //判断查询条件，是否为报表查询
			map1.put("cname",cname);
			map.put("ctbegin",ctbegin);
			map.put("ctend",ctend);
			model.addAttribute("resultMessage","【"+cname+"】课程在该时间段上课总计【"+contractService.getRecordByConditon(map1)+"】个课时");
			return "listCtTable1";
		}else {
			
			model.addAttribute("resultMessage","共搜索到  "+contractList.size()+"  条记录");            //添加合同总数数据
		}
		}
		return "findContract1";       ////////////////////////////////////////
	}	
	
	   //按照不同条件组合查询合同，作为合同查询使用
		@RequestMapping("/findBy")
		@RequiresPermissions("teachmgt:teachcontract:view")
		public String findBy(Model model, Contract contract,String mname,String cname,String ctbegin,String ctend) {
		
			Map<String,Object> map=this.ContracttoMap(contract);
			if(cname!=null&&!cname.equals(""))
			     {map.put("cname","%"+cname+"%");  }
			if(mname!=null&&!mname.equals(""))
		     {map.put("mname","%"+mname+"%");  }
			if(ctbegin!=null&&!ctbegin.equals("")) 
				 {map.put("ctbegin", ctbegin);}
			if(ctend!=null&&!ctend.equals("")) 
				 {map.put("ctend", ctend);}
			if(!(map.get("ctteacher")!=null||map.get("ctid")!=null||map.get("ctcoursetype")!=null||map.containsKey("cname")||
					map.containsKey("mname")||map.containsKey("ctbegin")||map.containsKey("ctend"))) {
				map.put("index", 50);
			}
			List<Contract> contractList=contractService.findBy(map);
			
			model.addAttribute("contract",contract);
			model.addAttribute("ctbegin", ctbegin);
			model.addAttribute("ctend", ctend);
			model.addAttribute("cname",cname);
			model.addAttribute("username", mname);
			if(contractList.size()<1) {
				model.addAttribute("resultMessage","搜索结果为空！请更换条件重试！！");
			}else {
				model.addAttribute("contractList", contractList);
				model.addAttribute("resultMessage","共搜索到  "+contractList.size()+"  条记录");
			}
			return "findContract2";       ////////////////////////////////////////
		}	
		
		private Map<String,Object> ContracttoMap(Contract contract){
			Map<String,Object> map =new HashMap<String,Object>();
			
			map.put("ctteacher",checkStringIsEmpty(contract.getCtteacher()));
			map.put("ctid",checkStringIsEmpty(contract.getCtid()));
			map.put("ctcoursetype",checkStringIsEmpty(contract.getCtcoursetype()));
			return map;
		}
		private String checkStringIsEmpty(String param) {
			return param==null?null:(param.equals("")?null:param);  
		}

	 //	展示查到的某合同的具体信息（合同课程信息，会员信息），并允许执行刷课转课操作
	@RequestMapping("/showMoreInfo")
	public  String  showMoreInfo(Model model,int ctid){
		List<CtMoreInfo> showMoreCtInfoList=contractService.showMoreCtInfo(ctid);
		List<CtMoreInfo> showMoreMemInfoList=contractService.showMoreMemInfo(ctid);
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("ctid", ctid);
		List<Contract> contractList=contractService.findBy(map);
		
		model.addAttribute("contractList", contractList);
		model.addAttribute("showMoreCtInfoList", showMoreCtInfoList);    //区别modelandview用法
		model.addAttribute("showMoreMemInfoList", showMoreMemInfoList);
		model.addAttribute("ctcoursetype",contractList.get(0).getCtcoursetype().equals("私课")?null:"组课");  //从集合中取出合同，再取出类型，因为前面查询条件是ctid,所以唯一。按下标取出contract,访问属性	
		return "moreCtInfo1";			////////////////////////////////////////////
	
	}
//	展示查到的某合同的具体信息（合同课程信息，会员信息）
	@RequestMapping("/showMoreInfoIgnoreEdit")
	public  String  showMoreInfoIgnoreEdit(Model model,int ctid){
		List<CtMoreInfo> showMoreCtInfoList=contractService.showMoreCtInfo(ctid);
		List<CtMoreInfo> showMoreMemInfoList=contractService.showMoreMemInfo(ctid);
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("ctid", ctid);
		List<Contract> contractList=contractService.findBy(map);
		
		model.addAttribute("contractList", contractList);
		model.addAttribute("showMoreCtInfoList", showMoreCtInfoList);    //区别modelandview用法
		model.addAttribute("showMoreMemInfoList", showMoreMemInfoList);
		model.addAttribute("ctcoursetype",contractList.get(0).getCtcoursetype().equals("私课")?null:"组课");  //从集合中取出合同，再取出类型，因为前面查询条件是ctid,所以唯一。按下标取出contract,访问属性	
		return "moreCtInfo2";			////////////////////////////////////////////
	
	}
	
	// 对某一已上课程进行刷课
	@RequestMapping("/updateContract")
	@RequiresPermissions("teachmgt:teachcontract:brush")
	public  ModelAndView  updateContract(int ctid,String cname){
		contractService.updateContract(ctid,cname);		
		ModelAndView mav=new ModelAndView("moreCtInfo1");   ////////////////////////
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("ctid", ctid);
		List<Contract> contractList=contractService.findBy(map);
		int amountuse=1;
		contractService.insertCtRecord(ctid,contractList.get(0).getCtoperator(),contractList.get(0).getCtteacher(),cname,amountuse);
		List<CtMoreInfo> showMoreCtInfoList=contractService.showMoreCtInfo(ctid);  //对更新后数据重新查询
		List<CtMoreInfo> showMoreMemInfoList=contractService.showMoreMemInfo(ctid); //应考虑ajax,局部刷新？
		mav.addObject("contractList", contractList);
		mav.addObject("showMoreCtInfoList", showMoreCtInfoList);                    
		mav.addObject("showMoreMemInfoList", showMoreMemInfoList);
		mav.addObject("ctcoursetype",contractList.get(0).getCtcoursetype().equals("私课")?null:"组课");  //通过合同的课程类型属性，给私课赋值null,把数据传给页面，显示私课特有的转课，换教练
		return mav;
		
	}
	 // 会员间转课
	@RequestMapping("/contractTransCourse")
	@RequiresPermissions("teachmgt:teachcontract:transfer")
	public ModelAndView contractTransCourse(int ctid) {
		ModelAndView mav=new ModelAndView("transContract1");         /////////////////////////////
		Subject subject =SecurityUtils.getSubject();
		ActiveUser  activeUser=(ActiveUser) subject.getPrincipal();
		mav.addObject("name", activeUser.getUsername());
		mav.addObject("ctid",ctid);
		return mav;
	}
	@RequestMapping("/transContract")
	public ModelAndView transContract(HttpServletRequest request, HttpServletResponse response) {
		    ModelAndView mav=new ModelAndView("findContract1");            ////////////////////////
		    String ctid=request.getParameter("ctid");
		    String mname=request.getParameter("mname");
		    String mphone=request.getParameter("mphone");
		    String ctoperator=request.getParameter("ctoperator");
		    String ctpaystr=request.getParameter("ctpay");		    
		    /*if(mname==null||mname.equals("")||mphone==null||mphone.equals("")||ctoperator==null||ctoperator.equals("")||
		    		ctpaystr==null||ctpaystr.equals("")) {
		    	mav.addObject("resultMessage", ctid+"号合同 会员间转让课程失败！请重新尝试！");
		    	return mav;                  //失败的话直接返回主页，打印失败信息。不参与转课业务操作
		    }  */
		    Map<String,Object> parammid=new HashMap<>();
		    parammid.put("username",mname);
		    
		    if(!userInfoService.find(parammid).get(0).getPhone().equals(mphone)) {
		    	mav.addObject("resultMessage", ctid+"  号合同  会员间转让课程失败!   会员名,电话不匹配！重试！");
		    	return mav; 
		    }
		    
		    Float ctpay=Float.parseFloat(ctpaystr);  //不能先转为float再if判断，因为float不能做空值("")判断
		    Map<String,Object> map=new HashMap<>();   //放转让合同参数
		    map.put("ctid",ctid);
		    map.put("mname",mname);
		    map.put("mphone",mphone);
		    map.put("ctoperator",ctoperator);
		    map.put("ctpay",ctpay);
		    map.put("cttype","转让");
		    map.put("mid",userInfoService.find(parammid).get(0).getUserNumber());
		    contractService.contractTransCourse(map); 
		    map.clear();                         //清空
		    map.put("ctid", ctid);              //放置合同转让成功后，查找该合同的参数
		    mav.addObject("contractList", contractService.findBy(map));
		    mav.addObject("resultMessage","合同转让课程成功！");
			return mav;		
	}
	
	// 更换教练,合同页面添加教练悬浮窗，给出教练列表
	@RequestMapping("/getTeacherList")
	public @ResponseBody List<SysEmp> getTeacherList(@RequestBody String json) {
		Map<String,Object> param=new HashMap<String,Object>();
		param.put("rname","教练");		                     //设置查询参数为教练这一角色
		List<SysEmp> teacherList=null;
		if(!StringUtils.isNullOrEmpty(json)) {
			String teacher=JSONObject.parseObject(json).getString("teacher");		
			if(!StringUtils.isNullOrEmpty(teacher)) {         //传入教练名不为null或空，则按输入条件模糊查询，否则查询全部教练列表
				param.put("empName", "%"+teacher+"%");
				teacherList=empRoleService.findEmpnamesByRname(param);
			}
			else {				 
				 teacherList=empRoleService.findEmpnamesByRname(param);
			}  
		}              //合同类型为更换教练
		return teacherList;
	}
	
	//合同添加页面售卡人悬浮窗，给出售卡人列表。通过ajax,post请求
	@RequestMapping("/getSalerList")
	public @ResponseBody List<SysEmp> getSalerList(@RequestBody String json) {
		Map<String,Object> param=new HashMap<String,Object>();
		param.put("rname","售卡人");
		List<SysEmp> salerList=null;
		if(!StringUtils.isNullOrEmpty(json)) {
			String saler=JSONObject.parseObject(json).getString("saler");		
			if(!StringUtils.isNullOrEmpty(saler)) {
				param.put("empName", "%"+saler+"%");
				salerList=empRoleService.findEmpnamesByRname(param);
			}
			else {

				salerList=empRoleService.findEmpnamesByRname(param);
			}  
		}
		return salerList;
	}
		
	//获取get参数，执行更换教练操作，返回json
	@RequestMapping("/changeTeacher")
	@RequiresPermissions("teachmgt:teachcontract:changecoach")
	public void changeTeacher(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		    JSONObject  jsonObject=new JSONObject();
		    try {
		    String type="更换教练";
		    int ctid=Integer.parseInt(request.getParameter("ctid"));
		    String empName=(String)request.getParameter("empName");
		    Map<String,Object> map=new HashMap<>();   //放转让合同参数
		    map.put("ctid",ctid);
		    if(contractService.findBy(map).get(0).getCtteacher().equals(empName)) {  //按照ctid查找取出唯一合同教练名，和待更换教练名比较                                                                                                                      
		    	throw new  Exception("更换教练失败!");                               //校验是否已经更换了教练，若没有则手动抛异常
		    }
		    contractService.changeTeacher(ctid, empName,type);
		    jsonObject.put("message","更换教练成功!");
		    }catch(Exception e){
		    	jsonObject.put("message", e.getMessage());                  //打印异常信息
	            //jsonObject.put("status", "error");
		    }
		    response.setContentType("text/html;charset=utf-8");   //防止中文乱码
		    response.getWriter().print(jsonObject);  

	}
	
	//进入新建合同页面
	@RequestMapping("/editContract")
	@RequiresPermissions("teachmgt:teachcontract:add")
	public String editContract(Model model) {
		Subject subject =SecurityUtils.getSubject();
		ActiveUser  activeUser=(ActiveUser) subject.getPrincipal();
		model.addAttribute("tid", activeUser.getTid());
		model.addAttribute("name", activeUser.getUsername());
		return "editContract";
	}
	
	//新建合同，进行信息编辑
	@RequestMapping("/addContract")
	public String addContract(Model model,Contract contract,String [] courseIdArrays,String [] memberIdArrays,String [] camountArrays) {
		if(courseIdArrays==null||memberIdArrays==null||camountArrays==null||courseIdArrays.length==0||memberIdArrays.length==0||camountArrays.length==0){	    //确保合同信息，会员课程信息,课时数量已录入 再完成数据库提交，否则关联表为空
			model.addAttribute("resultMessage", "对不起,系统无法添加课程/会员!</br>请输入完整信息以办理合同!");    //先判断是否为null,因为有可能根本没点进编辑页面。不然会报错
			return "editContract";
		}
		if(contract.getCtcoursetype().equals("私课")&&(courseIdArrays.length>1||memberIdArrays.length>1)) {
			model.addAttribute("resultMessage", "对不起,多会员只支持办理【组课】合同!");   
			return "editContract";
		}
		contractService.addContract(contract);                      
		int currentIdTemp=contractService.maxCurrentId();
		String currentId=String.valueOf(currentIdTemp);
		for(int i=0;i<courseIdArrays.length;i++) {
			ContractCourse contractCourse=new ContractCourse();
			int number=Integer.parseInt(camountArrays[i].equals("")?"0":camountArrays[i]);
			contractCourse.setCamount(number);
			contractCourse.setCtid(currentId);
			contractCourse.setCid(courseIdArrays[i]);
			contractCourse.setTid(contract.getTid());
			contractCourse.setCamounttotal(number);
			contractService.insertMiddleContractCourse(contractCourse);			
		}
		for(int i=0;i<memberIdArrays.length;i++) {
			ContractUserInfo contractUserInfo=new ContractUserInfo();
			contractUserInfo.setCtid(currentId);
			contractUserInfo.setMemid(memberIdArrays[i]);
			contractService.insertMiddleContractUserInfo(contractUserInfo);
		}
		model.addAttribute("resultMessage", "添加成功！为您生成合同编号为:"+currentId);
		
		return "editContract";		
	}

	//编辑合同页面，提供课程搜索，不传值搜全部，传值按条件搜索。使用ajax交互
    @RequestMapping("/getCourseList")
    public  @ResponseBody List<Course> getCourseList(@RequestBody String json){
		Map<String,Object> param=new HashMap<String,Object>();
		List<Course> courseList=null;
		if(!StringUtils.isNullOrEmpty(json)) {
			String cname=JSONObject.parseObject(json).getString("cname");
			String ctype=JSONObject.parseObject(json).getString("ctype");
			
			if(!StringUtils.isNullOrEmpty(cname)) {
				param.put("cname", "%"+cname+"%");	
				courseList=courseService.listCourseByName(param);
			}
			else {
				 //int total = courseService.getTotal();
				 //courseList=courseService.list(0, total);
				param.put("ctype",ctype);				//	默认查找全部，但是以确定的合同类型为依据
				courseList=courseService.listCourseByName(param);
			}
		}
    	//List<Course> courseList=courseService.listCourseByName(param);
    	return courseList;
    	
    }
    
    // 编辑合同页面，提供会员搜索添加，不传值搜全部，传值按条件搜索。使用ajax交互
    @RequestMapping("/getUserInfoList")
    public  @ResponseBody List<UserInfo> getUserInfoList(@RequestBody String json){
		Map<String,Object> param=new HashMap<String,Object>();
		List<UserInfo> memberList=null;
		if(!StringUtils.isNullOrEmpty(json)) {
			String mname=JSONObject.parseObject(json).getString("mname");
			if(!StringUtils.isNullOrEmpty(mname)) {
				param.put("username", "%"+mname+"%");
				memberList=userInfoService.find(param);
			}else {
				int total = userInfoService.getTotal();
				 memberList=userInfoService.list(0, total);
			}
			
		}
		// memberList=memberService.listByCondition(param);	
		 return memberList;
    }
    
    //查询被数组记录下来的CheckBox选中课程
    @RequestMapping("/getCourseAndAmountList")
    public  @ResponseBody List<Map<String, Object>> getCourseAndAmountList(String [] arrays){
    	List<Map<String,Object>> courseList=new ArrayList<Map<String,Object>>();
		Map<String,Object> cMap=null;
		for(int i=0;i<arrays.length;i++) {
			cMap=new HashMap<String,Object>();
			String cid=arrays[i];

			Map<String,Object> param=new HashMap<>();
			param.put("cid",cid);
			cMap.put("course",courseService.listCourseByName(param));
			courseList.add(cMap);
		}
		return courseList;
    }
    
    //查询被数组记录下来的CheckBox选中会员
    @RequestMapping("/getUserInfoJsonList")
    public  @ResponseBody List<Map<String, Object>> getUserInfoJsonList(String [] arrays){
		
		List<Map<String,Object>> memberList=new ArrayList<Map<String,Object>>();
		Map<String,Object> mMap=null;
		for(int i=0;i<arrays.length;i++) {
			mMap=new HashMap<String,Object>();
			String mid=arrays[i];		

			Map<String,Object> param=new HashMap<>();
			param.put("userNumber",mid);
			mMap.put("member",userInfoService.find(param));
			memberList.add(mMap);
		}
		return memberList;
    }
    ///////////////////////////////////////////////////
    ///////////////////////////////////////////////////
    @RequestMapping("/getTeacherList1")
	public @ResponseBody List<SysEmp> getTeacherList1(String empName) {
		Map<String,Object> param=new HashMap<String,Object>();
		param.put("rname","教练");		
		List<SysEmp> teacherList=null;
		if(empName==null||empName.equals("")) {
			 teacherList=empRoleService.findEmpnamesByRname(param);
		}
		else {				 
			param.put("name", "%"+empName+"%");
			teacherList=empRoleService.findEmpnamesByRname(param);
		}  
		return teacherList;
	}
    
    @RequestMapping("/updateContract1")
	public  @ResponseBody List<CtMoreInfo>  updateContract1(int ctid,String cname){
		contractService.updateContract(ctid,cname);		
		
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("ctid", ctid);
		List<Contract> contractList=contractService.findBy(map);
		int amountuse=1;
			contractService.insertCtRecord(ctid,contractList.get(0).getCtoperator(),contractList.get(0).getCtteacher(),cname,amountuse);//打印刷课记录
		List<CtMoreInfo> showMoreCtInfoList=contractService.showMoreCtInfo(ctid);  //对更新后数据重新查询
		
		
		return showMoreCtInfoList;
		
	}
}