package cn.itcast.ssm.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.mysql.jdbc.StringUtils;
import cn.itcast.ssm.po.Course;
import cn.itcast.ssm.po.SysEmp;
import cn.itcast.ssm.service.CourseService;

@Controller

public class CourseController{
	
		@Autowired
		private CourseService courseService;
	
		@RequestMapping("/find")
		public String find() {
			return "first";
		}

	    /////////////////////////////////////
	    @RequestMapping("/listCourse1")
	    //展示所有课程信息列
	    public @ResponseBody List<Course> listCourse1(){
	    	int total = courseService.getTotal();
	    	List<Course> courseList = courseService.list(0, total);
	    	return courseList;
	    }
	    ////////////////////////////////////
	    @RequestMapping("/getCourses")
	    public String getCourses() {
	    	return "listCourse1";
	    }
	    ////////////////////////////////////
	    //增加课程，将获取的前台参数存入course对象属性中，执行insert
	    @RequestMapping("/addCourse1")
	    @RequiresPermissions("teachmgt:course:add")
		  public  @ResponseBody String addCourse1(HttpServletRequest request, HttpServletResponse response) {
				 
		        Course cs=new Course();

		        String tid = request.getParameter("tid");
		        String cname = request.getParameter("cname");
		        String cinfo = request.getParameter("cinfo");
		        String ctype = request.getParameter("ctype");
		        String clevel=request.getParameter("clevel");
		        String cpay=request.getParameter("cpay");
		        cs.setTid(tid);       
		        cs.setCname(cname);
		        cs.setCinfo(cinfo);
		        cs.setCtype(ctype);
		        cs.setClevel(clevel);
		        cs.setCpay(cpay);
		        courseService.addCourse(cs);
		        return "success";
		  }
	    /////////////////////////////////////
	    //删除课程
	    @RequestMapping("/deleteCourse1")
	    @RequiresPermissions("teachmgt:course:delete")
	    public @ResponseBody String deleteCourse1(int cid) {
	        courseService.deleteCourse(cid);        
	        return "success";
	    }
	    //编辑课程
	    @RequestMapping("/editCourse1")
	    @RequiresPermissions("teachmgt:course:update")
	   	public @ResponseBody String editCourse1(HttpServletRequest request, HttpServletResponse response) {
	   	     Course cs=new Course();
	   	     
	   	     int cid=Integer.parseInt(request.getParameter("cid"));
		     String tid = request.getParameter("tid");
		     String cname = request.getParameter("cname");
	    	 String cinfo = request.getParameter("cinfo");
		     String ctype = request.getParameter("ctype");
		     String clevel=request.getParameter("clevel");
		     String cpay=request.getParameter("cpay");
	         
	         cs.setCid(cid);
		     cs.setTid(tid);       
		     cs.setCname(cname);
		     cs.setCinfo(cinfo);
		     cs.setCtype(ctype);
		     cs.setClevel(clevel);
		     cs.setCpay(cpay);
		       
		     courseService.updateCourse(cs);
		        
			return  "success";
	    }
	    //查询特定课程，按课程名
	    @RequestMapping("/findCourse1")
		public @ResponseBody List<Course> findCourse1(String cname) {
		    Map<String,Object> param=new HashMap<String,Object>();
		    param.put("cname","%"+cname+"%");
			List<Course> courseList= courseService.listCourseByName(param);
			return courseList;
	    }
	   
	    //展示所有团课类型课程，团课发布时调用
	    @RequestMapping("/listCourseTable")
	    public ModelAndView listCourseTable() {
	    	Map<String,Object> param=new HashMap<String,Object>();
		    param.put("ctype","团课");                   //添加课程类型为查询参数，只查询团课
			List<Course> multiCourseList= courseService.listCourseByName(param);
			ModelAndView mav=new ModelAndView("courseTable");
	    	mav.addObject("multiCourseList", multiCourseList);
	    	return mav;
	    }
}